%==================================================================
%==========================User Interface==========================
%==================================================================
%I am used to the x-z coordinate System
zMax = 400;
%Width and height of a standart button
standartButton = [100,50];
%Parent figure
fig = uifigure;

setSliderVal(50);


%======ENGINES====== 
uipanel(fig,'Title','Motors','position',[220,zMax - 240,110,255]);
runEngineA = uibutton(fig,'push','Text','A','position',[225,zMax- 70,standartButton],'ButtonPushedFcn',@(runningEngineA,event) runEngine('A'));
runEngineB = uibutton(fig,'push','Text','B','position',[225,zMax - 125,standartButton],'ButtonPushedFcn',@(runningEngineB,event) runEngine('B'));
runEngineC = uibutton(fig,'push','Text','C','position',[225,zMax - 180,standartButton],'ButtonPushedFcn',@(runningEnginC,event) runEngine('C'));
runEngineD = uibutton(fig,'push','Text','D','position',[225,zMax - 235,standartButton],'ButtonPushedFcn',@(runningEngineD,event) runEngine('D'));
runTestProgram = uibutton(fig,'push','Text','Test Program','position',[20,zMax - 390,standartButton],'ButtonPushedFcn',@(runningEngineD,event) runEngine('testProgram'));
%Speed Slider
speedSliderPanel = uipanel(fig,'Title','Motor speed %','position',[170,zMax-325,210,80]);
speedSlider = uislider(fig,'Position',[183,zMax-280,180,3],'Limits',[-100,100],'MajorTicks',[-100,-50,0,50,100],'ValueChangedFcn',@(speedSlider,event) sliderCallback(speedSlider));
speedSlider.Value = 50;
%======Connections======
uipanel(fig,'Title','Connections','position',[15, zMax- 195,110,210]);
bluetoothConnect = uibutton(fig,'push','Text','via Bluetooth','position',[20, zMax- 70, standartButton],'ButtonPushedFcn',@(bluetoothConnect,event)btConnect());
usbConnect =   uibutton(fig,'push','Text','via USB','position', [20,zMax - 130, standartButton],'ButtonPushedFcn',@(usbConnect,event)usbConnectFunc());       
ethernetConnect = uibutton(fig,'push','Text','via Ethernet','position',[20,zMax - 190,standartButton],'ButtonPushedFcn',@(ethernetConnect,event)ethConnect());
%======Sensors====== 
sensorPanel=uipanel(fig,'Title','Sensors','position',[400, zMax - 190, 150,205 ]);
uipanel(fig,'Title','Proximity','Position',[413,zMax - 70 ,125,50]);
sensor1 = uilabel(fig,'Text','Sensor 1','Position' ,[418,zMax - 80, standartButton],'FontSize',14);
uipanel(fig,'Title','Ultrasonic','Position',[413,zMax - 125,125,50]);
sensor2 = uilabel(fig,'Text','Sensor 2','Position',[418,zMax - 135,standartButton],'FontSize',14);
uipanel(fig,'Title','Gyrosensor','Position',[413,zMax - 180,125,50]);
sensor3 = uilabel(fig,'Text','Sensor 3','Position',[418,zMax - 190,standartButton],'FontSize',14);
setSensors(sensor3,sensor2,sensor1);

function ret = getSensors
global sensor_labels;
ret = sensor_labels;
end
function setSensors(sensor3,sensor2,sensor1)
global sensor_labels;
sensor_labels = [sensor3,sensor2,sensor1];
end

%==================================================================
%==========================Functions===============================
%==================================================================
%Slider callback and getter and setter
 function setSliderVal(val)
 global sliderVal;
 sliderVal = val;
 end
 
 function ret = getSliderVal
 global sliderVal;
 ret = sliderVal;
 end
 
  function sliderCallback(sld)
setSliderVal( round(sld.Value));
  end
 
%getter and setter and DELETE for LEGO object 
 
 function setLego(val)
 global Lego;
 Lego = val;
 end
 
 function clearLego()
 global Lego;
 delete(Lego);
 end
 
 function ret = getLego
 global Lego;
 ret = Lego;
 end

%Sensors
function startTimer()
sensorTimer = timer('ExecutionMode','fixedSpacing','TimerFcn',@(~,~)readSensors()); 
sensorTimer.start();
end
function readSensors()
 sensors = getSensors;
 sensors(1).Text = readGyro();
 sensors(2).Text = readUS();
 sensors(3).Text = readProx();
end
function ret = readGyro
mygyrosensor = gyroSensor(getLego);  % Gyro definieren
angle = readRotationAngle(mygyrosensor); % Gyro auslesen
rate = readRotationRate(mygyrosensor);      % Winkelgeschw. in °/s
resetRotationAngle(mygyrosensor);        % Gyro reseten
ret = [num2str(angle),' °',num2str(rate),' °/s'];
end

function ret = readProx
mytouchsensor = touchSensor(getLego);% Taster definieren
if(readTouch(mytouchsensor))% Taster Zustand
    ret = 'Pressed';
else
    ret = 'Not Pressed';
end
end

function ret = readUS
mysonicsensor = sonicSensor(getLego);      %US Sensor definieren
ret = [num2str( readDistance(mysonicsensor)),' m']; %US Sensor auslesen [meter]
end
%engines
 

function runEngine(atOutput)
mymotor = motor(getLego,atOutput); % Verbindung zum Motor erstellen ( Motor Anschluss A)
mymotor.Speed = getSliderVal;       % geschwindigkeit angeben (-100 bis +100)
start(mymotor)            % Start Motor
pause(1)                  
stop(mymotor)             % Stop Motor
end
%connections
function btConnect()
clearLego();
deviceInfo = instrhwinfo('Bluetooth','EV3'); % ID vom Bluetooh Ger�t
id=deviceInfo.RemoteID(9:end); %Remote id, nur letzten 12 Zeichen!

% Kommunikation zum LegoEV definieren(Bluetooth)
if ((exist ('myev3'))==0)% Wenn Verbindung nicht vorhanden..
   setLego ( legoev3('bt',id)); % ... dann Verbindung aufbauen.
end
  playTone(getLego,2000,0.2,60)  %Ton, Verbindung ist da!
  disp('Verbindung zum EV3 �ber Bluetooth ist aufgebaut')
end

function usbConnectFunc()
clearLego();
a=exist ('Lego');      % ist die Verbindung schon vorhanden?
if a==0;               % wenn keine Verbindung dann Verbindung aufbauen
   setLego(legoev3('usb')); % Verbindung aufbauen 
   
   for n=1:1:3
       playTone(getLego,2000,0.1,50);% Ton abspielen playTone(myev3,freq,duration,volume)
       pause(0.2)
   end
   if  exist ('Lego')
       if exist('LegoBild.jpg', 'file');  % Brick Bild vorhanden?
       bild=(imread('LegoBild.jpg'));  % Brick Bild lesen
       else
       bild = ones(1,1,3);   % weisses Quadrat
       end
   h=msgbox({'   Matlab < USB > Lego Brick' '' 'Verbindung wurde erfolgreich durchgeführt !'},... % Meldungsfenster
         'USB - Verbindung ','custom',bild); 
   end
else
    if exist('LegoBild.jpg', 'file');  % Brick Bild vorhanden?
    bild=(imread('LegoBild.jpg'));  % Brick Bild lesen
    else
    bild = ones(1,1,3);   % weisses Quadrat
    end
    h=msgbox({'    Verbindung schon vorhanden !'},... % Meldungsfenster
    'USB - Verbindung ','custom',bild);  
    playTone(Lego,1000,0.1,10);% Ton abspielen playTone(myev3,freq,duration,volume)
end
startTimer(); %start timer für Sensor auslese
end

function ethConnect()
disp('Connect via Ethernet');
end


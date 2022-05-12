% helloWorldButton = uibutton('push', 'ButtonPushedFcn',@(helloWorldButton,event) helloWorldButtonHandler());
% 
% function helloWorldButtonHandler()
% disp('Hello World');
% end
%I am used to the x-z coordinate System
zMax = 400;
%Width and height of a standart button
standartButton = [100,50];
%Parent figure
fig = uifigure;

%======ENGINES====== 
uipanel(fig,'Title','Engines','position',[220,zMax - 240,110,255]);
runEngineA = uibutton(fig,'push','Text','A','position',[225,zMax- 70,standartButton],'ButtonPushedFcn',@(runningEngineA,event) runEngine('A'));
runEngineB = uibutton(fig,'push','Text','B','position',[225,zMax - 125,standartButton],'ButtonPushedFcn',@(runningEngineB,event) runEngine('B'));
runEngineC = uibutton(fig,'push','Text','C','position',[225,zMax - 180,standartButton],'ButtonPushedFcn',@(runningEnginC,event) runEngine('C'));
runEngineD = uibutton(fig,'push','Text','D','position',[225,zMax - 235,standartButton],'ButtonPushedFcn',@(runningEngineD,event) runEngine('D'));
runTestProgram = uibutton(fig,'push','Text','Test Program','position',[20,zMax - 370,standartButton],'ButtonPushedFcn',@(runningEngineD,event) runEngine('testProgram'));
%======Connections======
uipanel(fig,'Title','Connections','position',[15, zMax- 195,110,210]);
bluetoothConnect = uibutton(fig,'push','Text','via Bluetooth','position',[20, zMax- 70, standartButton],'ButtonPushedFcn',@(bluetoothConnect,event)btConnect());
usbConnect =   uibutton(fig,'push','Text','via USB','position', [20,zMax - 130, standartButton],'ButtonPushedFcn',@(usbConnect,event)usbConnectFunc());       
ethernetConnect = uibutton(fig,'push','Text','via Ethernet','position',[20,zMax - 190,standartButton],'ButtonPushedFcn',@(ethernetConnect,event)ethConnect());
%======Sensors====== 
%(Dont know why I did the buttons in relation to the
%panel and not to the coordinate system)
sensorPanel=uipanel(fig,'Title','Sensors','position',[400, zMax - 285, 150,300 ]);
uipanel(sensorPanel,'Title','Proximity','position',[13,220,125,50]);
sensor1 = uilabel(fig,'Text','Sensor 1','Position' ,[418,zMax - 75, standartButton],'FontSize',14);
uipanel(sensorPanel,'Title','Ultrasonic','Position',[13,165,125,50]);
sensor2 = uilabel(fig,'Text','Sensor 2','Position',[418,zMax - 130,standartButton],'FontSize',14);
uipanel(sensorPanel,'Title','Gyrosensor','Position',[13,110,125,50]);
sensor3 = uilabel(fig,'Text','Sensor 3','Position',[418,zMax - 185,standartButton],'FontSize',14);

function runEngine(atOutput)
%===DEBUG===
disp(atOutput);
end

function btConnect()
disp('connect via BT');
end

function usbConnectFunc()
disp('connect via USB');
end

function ethConnect()
disp('Connect via Ethernet');
end


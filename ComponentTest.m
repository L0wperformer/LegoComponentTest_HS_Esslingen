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
enginePanel = uipanel(fig,'Title','Engines','position',[220,zMax - 390,110,405]);
runEngineA = uibutton(fig,'push','Text','A','position',[225,zMax- 70,standartButton],'ButtonPushedFcn',@(runningEngineA,event) runEngine('A'));
runEngineB = uibutton(fig,'push','Text','B','position',[225,zMax - 170,standartButton],'ButtonPushedFcn',@(runningEngineB,event) runEngine('B'));
runEngineC = uibutton(fig,'push','Text','C','position',[225,zMax - 270,standartButton],'ButtonPushedFcn',@(runningEnginC,event) runEngine('C'));
runEngineD = uibutton(fig,'push','Text','D','position',[225,zMax - 370,standartButton],'ButtonPushedFcn',@(runningEngineD,event) runEngine('D'));
runTestProgram = uibutton(fig,'push','Text','Test Program','position',[20,zMax - 370,standartButton],'ButtonPushedFcn',@(runningEngineD,event) runEngine('testProgram'));
%======Connections======
connectionPanel = uipanel(fig,'Title','Connections','position',[15, zMax- 135,110,150]);
bluetoothConnect = uibutton(fig,'push','Text','via Bluetooth','position',[20, zMax- 70, standartButton],'ButtonPushedFcn',@(bluetoothConnect,event)btConnect());
usbConnect =   uibutton(fig,'push','Text','via USB','position', [20,zMax - 130, standartButton],'ButtonPushedFcn',@(usbConnect,event)usbConnectFunc());       
%======Sensors======
sensorPanel = uipanel(fig,'Title','Sensors','position',[400, zMax - 285, 150,300 ]);
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


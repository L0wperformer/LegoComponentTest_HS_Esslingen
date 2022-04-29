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
runEngineA = uibutton(fig,'push','Text','Run engine A','position',[225,zMax- 50,standartButton],'ButtonPushedFcn',@(runningEngineA,event) runEngine('A'));
runEngineB = uibutton(fig,'push','Text','Run engine B','position',[225,zMax - 150,standartButton],'ButtonPushedFcn',@(runningEngineB,event) runEngine('B'));
runEngineC = uibutton(fig,'push','Text','Run engine C','position',[225,zMax - 250,standartButton],'ButtonPushedFcn',@(runningEnginC,event) runEngine('C'));
runEngineD = uibutton(fig,'push','Text','Run engine D','position',[225,zMax - 350,standartButton],'ButtonPushedFcn',@(runningEngineD,event) runEngine('D'));
runTestProgram = uibutton(fig,'push','Text','Test Program','position',[20,zMax - 350,standartButton],'ButtonPushedFcn',@(runningEngineD,event) runEngine('testProgram'));
%======Connections======
bluetoothConnect = uibutton(fig,'push','Text','Connect via BT','position',[20, zMax- 50, standartButton],'ButtonPushedFcn',@(bluetoothConnect,event)btConnect());
usbConnect =   uibutton(fig,'push','Text','Connect via USB','position', [20,zMax - 100, standartButton],'ButtonPushedFcn',@(usbConnect,event)usbConnectFunc());       
%======Sensors======

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


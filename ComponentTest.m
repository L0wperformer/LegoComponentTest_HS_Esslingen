% helloWorldButton = uibutton('push', 'ButtonPushedFcn',@(helloWorldButton,event) helloWorldButtonHandler());
% 
% function helloWorldButtonHandler()
% disp('Hello World');
% end
%I am used to the x-z coordinate System
zMax = 400;
%Width and height of a standart button
standartButton = [100,40];
%Parent figure
fig = uifigure;

%======ENGINES======   
runEngineA = uibutton(fig,'push','Text','Run engine A','position',[20,zMax - 200,standartButton],'ButtonPushedFcn',@(runningEngineA,event) runEngine('A'));
runEngineB = uibutton(fig,'push','Text','Run engine B','position',[20,zMax - 250,standartButton],'ButtonPushedFcn',@(runningEngineB,event) runEngine('B'));
runEngineC = uibutton(fig,'push','Text','Run engine C','position',[20,zMax - 300,standartButton],'ButtonPushedFcn',@(runningEnginC,event) runEngine('C'));
runEngineD = uibutton(fig,'push','Text','Run engine D','position',[20,zMax - 350,standartButton],'ButtonPushedFcn',@(runningEngineD,event) runEngine('D'));
%======Connections======
bluetoothConnect = uibutton(fig,'push','Text','Connect via BT','position',[150, zMax- 50, standartButton],'ButtonPushedFcn',@(bluetoothConnect,event)btConnect());
usbConnect =   uibutton(fig,'push','Text','Connect via USB','position', [300,zMax - 50, standartButton],'ButtonPushedFcn',@(usbConnect,event)usbConnectFunc());       

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


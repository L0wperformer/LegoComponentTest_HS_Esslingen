helloWorldButton = uibutton('push', 'ButtonPushedFcn',@(helloWorldButton,event) helloWorldButtonHandler());

function helloWorldButtonHandler()
disp('Hello World');
end
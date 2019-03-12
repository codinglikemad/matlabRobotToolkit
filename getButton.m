function [rbuttCoorX,rbuttCoorY] = getButton(global_left, global_top, global_width, global_height,name)
% From CodingLikeMad Youtube Channel, 2019

%% Get the button coordinates.
findWindow = false;

[imgData] = takeScreenshot(global_left, global_top, global_width, global_height);
imshow(imgData)
h = questdlg(sprintf('Please select the corners of %s button', name),'Instructions', 'Ok');

while findWindow == false
    [rbutt_x,rbutt_y] = ginput(2);
    rbuttCoorX = (rbutt_x(2)+rbutt_x(1))/2;
    rbuttCoorY = (rbutt_y(2)+rbutt_y(1))/2;
    [imgData] = imgData(rbutt_y(1):rbutt_y(2), rbutt_x(1):rbutt_x(2),:);
    imshow(imgData)
    result = questdlg('Was this correct?', 'Instructions', 'No');
    switch result
        case 'Yes'
            findWindow = true;
        case 'No'
            [imgData] = takeScreenshot(global_left, global_top, global_width, global_height);
            imshow(imgData)
        case 'Cancel'
            error('Ending execution.');
    end            
end
end


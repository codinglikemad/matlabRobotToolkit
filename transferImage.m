function transferImage(global_left, global_top, global_width, global_height,img)
% From CodingLikeMad Youtube Channel, 2019
% Transfer an image from matlab to paint using the mouse

[rbuttCoorX,rbuttCoorY] = getButton(global_left, global_top, global_width, global_height, 'red');
[gbuttCoorX,gbuttCoorY] = getButton(global_left, global_top, global_width, global_height, 'green');
[bbuttCoorX,bbuttCoorY] = getButton(global_left, global_top, global_width, global_height, 'blue');

[imgData] = takeScreenshot(global_left, global_top, global_width, global_height);
imshow(imgData)
h = questdlg('Please select top left starting point','Instructions', 'Ok');

[work_x,work_y] = ginput(1);
work_left = work_x(1);
work_top = work_y(1);

[R,C,~] = size(img);
close all

robot = java.awt.Robot();
robot.delay(1000);
%% We click on the red button here twice - the first time is actually just to activate the screen.
robot.mouseMove( rbuttCoorX, rbuttCoorY );
robot.delay(200);
robot.mousePress( 16 );
robot.delay(200);
robot.mouseRelease( 16 );
robot.delay(200);
%% Transfer red coordinates

% click the red color button
robot.mouseMove( rbuttCoorX, rbuttCoorY );
robot.delay(200);
robot.mousePress( 16 );
robot.delay(200);
robot.mouseRelease( 16 );
robot.delay(200);

for ii = 1:C
    for jj = 1:R
        robot.mouseMove( work_left + ii - 1 , work_top + jj - 1 );
        if( img(jj,ii,1) >= 128 )
            robot.mousePress( 16 );
            robot.delay(1);
            robot.mouseRelease( 16 );
        end
        %robot.delay(1);                
    end
end

%% Transfer green coordinates

% click the green color button
robot.mouseMove( gbuttCoorX, gbuttCoorY );
robot.delay(200);
robot.mousePress( 16 );
robot.delay(200);
robot.mouseRelease( 16 );
robot.delay(200);

for ii = 1:C
    for jj = 1:R
        robot.mouseMove( work_left + ii - 1 + C, work_top + jj - 1 );
        if( img(jj,ii,2) >= 128 )
            robot.mousePress( 16 );
            robot.delay(1);
            robot.mouseRelease( 16 );
        end
        %robot.delay(1);                
    end
end

%% Transfer blue coordinates

% click the blue color button

robot.mouseMove( bbuttCoorX, bbuttCoorY );
robot.delay(200);
robot.mousePress( 16 );
robot.delay(200);
robot.mouseRelease( 16 );
robot.delay(200);

for ii = 1:C
    for jj = 1:R
        robot.mouseMove( work_left + ii - 1 + 2*C, work_top + jj - 1 );
        if( img(jj,ii,3) >= 128 )
            robot.mousePress( 16 );
            robot.delay(1);
            robot.mouseRelease( 16 );
        end
        %robot.delay(1);                
    end
end

end


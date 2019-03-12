function spirograph(global_left, global_top, global_width, global_height)
% From CodingLikeMad Youtube Channel, 2019

[rbuttCoorX,rbuttCoorY] = getButton(global_left, global_top, global_width, global_height, 'chosen color');

[imgData] = takeScreenshot(global_left, global_top, global_width, global_height);
imshow(imgData)
h = questdlg('Please select central starting point & outer & inner radius','Instructions', 'Ok');

[work_x,work_y] = ginput(3);
work_cx = work_x(1);
work_cy = work_y(1);

rad_out = sqrt( (work_x(1)-work_x(2)).^2 + (work_y(1)-work_y(2)).^2);
rad_in = sqrt( (work_x(1)-work_x(3)).^2 + (work_y(1)-work_y(3)).^2);

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

t=0;
x=int32(round(work_cx + rad_out*cos(t) + rad_in*cos( rad_out/rad_in*t )));
y=int32(round(work_cy + rad_out*sin(t) + rad_in*sin( rad_out/rad_in*t)));
robot.mouseMove( x, y);
robot.mousePress( 16 );

for t = 0:0.01:100
    x = round(work_cx + rad_out*cos(t) + rad_in*cos( rad_out/rad_in*t ));
    y = round(work_cy + rad_out*sin(t) + rad_in*sin( rad_out/rad_in*t ));
    robot.mouseMove( x, y );
end
robot.mouseRelease( 16 );

end
%SquaredDistance will calculate the SquaredDistance between two points in
%3D space.
%
%Inputs:  - x and y (Which are both 3D arrays representing individual
%         points in 3D space)
%
%Outputs: - DSqrt(The Squared Distance between both points)
%
%Author:  Miyyceo

function DSqrt = SquaredDistance(x, y)

%Calculates Square Distance
DSqrt = ((x(1) - y(1))^2 +(x(2) - y(2))^2 + (x(3) - y(3))^2);

end



% Copyright (C) 1993-2017, by Peter I. Corke
%
% This file is part of The Robotics Toolbox for MATLAB (RTB).
% 
% RTB is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% RTB is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
% 
% You should have received a copy of the GNU Leser General Public License
% along with RTB.  If not, see <http://www.gnu.org/licenses/>.
%
% http://www.petercorke.com

%%begin

% Forward kinematics is the problem of solving the Cartesian position and 
% orientation of a mechanism given knowledge of the kinematic structure and 
% the joint coordinates.
%
% We will work with a model of the Puma 560 robot
mdl_puma560

% Consider the Puma 560 example again, and the joint coordinates of zero,
% which are defined by the script

qz

% The forward kinematics may be computed using fkine() method of the
% p560 robot object

p560.fkine(qz)

% returns the homogeneous transform corresponding to the last link of the 
% manipulator

% fkine() can also be used with a time sequence of joint coordinates, or 
% trajectory, which is generated by jtraj()

t = [0:.056:2]; 	% generate a time vector
q = jtraj(qz, qr, t); % compute the joint coordinate trajectory

about q

% then the homogeneous transform for each set of joint coordinates is given by

T = p560.fkine(q);

about T

% where T is a vector of SE3 objects.
%
% For example, the first point is

T(1)

% and the tenth point is

T(10)

% the translational part of this can be extracted using the transl method
% which is a 36x3 matrix, one row per time step
p = T.transl;

subplot(3,1,1)
plot(t, p(:,1))
xlabel('Time (s)');
ylabel('X (m)')
subplot(3,1,2)
plot(t, p(:,1))
xlabel('Time (s)');
ylabel('Y (m)')
subplot(3,1,3)
plot(t, p(:,1))
xlabel('Time (s)');
ylabel('Z (m)')

% or we could plot X against Z to get some idea of the Cartesian path followed
% by the manipulator.

subplot(1,1,1)
plot(p(:,1), p(:,3));
xlabel('X (m)')
ylabel('Z (m)')
grid

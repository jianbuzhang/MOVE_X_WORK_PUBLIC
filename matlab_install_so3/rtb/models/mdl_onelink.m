%MDL_ONELINK Create model of a simple 1-link mechanism
%
% MDL_ONELINK is a script that creates the workspace variable tl which
% describes the kinematic and dynamic characteristics of a simple planar
% 1-link mechanism.
%
% Also defines the vector:
%   qz   corresponds to the zero joint angle configuration.
%
% Notes::
% - SI units are used.
% - It is a planar mechanism operating in the XY (horizontal) plane and is 
%   therefore not affected by gravity.
% - Assume unit length links with all mass (unity) concentrated at the joints.
%
% References::
%  - Based on Fig 3-6 (p73) of Spong and Vidyasagar (1st edition).  
%
% See also mdl_twolink, mdl_planar1, SerialLink.

% MODEL: generic, planar, 1DOF, standard_DH


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


a1 = 1;

onelink = SerialLink([
          Revolute('d', 0, 'a', a1, 'alpha', 0, 'standard')
    ], ...
    'name', 'one link');
qz = [0];
qn = [pi/6];

clear classes

W = diag([0.1, 1*pi/180].^2);
P0 = diag([0.005, 0.005, 0.001].^2);
V = diag([0.005, 0.5*pi/180].^2);

randinit
map = Map(20, 10);
veh = Vehicle(V);
RandomPath(veh, map.dim);
sensor = RangeBearingSensor(veh, map, W);
sensor.interval = 5;
ekf = EKF(veh, W, P0, sensor, W);

randinit
ekf.run(1000);



f1
clf
map.visualize()
veh.plot_xy('b');
ekf.plot_xy('r');
ekf.plot_ellipse([], 'k')
grid on
xyzlabel

f2
clf
ekf.plot_P()

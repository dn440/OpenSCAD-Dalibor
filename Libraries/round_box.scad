x = 40;
y = 60;
z = 20;

points = [
    [-x, -y, -z],
    [-x, -y, z],
    [-x, y, -z],
    [-x, y, z],
    [x, -y, -z],
    [x, -y, z],
    [x, y, -z],
    [x, y, z]];

hull() {
    for (p = points){
        translate(p) sphere(10);
    }
}

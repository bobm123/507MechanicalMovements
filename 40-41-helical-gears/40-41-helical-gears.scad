use <MCAD/involute_gears.scad>

$fn=48;
CIRCULAR_PITCH = 270;

gear1_teeth = 37;
gear2_teeth = 29;

translate([50, 0, 0]) rotate([0, -90, 0]) assembly40();
translate([ 0, 0, 0]) rotate([0, -90, 0]) assembly41();

module assembly40()
{
    rotate([  0, 0, 0]) gear1(-1);
    rotate([180, 0, 0]) gear1(-1);
    shaft();

    // Translate by the sum of the pitch radii
    translate([30.8333+24.1667, 0, 0]) {
        rotate([  0, 0, 0]) gear2(1);
        rotate([180, 0, 0]) gear2(1);
        shaft();
    }
}

module assembly41()
{
    rotate([  0, 0, 0]) gear1(-1);
    rotate([180, 0, 0]) gear1(1);
    shaft();

    // Translate by the sum of the pitch radii
    translate([31+24, 0, 0]) {
        rotate([  0, 0, 0]) gear2(1);
        rotate([180, 0, 0]) gear2(-1);
        shaft();
    }
}


module shaft()
{
    color("Grey") cylinder(h=40, r=5/2, center = true);
}


module gear1 (dir=1)
{
    twist=300;
    height=20;
    pressure_angle=30;

    gear (number_of_teeth=gear1_teeth,
        circular_pitch=300,
        pressure_angle=pressure_angle,
        clearance = 0.2,
        gear_thickness = height/2*.8,
        rim_thickness = height/2,
        rim_width = 5,
        hub_thickness = height/2*1.2,
        hub_diameter=15,
        bore_diameter=5,
        circles=circles,
        twist=dir*twist/gear1_teeth);

}

module gear2 (dir=1)
{
    twist=300;
    height=20;
    pressure_angle=30;

    gear (number_of_teeth=gear2_teeth,
        circular_pitch=300,
        pressure_angle=pressure_angle,
        clearance = 0.2,
        gear_thickness = height/2*.8,
        rim_thickness = height/2,
        rim_width = 5,
        hub_thickness = height/2*1.2,
        hub_diameter=15,
        bore_diameter=5,
        circles=circles,
        twist=dir*twist/gear2_teeth);

}

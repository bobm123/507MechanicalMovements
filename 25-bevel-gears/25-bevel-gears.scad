use <../MCAD/involute_gears.scad>

CIRCULAR_PITCH = 270;

gear1_teeth = 41;
gear2_teeth = 39;
axis_angle = 90;

outside_circular_pitch=500;
outside_pitch_radius1 = gear1_teeth * outside_circular_pitch / 360;
outside_pitch_radius2 = gear2_teeth * outside_circular_pitch / 360;
pitch_apex1=outside_pitch_radius2 * sin (axis_angle) +
	(outside_pitch_radius2 * cos (axis_angle) + outside_pitch_radius1) / tan (axis_angle);
cone_distance = sqrt (pow (pitch_apex1, 2) + pow (outside_pitch_radius1, 2));
pitch_apex2 = sqrt (pow (cone_distance, 2) - pow (outside_pitch_radius2, 2));

echo ("cone_distance", cone_distance);
pitch_angle1 = asin (outside_pitch_radius1 / cone_distance);
pitch_angle2 = asin (outside_pitch_radius2 / cone_distance);

echo ("pitch_angle1, pitch_angle2", pitch_angle1, pitch_angle2);
echo ("pitch_angle1 + pitch_angle2", pitch_angle1 + pitch_angle2);

bevel_gear1();
translate([pitch_apex2, 0, pitch_apex1]) rotate([0,-90,0]) bevel_gear2();

module shaft() {
    color("Grey") {
        translate([0,0,-15]) cylinder(h=40, r=5);
    }
}


module bevel_gear1() 
{
    intersection() {
        bevel_gear (
            number_of_teeth=gear1_teeth,
            cone_distance=cone_distance,
            pressure_angle=30,
            outside_circular_pitch=outside_circular_pitch,
            bore_diameter = 10,
            face_width=25,
            gear_thickness=5,
            finish=0
        );

        // Trim the back of the gear, todo:parameterize
        union() {
            $fn = gear1_teeth*2;
            translate([0,0,6]) 
                cylinder(h=14, r=outside_pitch_radius1+2);
            cylinder(h=6, r1=outside_pitch_radius1-4, r2=outside_pitch_radius1+2);
        }

    }

    difference() {
        translate([0,0, 0]) cylinder(h=20, r=11.5);
        translate([0,0,-1]) cylinder(h=22, r=5.0);
    }
}


module bevel_gear2() 
{
    intersection() {
        bevel_gear (
            number_of_teeth=gear2_teeth,
            cone_distance=cone_distance,
            pressure_angle=30,
            outside_circular_pitch=outside_circular_pitch,
            bore_diameter = 10,
            face_width=25,
            gear_thickness=4,
            finish=0
        );

        // Trim the back of the gear, todo:parameterize
        union() {
            $fn = gear2_teeth*2;
            translate([0,0,6]) 
                cylinder(h=14, r=outside_pitch_radius2+2);
            cylinder(h=6, r1=outside_pitch_radius2-4, r2=outside_pitch_radius2+2);
        }
    }

    difference() {
        translate([0,0, 0]) cylinder(h=20, r=11.5);
        translate([0,0,-1]) cylinder(h=22, r=5.0);
    }
}

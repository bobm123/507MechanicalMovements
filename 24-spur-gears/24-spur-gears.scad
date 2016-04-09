use <MCAD/involute_gears.scad>

$fn=48;
CIRCULAR_PITCH = 270;

BEARING608 = 22/2;

rotate([0,0, 36*$t]) 
    gear31();

// Translate by the sum of the pitch radii
translate([23.25+27, 0, 0]) 
    rotate([0,0, -31*$t+25])
        gear36();

module gear31()
{
    gear(
        number_of_teeth=31,
        circular_pitch = CIRCULAR_PITCH,
        pressure_angle=20,
        gear_thickness = 5.0,
        rim_thickness = 8.0,
        rim_width = 3.0,
        hub_thickness = 8.0,
        hub_diameter = BEARING608+6.0,
        bore_diameter = BEARING608,
        circles=0
    );
}

module gear36()
{
    gear(
        number_of_teeth=36,
        circular_pitch = CIRCULAR_PITCH,
        pressure_angle=20,
        gear_thickness = 5.0,
        rim_thickness = 8.0,
        rim_width = 3.0,
        hub_thickness = 8.0,
        hub_diameter = BEARING608+6.0,
        bore_diameter = BEARING608,
        circles=0
    );
}
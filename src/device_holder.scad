// copyright Free Beachler, Longevity Software LLC d.b.a. Terawatt Industries

facia_bottom_thickness = 12;
facia_side_thickness = 10;
mount_screw_diameter = 4.2;

vars=[
//[acerA100]
[128, 54, 23, 5, 0],	// length, height, depth, wall thickness, mount-tab-side
[180, 50, 23, 5, 0]	// length, height, depth, wall thickness, mount-tab-side
];

device = vars[1];

//acerA100();
tabletMount(device[0], device[1], device[2], device[3], device[4]);

module tabletMount(l, h, d, wt, mside = 1, fbt = facia_bottom_thickness, fst = facia_side_thickness, mdia1 = mount_screw_diameter) {
	rotate([90, 0, 0]) {
		difference() {
			cube([l, h, d]);
			translate([wt, wt, wt]) cube([l - wt * 2, h, d - wt * 2]);
			translate([wt * 1.5, -wt, wt * 1.5]) 
				cube([l - wt * 3, h, d - wt * 3]);
			translate([fst, fbt, wt + d / 2]) 
				cube([l - fst * 2, h, d - wt * 2]);
		}
		if (mside == 0) {
			difference() {
				translate([-20 + 1, 0, 0]) cube([20, 20, 10]);
				// mount tab screw hole
				translate([-20 / 2 + 1, 20 / 2, -5]) rotate([0, 0, 0]) cylinder(r = mdia1, h = 20, center = false, $fn = 50);
			}
		} else {
			difference() {
				translate([l - 1, 0, 0]) cube([20, 20, 10]);
				// mount tab screw hole
				translate([l - 1 + 20 / 2, 20 / 2, -5]) rotate([0, 0, 0]) cylinder(r = mdia1, h = 20, center = false, $fn = 50);
			}
		}
	}
}

module acerA100() {
  color([0, 0, 0]) cube([118, 194, 13]);
}

module asusTF101() {
  color([0, 0, 0]) cube([271.8, 170.2, 12.7]);
}
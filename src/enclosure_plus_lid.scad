// copyright Free Beachler, Longevity Software d.b.a. Terawatt Industries, 2013
// all rights reserved

box_with_inset_lid(3, 4, 21, 80 + 35 + 5, 56 + 5, true);

module box_with_inset_lid(bt, wt, h, w, l, hand) {
	difference() {
		box(bt, wt, h, w, l, hand);
		translate([-w / 2, 0, wt + 5 + 2]) usb_port_a();
		translate([w / 2 - 12 / 2 - wt - 3 / 2 - 19 / 4 + 0.5, l / 2, wt + 5 + 3]) rotate([0, 0, 90]) usb_twoport();
		// power port
		translate([-w / 2, l / 2 - wt - 8, 12 + 0.5]) rotate([0, 90, 0]) cylinder(r = 4, h = 10, center = true, $fn = 100);
		// holes for vinc 2
		translate([l / 2 - 5 / 2 + 18 / 2 + 23 / 2, -16 - wt / 2, -0.1]) cube([5, 46, 10]);
		translate([l / 2 - 5 / 2 + 18 / 2 - 3 / 2, -16 - wt / 2, -0.1]) cube([5, 46, 10]);
		// mount hole
		translate([l - 20, -24, 0]) cylinder(r = 1.8, h = 10, center = true, $fn = 100);
	}
	// wall 1
	translate([-w / 2 + wt / 2 + 65, -l / 2 + wt + 3, 1]) cube([3, 5, 10]);
	translate([-w / 2 + wt / 2 + 68, -5 / 2, 1]) cube([3, 5, 10]);
	inset_lid(wt, h, w, l);
	translate([w / 2 , l / 2 + 0.01, wt + 1]) vinc2();
		// mount plate
		difference() {
			translate([l - 2, -28, 0]) cube([10, 13, wt]);
			translate([l + 3, -24, 0]) cylinder(r = 1.8, h = 10, center = true, $fn = 100);
		}
}

module box(bt, wt, h, w, l) {
	difference() {
		hull() {
			minkowski() {
				translate([-w / 2 + 1, -l / 2 + 1, 0]) cube([w - 1 * 2, l - 1 * 2, bt]);
				cylinder(r = 1, h = 0.01, center = false, $fn = 100);
			}
			translate([-w / 2, -l / 2, bt]) cube([w, l, h]);
		}
		// rounded corners inside
		minkowski() {
			translate([-w / 2 + wt / 2 + 1, -l / 2 + wt / 2 + 1, bt]) cube([w - wt - 1 * 2, l - wt - 1 * 2, h + bt + wt]);
			cylinder(r = 1, h = 0.01, center = false);
		}
	}
}

module inset_lid(wt, h, w, l) {
	translate([-w / 2 + 1, l / 2 + 5, 0]) {
		minkowski() {
			union() {
				cube([w - 1 * 2 - 0.1, l - 1 * 2 - 0.1, 2]);
				translate([wt / 2 + 1 / 2, wt / 2 + 0.5 / 2, 1]) cube([w - wt - 1 * 2 - 1, l - wt - 1 * 2 - 1, 2]);
			}
			cylinder(r = 1, h = 0.01, center = false);
		}
	}
}

module usb_port_a() {
	translate([-20 / 2, -15 / 2, -8 / 2]) rotate([0, 0, 0]) cube([20, 15, 5 + 3]);
}

module usb_port_b() {
	translate([-20 / 2, -12 / 2, -12 / 2]) rotate([0, 0, 0]) cube([20, 12, 13]);
}

module usb_twoport() {
	translate([-20 / 2, -15 / 2, -14 / 2]) rotate([0, 0, 0]) cube([20, 15, 18]);
}

module translator() {
	translate([-11 - 3 / 2, -19 - 3 / 2, -5 / 2]) {
		difference() {
			cube([11 + 3, 19 + 3, 5]);
			translate([3 / 2, 3 / 2, 0]) cube([11, 19, 5 + 0.1]);
		}
	}
}

module cp2102() {
	translate([-25 - 3 / 2, -35 - 3 / 2, -5 / 2]) {
		difference() {
			cube([25 + 3, 35, 5]);
			translate([3 / 2, 3 / 2, 0]) cube([25, 35, 5 + 0.1]);
		}
	}
}

module vinc2() {
	translate([-25, -49 - 3 / 2 - 0.1, -5 / 2]) {
% translate([0.5, 0, 0]) cube([18, 48, 2]);
		difference() {
			translate([-3, 0, 0]) cube([19 + 3 * 2, 49, 5]);
			translate([0, 3 / 2, 0]) cube([19, 49, 5 + 0.1]);
		}
	}
}
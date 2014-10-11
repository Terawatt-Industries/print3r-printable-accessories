// copyright Free Beachler, Longevity Software d.b.a. Terawatt Industries, 2013
// all rights reserved

use <adapter_board_3d_pcb.scad>

width = 37.465 + 4;
length = 58.42 + 4;
height = 29;
wall_thickness = 2.5;
mnt_dia = 4.2;
roundness = 2;

p3r_enclosure();
% translate([wall_thickness + 4 / 2, wall_thickness + 4 / 2, wall_thickness]) p3r_pcb();

module p3r_enclosure(w = width, l = length, h = height, wt = wall_thickness, hand = 0, rund = roundness) {
	assign(twt = wt - rund) {
		p3r_enclosure_base(w, l, h / 2, wt, hand, rund);
		translate([w * 2 + 20, 0, 0])
				p3r_enclosure_lid(w, l, h / 3, wt, hand);
	}
}

module p3r_enclosure_base(w = width, l = length, h = height, wt = wall_thickness, hand = 0, rund = roundness) {
	difference() {
		translate([rund / 2, rund / 2, 0])
		minkowski() {
			cube([w + wt * 2 - rund, l + wt * 2 - rund, h + wt]);
			cylinder(r = rund / 2, h = 0.01, center = false, $fn = 50);
		}
		translate([wt, wt, wt]) 
			cube([w, l, h + wt]);
		// lid cavity
		translate([wt * 3/8, wt * 3/8, h * 2/3 - 1]) 
			cube([w + wt * 5/4, l + wt * 5/4, h + wt]);
		// usb ports
		translate([wt + w / 2 - 16.5 / 2, -wt / 2, wt + 1])
			usb_port_a();
		translate([wt + w / 2 - 16.5 / 2, l + wt / 2, wt + 1])
			usb_port_a();
		// power in port
		translate([w - wt, l + wt - 3.175 - 10 - 3, wt + 1])
			cube([10, 10, h * 2]);
		// power out port
		translate([0 - 1, wt + 15.24 + 3, wt + 1])
			cube([10, 10, h * 2]);
	}
	// mount tab
	translate([w + wt - 20 / 2 - 1, l + wt - 1, 0]) {
	difference() {
		union() {
			translate([-10, 0, 0])
				cube([20, 10, wt]);
			translate([0, 10, 0])
				cylinder(r = 10, h = wt, center = false, $fn = 50);
		}
		translate([0, 10, -0.1])
			cylinder(r = mnt_dia / 2, h = h, center = false, $fn = 50);
	}
	}
}

module p3r_enclosure_lid(w = width, l = length, h = height, wt = wall_thickness, hand = 0, rund = roundness) {
	mirror([-1, 0, 0]) {
	difference() {
		translate([rund / 2, rund / 2, 0])
		minkowski() {
			cube([w + wt * 2 - rund, l + wt * 2 - rund, h + wt]);
			cylinder(r = rund / 2, h = 0.01, center = false, $fn = 50);
		}
		translate([wt, wt, wt]) 
			cube([w, l, h + wt]);
		// lid lip
		difference() {
			translate([-wt, -wt, wt]) 
				cube([w + wt * 4, l + wt * 4, h + wt]);
			// subtract lid cavity
			translate([wt - wt * 3/8, wt - wt * 3/8, wt]) 
				cube([w + wt * 3/4, l + wt * 3/4, h + wt]);
		}
		// usb ports
		translate([wt + w / 2 - 16.5 / 2, -wt / 2, h - wt])
			usb_port_a();
		translate([wt + w / 2 - 16.5 / 2, l + wt / 2, h - wt])
			usb_port_a();
		// power in port
		translate([w - wt, l + wt - 3.175 - 10 - 3, wt + 1])
			cube([10, 10, h * 2]);
		// power out port
		translate([0 - 1, wt + 15.24 + 3, wt + 1])
			cube([10, 10, h * 2]);
		// led port
		translate([w - wt - 2 + rund, 5, -1])
			minkowski() {
				cube([3 - rund, 15 - rund, 20]);
				cylinder(r = rund / 2, h = 0.01, center = false, $fn = 50);
			}
//			scale([0.25, 0.25, 10])
//				import("tw_logo_0.1_3D.stl", convexity=50);
	}
	}
}

module usb_port_a(wt = wall_thickness * 2) {
	cube([16.5, wt, 50 + 3]);
}

module p3r_board_dim(w = width, l = length) {
	% cube([w, l, 3]);
}
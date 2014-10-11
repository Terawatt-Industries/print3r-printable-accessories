$fn = 100;
o = 0.01;
width = 37.465;
length = 58.42;
height = 29;
pcb_thickness = 1.5;
mnt_dia = 4.2;
roundness = 2;

p3r_pcb();

module p3r_pcb(w = width, l = length, th = pcb_thickness) {
	color([0.0, 0.9, 0.6]) cube([w, l, th]);
	color([0.5, 0.5, 0.9]) translate([w / 2, 0, th - o]) rotate([0, 0, 180]) usb_port_a();
	color([0.9, 0.5, 0.5]) translate([w / 2, l, th - o]) rotate([0, 0, 0]) usb_port_a();
	color([0.8, 0.4, 0.4]) translate([w, l - 9, th - o]) rotate([0, 0, 90]) pwr_jack_5mm();
	color([0.4, 0.4, 0.8]) translate([0, 21, th - o]) rotate([0, 0, -90]) pwr_jack_5mm();
	translate([w / 2, l / 2, th - o]) chips();
	translate([4.5, 18, th - o]) debug_header();
}

module usb_port_a() {
	 
	translate([-15 / 2, -15 / 2, 0]) 
	difference() {
		cube([15, 15, 5]);
		translate([0.5, 5, 0.5]) cube([14, 15, 4]);
	}
}

module pwr_jack_5mm() {
	translate([-10 / 2, -10 / 2, 0]) {
	difference() {
		union() {
			cube([9, 3.5, 11]);
			translate([0, 3.5 - o, 0])
				cube([9, 11, 6.5]);
			translate([9 / 2, 14.5 - o, 6.5])
				rotate([90, 0, 0]) cylinder(r = 4.5, h = 11 + o);
		}
		// bore for 5mm jack
		translate([9 / 2, 11 - o, 6.5])
			rotate([90, 0, 0]) cylinder(r = 3.25, h = 11);
	}
	// power peg
	color([0.95, 0.95, 0.95]) translate([9 / 2, 11 - o, 6.5])
		rotate([90, 0, 0]) cylinder(r = 1, h = 10 + o);
	}
}

module chips() {
	color([0, 0, 0]) {
		translate([-8, 3.5, 0]) 
		cube([10, 10, 1]);
		translate([6, 5, 0]) 
		cube([3, 4, 1]);
		translate([-5, -15, 0]) 
		cube([4, 4, 1]);
		translate([8, -9, 0]) 
		cube([7, 6, 1]);
		translate([-17, 20, 0]) 
		cube([7, 6, 1]);
	}
	// leds
	translate([15, -19, 0])
		color([1, 0, 0]) cube([2, 2, 1]);
	translate([15, -22, 0])
		color([1, 1, 0]) cube([2, 2, 1]);
	translate([15, -25, 0])
		color([0, 1, 0]) cube([2, 2, 1]);
	translate([15, -28, 0])
		color([0.95, 0.95, 1]) cube([2, 2, 1]);
}

module debug_header() {
	translate([-3.5 / 2, (2.54 * 6 + 4) / 2, 0]) 
	color([0, 0, 0]) {
		cube([3.5, 2.54 * 6 + 4, 3]);
	}
}
// copyright Free Beachler, Longevity Software LLC d.b.a. Terawatt Industries

//acerA100();
rotate([90, 0, 0]) tabletMount();

module tabletMount() {
	difference() {
		cube([128, 54, 23]);
		translate([5, 5, 5]) cube([118, 54, 13]);
		translate([7.5, -5, 7.5]) cube([113, 54, 8]);
		translate([15, 25, 15]) cube([98, 54, 13]);
	}
	difference() {
		// mount tab
		translate([127, 0, 0]) cube([20, 20, 10]);
		translate([137, 10, -1]) rotate([0, 0, 0]) cylinder(r = 2.1, h = 12, center = false, $fn = 50);
	}
}

module acerA100() {
  color([0, 0, 0]) cube([118, 194, 13]);
}
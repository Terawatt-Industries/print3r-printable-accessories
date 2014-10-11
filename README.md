Printr Printable Accessories
============================
Printable accessories for Print3r for Android include holders to attach Android devices to a 3D printer, an enclosure for the Print3r for Android Adapter Board, and a model of the Print3r Adapter Board PCB.

All models are in OpenSCAD.  All files are licensed under Apache 2.0.

Parametric Nut Clamps
--------
These parts depend on another open source part, the Parametric Nut Clamp for 20mm Extrusion.  This project is linked as a Git submodule.

Printing
--------
STL files are in /dist.  Print these in PLA or whatever material you prefer for both Print3r Adapter Board enclosure and Android device holder(s).  The enclosure is a relatively straightforward print except that it exhibits tall, thin walls, which can challenge some machines.  The device holders are long, narrow, and tall, so if using ABS consider using a brim and/or raft to reduce warping effects.  Print at whatever layer height you prefer, such as 0.25mm.

Android Device Holder BOM
-------------------------
- 1x M3 screw, ~12mm
- 1x M3 flat washer
- 1x M3 lock washer (optional, recommended)
- 1x 3D-printed Parametric Nut Clamp for 20mm Extrusion, for M3 captive nut.  For attachment to another model such as Prusa i2 you may be able to use other parts for attachment to threaded or smooth rod, but you may have to modify the holder with multiple attachment points.  Please let us know.
- BOM for Parametric Nut Clamp for 20mm Extrusion
-- 2x M4 screw, 30-35mm
-- 2x M4 nut
-- 1x M3 nut

Print3r Adapter Board Enclosure BOM
-----------------------------------
- 1x M3 screw, ~12mm
- 1x M3 flat washer
- 1x M3 lock washer (optional, recommended)
- 1x 3D-printed Parametric Nut Clamp for 20mm Extrusion, for M3 captive nut.  For attachment to another model such as Prusa i2 you may be able to use other parts for attachment to threaded or smooth rod, but you may have to modify the holder with multiple attachment points.  Please let us know.
- BOM for Parametric Nut Clamp for 20mm Extrusion
-- 2x M4 screw, 30-35mm
-- 2x M4 nut
-- 1x M3 nut

Attaching the Android Device Holder
-----------------------------------
1.  Insert M3 nut into the Parametric Nut Clamp for 20mm extrusion.
2.  Attach the Parametric Nut Clamp for 20mm extrusion.  Depending on the manufacturer, the tolerances on this part can be so tight that the M4 hardware is unnecessary.  You will still want the hardware in case something gets knocked.
3.  Attach the device holder with the M3x12mm screw, with washer and lock washer.

Attaching the Print3r Adapter Board Enclosure
---------------------------------------------
1.  The enclosure has a lid which requires no hardware.  It should lock onto the enclosure bottom with a snug fit.  The lid can be removed after the bottom is attached to a 3D printer gantry (frame).
2.  Insert M3 nut into the Parametric Nut Clamp for 20mm extrusion.
3.  Attach the Parametric Nut Clamp for 20mm extrusion.  Depending on the manufacturer, the tolerances on this part can be so tight that the M4 hardware is unnecessary.  You will still want the hardware in case something gets knocked.
4.  Attach the device holder with the M3x12mm screw, with washer and lock washer.

Contributing
------------
The Android device holder STL files are generated with a single parametrized OpenSCAD source.  This source is src/device_holder.scad.  There are over 5000+ Android devices as of this writing.  Nevertheless, depending on how many we model, we should never need more than a few (or one) source files for all of them.  Please follow the established pattern to add holders for new devices.
1. Add a new sub-array to "vars" with the dimensions of your device.  Note:  the port openings on the holder are designed to be as wide as possible to work with as many generic devices as possible, but you may need to proceed with more modeling as described.
2. Change "device = vars[1];" to the index of the sub-array you just added in the previous step.
3. The bottom of the SCAD file has modules that are simple models of the actual devices.  For example the line "//acerA100();", when uncommented, should show the Acer A100 in the holder.
4.  You should add a module for your device.  Note the dimension of the A100 does not match the entries in "vars".  This is intentional - the holder can accommodate larger dimensions and this provides plenty of tolerance for both the printed part and device.

In the unlikely event src/device_holder.scad becomes unwieldy then it can be split apart by other criteria.

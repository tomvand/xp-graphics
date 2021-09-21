# 0. White balance
The Enhanced Skyscapes lighting appears too yellow. Use a white balance LUT to correct before tuning further.

whitebalance6: ok. Perhaps *slightly* blue.
whitebalance-22: better. Tuned for different brightness levels indpendently using Curves.

| | | | | |
|-|-|-|-|-|
|R|30|63|190|199
|G|36|66|184|196
|B|42|62|170|191

Do not correct shadow color -> excessive redness, while default color is actually ok.


# 1. Curve
From|To|Where
----|--|-----
64|48|Shadow
112|92|Forest
~~179~~|~~140~~|Walls
~~230~~|~~179~~|Apron
182|214|Sky
~~247~~|~~247~~|White


# 3. Skyscapes lighting
Also adjust skyscapes lighting


# 4. Tint?




The LUTs don't really seem to do what they should. Perhaps easier to tune directly in reshade, and generate LUT there. Gimp has not been very helpful anyway...
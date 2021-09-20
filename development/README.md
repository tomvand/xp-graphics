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



# 1. Daytime sky brightness matching
Since the sky colors are fixed in Enhanced Skyscapes, find a LUT to match the color to reference pictures.

Use smooth curves to not cause additional clipping in highlights and shadows.

Also adjust saturation here for sky color.

Final sky value: 214

# 2. Lightness curve
~~Use art controls~~ white_point is ineffective. Use reshade curves.

Do not adjust around/above 214 as these are already set for sky colors.

# 3. Skyscapes lighting
Also adjust skyscapes lighting
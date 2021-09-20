# 0. White balance
The Enhanced Skyscapes lighting appears too yellow. Use a white balance LUT to correct before tuning further.

whitebalance6: ok. Perhaps *slightly* blue.

Consider separately tuning light and shadow?

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
# Color Contrast App

This app is designed to calculate the contrast ratio of a selected color against a standard foreground color. This can be useful for ensuring accessibility compliance in app development where text and background colors need to meet accessibility standards.

> [!NOTE]
> This app is built using HSB color modal.


![Demo UI](https://github.com/sakaavee/Color-Contrast-App/assets/59090839/b67cd33a-827e-40ef-9b72-1fcd336619c0)

## Features
- **Brand Color Selection:** Provides options to choose a background color against which the contrast ratio will be calculated.
- **Contrast Ratio Calculation:** Calculates and displays the contrast ratio for the selected background against the static foreground colors.
- **WCAG Score Card:** Shows the minimum and enhanced contrast ratio requirements for the selected colors. (✅ pass or ❌ fail)
- **Adaptive Color:** Makes the color legible for texts without deviating more from the original color.

----

## Usage
- **Choose Background Color:** Select a background color against which the contrast ratio will be calculated.
- **Show Demo:** Demo page showing the selected brand color applied to a sample interface.

----

## How it works?
### Calculate Contrast Ratio
This app works by comparing the luminance of the selected foreground color with the luminance of the chosen background color. The contrast ratio is calculated using the following formula:
```
Contrast Ratio = (L1 + 0.05) / (L2 + 0.05)
```
Where:
- L1 is the relative luminance of the lighter color (either the foreground or background color).
- L2 is the relative luminance of the darker color (either the foreground or background color).

### Calculate Luminance
Luminance of a color can be calculated using the formula.. Before that color needs to be linearized first.
```
L = 0.2126 * R + 0.7152 * G + 0.0722 * B
```

### Linearization (sRGB > RGB)
```

** Normailze RGB components ** R[sRGB] = R[sRGB-8bit] / 255 
G[sRGB] = G[sRGB-8bit] / 255  
B[sRGB] = B[sRGB-8bit] / 255

** Linearize RGB components **
If R[sRGB], G[sRGB], B[sRGB] <= 0.04045
R[linearRGB] = R[sRGB] / 12.92
G[linearRGB] = G[sRGB] / 12.92
B[linearRGB] = B[sRGB] / 12.92

else if R[sRGB], G[sRGB], B[sRGB] > 0.04045
R[linearRGB] = ((R[sRGB] + 0.055) / 1.055) ^ 2.4
G[linearRGB] = ((G[sRGB] + 0.055) / 1.055) ^ 2.4
B[linearRGB] = ((B[sRGB] + 0.055) / 1.055) ^ 2.4

** 0.04045 is the range between linear and non-linear color section **
```
**Steps involved in this process**

**Step 1:** Normalize RGB components
- RGB components ranges from 0 to 255 and we need to normalize that to scale from 0 to 1 by dividing each component with 255

**Step 2:** Linearize RGB components
- If the normalized value is less than or equal to 0.04045, then divide it by 12.92.
- If the normalized value is greater than 0.04045, then apply the formula ((value + 0.055) / 1.055) ^ 2.4.

After these steps linear values can be passed into luminance formula!

-----

## Installation
1. Clone or download the repository.
2. Open the project in Xcode.
3. Build and run the app on a simulator or a physical device.

# 👋

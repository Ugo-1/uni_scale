# UniScaleConfigure

A utility class for configuring and scaling elements in a Flutter app's user interface to adapt to different screen sizes and orientations.

## Features

- Scale and adapt layouts based on a design size.
- Support for split-screen mode adaptation.
- Scale the height of a widget in response to the text scale factor.

## Properties

| Property Name                | Type        | Default Value | Description |
| ---------------------------- | ----------- | ------------- | ----------- |
| `designSize`                | `Size`      | -             | The width and height of the device used for the design. |
| `uniScaleBuilder`           | `UniScaleBuilder` | -       | A builder function for constructing scaled content. |
| `adaptHeightToSplitScreen`  | `bool`      | `true`        | Determines whether scaling should adapt to split-screen mode. |
| `adaptSplitScreenHeight`    | `double?`   | -             | The minimum height for scaling in split-screen mode (if enabled). |
| `child`                     | `Widget?`   | -             | An optional child widget for additional content within the scaling context. |

## Methods

| Method Name                         | Return Type | Description |
| ----------------------------------- | ----------- | ----------- |
| `initialize(...)`                   | `void`      | Initializes the ScreenScaler with the provided context and design parameters. |
| `setMinWidthHeight(num size)`       | `double`    | Scales the size based on the minimum of the width and height factors. |
| `setHeight(num size)`               | `double`    | Scales the size based on the height factor only. |
| `setWidth(num size)`                | `double`    | Scales the size based on the width factor only. |
| `scaleHeightWithTextFactor(...)`    | `double`    | Scales the height of a widget according to the text scale factor. |

## Extension: UniScaleExtension

The `UniScaleExtension` extension provides convenient methods for scaling numeric values according to the design and text scale factor using Uni Scale. Here are the extension methods along with their descriptions and usage examples:

| Extension Method                    | Description                                                             | Usage Example                                        |
| ----------------------------------- | ----------------------------------------------------------------------- | ---------------------------------------------------- |
| `scaleFontSize`                     | Returns a scaled font size based on width and height scaling factors.  | `final scaledFontSize = 20.scaleFontSize;` |
| `scaleHeight`                       | Returns a scaled vertical spacing value based on the height scaling factor. | `final scaledSpacing = 16.scaleHeight;` |
| `scaleWidth`                        | Returns a scaled horizontal spacing value based on the width scaling factor. | `final scaledSpacing = 8.scaleWidth;` |
| `scaleRadius`                       | Returns a scaled radius value based on width and height scaling factors.  | `final scaledRadius = 10.scaleRadius;` |
| `scaleHeightWithTextScaleFactor()`  | Returns a scaled height value based on the text scale factor with a custom height factor. | `final scaledHeight = 48.scaleHeightWithTextScaleFactor(heightFactor: 1.5);` |

These extension methods make it easy to scale numeric values in your Flutter code, ensuring a responsive and adaptable UI in your app.

## Usage Example

Here's an example of how to use the `UniScaleConfigure` class to configure and scale UI elements in your Flutter app:

```dart
// Initialize UniScaleConfigure
UniScaleInit(
    designDeviceWidth: 375,
    designDeviceHeight: 350,
    adaptHeightToSplitScreen: true,
    adaptSplitScreenHeight: 400,
    uniScaleBuilder: (context, child) => Your material app comes here,
);

// Scale a widget's height based on text scaling factor
final scaledHeight = UniScaleConfigure().scaleHeightWithTextFactor(100, 2.0);
```

## Getting started

To get started with `UniScaler` and its extension, add the package to your Flutter project and follow the usage examples provided above.
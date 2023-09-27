# UniScaleConfigure

UniScaleConfigure is a versatile utility class designed to configure and scale elements within a Flutter app's user interface. Its primary purpose is to adapt these elements to different screen sizes and orientations.

## Features

- Scale and adapt layouts based on a designated design size.
- Support for split-screen mode adaptation.
- Scale the height of a widget in response to changes in the text scale factor.

## Properties

| Property Name                | Type        | Default Value | Description |
| ---------------------------- | ----------- | ------------- | ----------- |
| `designSize`                | `Size`      | -             | Represents the width and height of the device used for the design. |
| `uniScaleBuilder`           | `UniScaleBuilder` | -       | A function for constructing scaled content. |
| `adaptHeightToSplitScreen`  | `bool`      | `true`        | Determines whether scaling should adapt to split-screen mode. |
| `adaptSplitScreenHeight`    | `double?`   | -             | Specifies the minimum height for scaling in split-screen mode (if enabled). |
| `child`                     | `Widget?`   | -             | An optional child widget for including additional content within the scaling context. |

## Methods

| Method Name                         | Return Type | Description |
| ----------------------------------- | ----------- | ----------- |
| `initialize(...)`                   | `void`      | Initializes the ScreenScaler with the provided context and design parameters. |
| `setMinWidthHeight(num size)`       | `double`    | Scales the size based on the minimum of the width and height factors. |
| `scaleWithHeight(num size)`         | `double`    | Scales the size based on the height factor only. |
| `scaleWithWidth(num size)`          | `double`    | Scales the size based on the width factor only. |
| `scaleHeightWithTextFactor(...)`    | `double`    | Scales the height of a widget according to the text scale factor. |

## Extension: UniScaleExtension

The UniScaleExtension extension provides a collection of convenient methods for scaling numeric values according to the design and text scale factor using Uni Scale. Here are the extension methods, along with their descriptions and usage examples:

| Extension Method                    | Description                                                             | Usage Example                                        |
| ----------------------------------- | ----------------------------------------------------------------------- | ---------------------------------------------------- |
| `scaleFontSize`                     | Returns a scaled font size based on both width and height scaling factors.  | `final scaledFontSize = 20.scaleFontSize;` |
| `scaleHeight`                       | Returns a scaled vertical spacing value based on the height scaling factor. | `final scaledSpacing = 16.scaleHeight;` |
| `scaleWidth`                        | Returns a scaled horizontal spacing value based on the width scaling factor. | `final scaledSpacing = 8.scaleWidth;` |
| `scaleRadius`                       | Returns a scaled radius value based on both width and height scaling factors.  | `final scaledRadius = 10.scaleRadius;` |
| `scaleHeightWithTextScaleFactor()`  | Returns a scaled height value based on the text scale factor, with an optional custom height factor. | `final scaledHeight = 48.scaleHeightWithTextScaleFactor(heightFactor: 1.5);` |

These extension methods simplify the process of scaling numeric values within your Flutter code, ensuring a responsive and adaptable user interface in your app.

## Usage Example

Here's an example of how to use the `UniScaleConfigure` class to configure and scale UI elements in your Flutter app:

```dart
// Initialize UniScaleConfigure
UniScaleConfigure().initialize(
    context,
    Size(designWidth, designHeight),
    adaptHeightToSplitScreen: true,
    adaptSplitScreenHeight: 400,
);

// Scale a widget's height based on the text scaling factor
final scaledHeight = 100.scaleHeightWithTextScaleFactor(2.0);
```

## Getting Started

To get started with `UniScaler` and its extension, add the package to your Flutter project and refer to the usage examples provided above. This will help you create responsive and adaptable user interfaces tailored to various screen sizes and orientations.

## License

This project is licensed under the terms of the [MIT License](LICENSE). See the [LICENSE](LICENSE) file for details.
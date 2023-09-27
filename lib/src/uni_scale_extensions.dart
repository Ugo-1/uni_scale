import 'package:uni_scale/uni_scale.dart';

/// This extension provides convenient methods for scaling numeric values
/// according to the design and text scale factor using Uni Scale.
extension UniScaleExtension on num {
  /// Returns a scaled font size based on the minimum of the width and height
  /// scaling factors as configured by Uni Scale.
  double get scaleFontSize => UniScaleConfigure().scaleWithMinWidthHeight(this);

  /// Returns a scaled vertical spacing value based on the height scaling
  /// factor as configured by Uni Scale.
  double get scaleHeight => UniScaleConfigure().scaleWithHeight(this);

  /// Returns a scaled horizontal spacing value based on the width scaling
  /// factor as configured by Uni Scale.
  double get scaleWidth => UniScaleConfigure().scaleWithWidth(this);

  /// Returns a scaled radius value based on the minimum of the width and height
  /// scaling factors as configured by Uni Scale.
  double get scaleRadius => UniScaleConfigure().scaleWithMinWidthHeight(this);

  /// Returns a scaled height value based on the provided [heightFactor]
  /// and the current text scale factor as configured by Uni Scale.
  ///
  /// [heightFactor]: The desired height-to-font ratio. Default is 1.
  double scaleHeightWithTextScaleFactor({double heightFactor = 1}) =>
      UniScaleConfigure().scaleHeightWithTextFactor(this, heightFactor);
}

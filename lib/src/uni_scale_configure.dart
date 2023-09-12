import 'package:flutter/widgets.dart';
import 'dart:math';

class UniScaleConfigure {
  static UniScaleConfigure? _instance;
  static late BuildContext _context; // Store the BuildContext here

  // Private constructor to prevent external instantiation
  UniScaleConfigure._();

  // Factory constructor to provide a single instance
  factory UniScaleConfigure() {
    _instance ??= UniScaleConfigure._();
    return _instance!;
  }

  /// The width of the user's device. During portrait mode, it uses the width and
  /// during landscape mode, it uses the height.
  late double _screenWidth;

  /// The height of the user's device. During portrait mode, it uses the height and
  /// during landscape mode, it uses the width.
  late double _screenHeight;

  /// The width of the device used in the design.
  late double _uiDesignWidth;

  /// The height of the device used in the design.
  late double _uiDesignHeight;

  /// The height to support split-screen adaptation.
  double? _splitScreenAdaptHeight;

  /// Set to `true` to adapt height to split-screen, otherwise 
  /// set to `false`.
  late bool _adaptHeightToSplitScreen;

  /// Initializes the ScreenScaler with the provided context and design parameters.
  ///
  /// - [context]: The build context.
  /// - [designWidth]: The width of the device used in the design.
  /// - [designHeight]: The height of the device used in the design.
  /// - [adaptHeightToSplitScreen]: Set to `true` to adapt height to split-screen, otherwise 
  ///   set to `false`.
  /// - [splitScreenAdaptHeight]: Optional height to support split-screen adaptation. 
  ///    Defaults to 700 if [adaptHeightToSplitScreen] is true
  void initialize(
    BuildContext context,
    Size designSize,
    bool adaptHeightToSplitScreen, [
    double? splitScreenAdaptHeight,
  ]) {
    _context = context;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    _screenWidth = mediaQueryData.size.width;
    _screenHeight = mediaQueryData.size.height;
    Orientation orientation = mediaQueryData.orientation;
    if (orientation == Orientation.landscape) {
      _screenWidth = mediaQueryData.size.height;
      _screenHeight = mediaQueryData.size.width;
    }
    _uiDesignWidth = designSize.width;
    _uiDesignHeight = designSize.height;
    _splitScreenAdaptHeight =
        (adaptHeightToSplitScreen) ? splitScreenAdaptHeight ?? 700 : null;
        _adaptHeightToSplitScreen = adaptHeightToSplitScreen;
  }

  /// Calculates the scaling factor for the width based on the screen's width
  /// relative to the UI design's width.
  double get _scaleWidth => _screenWidth / _uiDesignWidth;

  /// Calculates the scaling factor for the height based on the screen's height
  /// relative to the UI design's height, considering any split-screen adaptation height.
  ///
  /// If [_splitScreenAdaptHeight] is not provided during initialization, it defaults to 0.
  ///
  /// If [_adaptHeightToSplitScreen] is true then it considers the split screen adaptation 
  /// height otherwise it uses [_screenHeight].
  double get _scaleHeight => (_adaptHeightToSplitScreen ?
      max(_screenHeight, _splitScreenAdaptHeight ?? 0) : _screenHeight)  / _uiDesignHeight;

  /// Scales the size based on the minimum of the width and height factors.
  double setMinWidthHeight(num size) {
    return size * min(_scaleWidth, _scaleHeight);
  }

  /// Scales the size based on the height factor only.
  double setHeight(num size) {
    return size * _scaleHeight;
  }

  /// Scales the size based on the width factor only.
  double setWidth(num size) {
    return size * _scaleWidth;
  }

  /// Scales the height of a widget according to the text scale factor.
  ///
  /// - [heightFactor]: Adjust to your desired height-to-font ratio.
  /// - [childHeight]: The height from the design.
  double scaleHeightWithTextFactor(num childHeight, num heightFactor,) {
    final textScaleFactor =
        MediaQuery.textScaleFactorOf(_context); // Use stored context
    final num unscaledHeight = childHeight;
    final num minHeight = unscaledHeight / heightFactor;
    num scaledHeight = unscaledHeight;

    if (textScaleFactor != 1) {
      scaledHeight += (textScaleFactor - 1) * minHeight;
    } 
    
    return scaledHeight.toDouble();
  }
}

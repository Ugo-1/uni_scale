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

  /// The logical width of the user's device.
  /// During portrait mode, it uses the logical width, and
  /// during landscape mode, it uses the logical height.
  late double _logicalScreenWidth;

  /// The logical height of the user's device.
  /// During portrait mode, it uses the logical height, and
  /// during landscape mode, it uses the logical width.
  late double _logicalScreenHeight;

  /// The logical width of the device used in the design.
  late double _logicalDesignWidth;

  /// The logical height of the device used in the design.
  late double _logicalDesignHeight;

  /// The height to support split-screen adaptation.
  double? _splitScreenAdaptHeight;

  /// Set to `true` to adapt height to split-screen, otherwise 
  /// set to `false`.
  late bool _adaptHeightToSplitScreen;

  /// Initializes the UniScaleConfigure with the provided context and design parameters.
  ///
  /// - [context]: The build context.
  /// - [designSize]: The logical size of the device used in the design.
  /// - [adaptHeightToSplitScreen]: Set to `true` to adapt height to split-screen, otherwise 
  ///   set to `false`.
  /// - [splitScreenAdaptHeight]: Optional logical height to support split-screen adaptation. 
  ///    Defaults to 700 if [adaptHeightToSplitScreen] is true.
  void initialize(
    BuildContext context,
    Size designSize,
    bool adaptHeightToSplitScreen, [
    double? splitScreenAdaptHeight,
  ]) {
    _context = context;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    _logicalScreenWidth = mediaQueryData.size.width;
    _logicalScreenHeight = mediaQueryData.size.height;
    Orientation orientation = mediaQueryData.orientation;
    if (orientation == Orientation.landscape) {
      _logicalScreenWidth = mediaQueryData.size.height;
      _logicalScreenHeight = mediaQueryData.size.width;
    }
    _logicalDesignWidth = designSize.width;
    _logicalDesignHeight = designSize.height;
    _splitScreenAdaptHeight =
        (adaptHeightToSplitScreen) ? splitScreenAdaptHeight ?? 700 : null;
        _adaptHeightToSplitScreen = adaptHeightToSplitScreen;
  }

  /// Calculates the scaling factor for the width based on the screen's logical width
  /// relative to the UI design's logical width.
  double get _widthScaleFactor => _logicalScreenWidth / _logicalDesignWidth;

  /// Calculates the scaling factor for the height based on the screen's logical height
  /// relative to the UI design's logical height, considering any split-screen adaptation height.
  ///
  /// If [_splitScreenAdaptHeight] is not provided during initialization, it defaults to 0.
  ///
  /// If [_adaptHeightToSplitScreen] is true then it considers the split screen adaptation 
  /// height otherwise it uses [_logicalScreenHeight].
  double get _heightScaleFactor => (_adaptHeightToSplitScreen ?
      max(_logicalScreenHeight, _splitScreenAdaptHeight ?? 0) : _logicalScreenHeight)  / _logicalDesignHeight;

  /// Scales the size based on the minimum of the width and height factors.
  double scaleWithMinWidthHeight(num size) {
    return size * min(_widthScaleFactor, _heightScaleFactor);
  }

  /// Scales the size based on the height factor only.
  double scaleWithHeight(num size) {
    return size * _heightScaleFactor;
  }

  /// Scales the size based on the width factor only.
  double scaleWithWidth(num size) {
    return size * _widthScaleFactor;
  }

  /// Scales the height of a widget according to the text scale factor.
  ///
  /// - [heightFactor]: Adjust to your desired height-to-font ratio.
  /// - [childHeight]: The logical height from the design.
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

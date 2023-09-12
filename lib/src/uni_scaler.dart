import 'package:flutter/material.dart';
import 'package:uni_scale/src/uni_scale_configure.dart';

/// A typedef for a function that takes a [BuildContext] and a [Widget] child
/// and returns a [Widget].
typedef UniScaleBuilder = Widget Function(
  BuildContext context,
  Widget? child,
);

/// A StatefulWidget for scaling and adapting layouts in a Flutter app.
class UniScaler extends StatefulWidget {
  /// The width of the device used for the design.
  final Size designSize;

  /// The builder function for constructing the scaled content.
  final UniScaleBuilder uniScaleBuilder;

  /// Determines whether the scaling should adapt to split-screen mode.
  /// Defaults to `true`.
  final bool adaptHeightToSplitScreen;

  /// The minimum height to scale with when in split-screen mode.
  /// Defaults to `700` if [adaptHeightToSplitScreen] is `true`, and `0` if `false`.
  final double? adaptSplitScreenHeight;

  /// An optional child widget to include within the scaling context.
  final Widget? child;

  /// Creates a UniScaler widget.
  ///
  /// The [designDeviceWidth] and [designDeviceHeight] parameters specify the
  /// width and height of the device used for the design. The [uniScaleBuilder]
  /// is a callback function used to construct the scaled content.
  ///
  /// The [adaptHeightToSplitScreen] parameter determines whether the scaling
  /// should adapt to split-screen mode (defaults to `true`). If enabled, you can
  /// specify the [adaptSplitScreenHeight] to set the minimum height for scaling
  /// when in split-screen mode.
  ///
  /// The optional [child] widget can be used to include additional content
  /// within the scaling context.
  const UniScaler({
    Key? key,
    required this.designSize,
    required this.uniScaleBuilder,
    this.adaptHeightToSplitScreen = true,
    this.adaptSplitScreenHeight,
    this.child,
  }) : super(key: key);

  @override
  State<UniScaler> createState() => _UniScalerState();
}

class _UniScalerState extends State<UniScaler> {
  @override
  Widget build(BuildContext context) {
    // Initialize the Uni Scale configuration using the singleton instance.
    UniScaleConfigure().initialize(
      context,
      widget.designSize,
      widget.adaptHeightToSplitScreen,
      widget.adaptSplitScreenHeight,
    );

    // Use the provided uniScaleBuilder callback to construct the scaled content.
    return widget.uniScaleBuilder(context, widget.child);
  }
}

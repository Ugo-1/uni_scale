import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni_scale/src/uni_scale_extensions.dart';
import 'package:uni_scale/uni_scale.dart';

const uiSizeTest1 = Size(375, 812);

void main() {
  late double deviceHeight;
  late double deviceWidth;
  late bool isOrientationLandscape;

  testWidgets('UniScaler initializes and builds', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: UniScaler(
          designSize: uiSizeTest1,
          uniScaleBuilder: (context, child) {
            MediaQueryData mediaQueryData = MediaQuery.of(context);
            deviceHeight = mediaQueryData.size.height;
            deviceWidth = mediaQueryData.size.width;
            isOrientationLandscape =
                mediaQueryData.orientation == Orientation.landscape;
            return Container(); // Replace with your test content
          },
        ),
      ),
    );
  });

  test('device height, width and orientation has been set', () {
    expect(deviceHeight, isNotNull);
    expect(deviceWidth, isNotNull);
    expect(doesNotComplete, isNotNull);
  });

  test('scaleWidth should scale width correctly', () {
    final scaledWidth = 100.scaleWidth;
    final deviceScaling =
        100 * ((isOrientationLandscape ? deviceHeight : deviceWidth)/ uiSizeTest1.width);
    expect(scaledWidth, equals(deviceScaling));
  });
}
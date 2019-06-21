import 'package:multislider/multislider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

ScaleRange scaleRange = ScaleRange.forAlignment(min: 0, max: 1000);
SliderMarkCtrl sliderMarkCtrl = SliderMarkCtrl(scaleRange: scaleRange);
MultiSlider multiSlider = MultiSlider(
  scaleRange: scaleRange,
  marks: [
    SliderMark(
      controller: sliderMarkCtrl,
    )
  ],
);

void main() {
  group('A group of tests', () {
    // setUp(() {
    //   awesome = Awesome();
  });

  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(MultiSlider(
      scaleRange: scaleRange,
      marks: [
        SliderMark(
          controller: sliderMarkCtrl,
        )
      ],
    ));
    // final messageFinder = find.text('M');

    expect(find.byType(SliderMark), findsOneWidget);
    // expect(find.byType(SliderMarkCtrl), findsOneWidget);
  });
}

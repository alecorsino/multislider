import 'package:flutter/material.dart';
import 'package:multislider/multislider.dart';

void main() {
  runApp(new MaterialApp(home: new App()));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ScaleRange scaleRange;
  SliderMarkCtrl sliderMarkCtrl;

  @override
  void initState() {
    scaleRange = ScaleRange.forAlignment(min: 0, max: 1000);
    sliderMarkCtrl = SliderMarkCtrl(scaleRange: scaleRange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MultiSlider(
        scaleRange: scaleRange,
        marks: [
          SliderMark(
            controller: sliderMarkCtrl,
          )
        ],
      ),
    );
  }
}

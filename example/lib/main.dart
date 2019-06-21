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
  ScaleRange scaleRangeMain;
  ScaleRange scaleRange2;
  SliderMarkCtrl sliderMarkCtrlMain;
  SliderMarkCtrl sliderMarkCtrl2;

  @override
  void initState() {
    scaleRangeMain = ScaleRange.forAlignment(min: 0, max: 100);
    scaleRange2 = ScaleRange(
        fromMin: 50,
        fromMax: 100,
        toMin: scaleRangeMain.convert(50),
        toMax: scaleRangeMain.convert(100));

    sliderMarkCtrlMain = SliderMarkCtrl(scaleRange: scaleRangeMain);
    sliderMarkCtrl2 = SliderMarkCtrl(scaleRange: scaleRange2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MultiSlider(
        scaleRange: scaleRangeMain,
        marks: [
          SliderMark(
            controller: sliderMarkCtrlMain,
          ),
          SliderMark(
            controller: sliderMarkCtrl2,
          )
        ],
      ),
    );
  }
}

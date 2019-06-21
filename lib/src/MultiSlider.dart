import './ScaleRange.dart';
import './SliderMark.dart';
import 'package:flutter/material.dart';

class MultiSlider extends StatefulWidget {
  // num min;
  // num max;
  final ScaleRange scaleRange;
  List<SliderMark> marks;

  MultiSlider({@required this.scaleRange, @required this.marks})
      : assert(scaleRange != null),
        assert(marks != null);

  @override
  _MultiSliderState createState() => _MultiSliderState();
}

class _MultiSliderState extends State<MultiSlider> {
  // num range;
  // final num internalRange = 2;
  // getPosition(x) => (((x - widget.min) * internalRange) / range) + (-1);

  @override
  void initState() {
    // range = widget.max - widget.min;
    // internalRange = 2;
    // print('POS ${getPosition(50)}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _stack();
  }

  _stack() => Stack(
        alignment: Alignment.center,
        children: <Widget>[_bar(), ...widget.marks],
      );

  _bar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.teal,
        ),
      ),
    );
  }
}

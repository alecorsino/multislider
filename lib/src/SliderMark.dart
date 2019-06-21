import './SliderMarkCtrl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SliderMark extends StatefulWidget {
  // double position;
  SliderMarkCtrl controller;
  Color color;
  SliderMark({this.color, @required this.controller}) : assert(controller != null);

  @override
  _SliderMarkState createState() => _SliderMarkState();
}

class _SliderMarkState extends State<SliderMark> {
  @override
  void initState() {
    // if (widget.position)widget.controller.position.value = widget.position;
    widget.controller.addListener(() => setState(() => null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Align(alignment: Alignment(widget.controller.getAlignmentPosition(), 0.0), child: _mark());

  _mark() => _gestureDectector(
          child: Container(
        // color: Colors.white,
        padding: EdgeInsets.all(7),
        child: Container(
            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: widget.color ?? Colors.orange,
        )),
        height: 35,
        width: 35,
      ));

  _gestureDectector({Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onHorizontalDragStart: (DragStartDetails details) {
          // print('MARK $details');
          // print('MARK START: ${details.globalPosition.dx}');
        },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          // print('MARK DELTA ${details.delta}');
          setState(() {
            widget.controller.setAlignmentPosition(
                widget.controller.getAlignmentPosition() + details.delta.dx / 200);
          });
        },
        child: child,
      );
}

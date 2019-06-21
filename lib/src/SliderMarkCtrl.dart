import './ScaleRange.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SliderMarkCtrl {
  /// Position is a number within scale defined in ScaleRange
  final ValueNotifier<double> _position;
  final ScaleRange scaleRange;
  final int divisions;

  SliderMarkCtrl({@required this.scaleRange, this.divisions})
      : assert(scaleRange != null),
        _position = ValueNotifier(scaleRange.convert(0));

  addListener(listener) {
    _position.addListener(listener);
  }

  removeListener(listener) {
    _position.removeListener(listener);
  }

  get position => _position.value;
  set position(double x) {
    // if (divisions != null) {
    //   if (x > _position.value) {
    //     x += scaleRange.fromRange / divisions;
    //   }
    //   print('x: $x');
    //   x = scaleRange.discreteStep(x, divisions);
    //   print('MOD $x');
    // }
    _position.value = x.clamp(scaleRange.fromMin, scaleRange.fromMax);
  }

  getAlignmentPosition() => scaleRange.convert(_position.value);
  setAlignmentPosition(x) => position = scaleRange.reverse(x);
  // set position(x) => _position.value = x;
}

class ScaleRange {
  final double fromMin;
  final double fromMax;
  final double fromRange;

  final double toRange;
  final double toMin;
  final double toMax;

  ScaleRange({this.fromMin, this.fromMax, this.toMax, this.toMin})
      : fromRange = fromMax - fromMin,
        toRange = toMax - toMin;

  /// Speficic Scale range converter to be used for Widget aligned with Alignment ranges (-1.0 to 1.0)
  factory ScaleRange.forAlignment({double min, double max}) =>
      ScaleRange(fromMin: min, fromMax: max, toMin: -1, toMax: 1);

  /// Converts from Original Range to Target range
  /// Value is clampped within fromMin - fromMax
  convert(double x) {
    x = x.clamp(fromMin, fromMax);
    return (((x - fromMin) * toRange) / fromRange) + (toMin);
  }

  double reverse(i) {
    double reversed = ((((i - toMin) * fromRange) / toRange) + (fromMin));
    return reversed.clamp(fromMin, fromMax);
  }

  double discreteStep(double x, int divisions) =>
      (((x / fromRange) * divisions).round() * divisions) * 1.0;
}

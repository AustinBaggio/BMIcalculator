import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final double height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getDescription() {
    if (_bmi > 25) {
      return "You have a higher than normal bodyweight for your height, fatty.";
    }
    if (_bmi >= 18.5) {
      return "You have perfect proportions, rock on.";
    }
    return "You're thin, nice.";
  }

  String getTitle() {
    if (_bmi > 25) {
      return "OVERWEIGHT";
    }
    if (_bmi > 18.5) {
      return "NORMAL";
    }
    return "UNDERWEIGHT";
  }
}

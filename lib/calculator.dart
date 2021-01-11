import 'dart:math';

class Calculator {
  final int weight;
  final int height;
  Calculator({this.height, this.weight});

  double _bmi;

  String bmiCal() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal ';
    } else {
      return 'Underweight';
    }
  }

  String moreInfo() {
    if (_bmi >= 25) {
      return 'You need to burn some calories';
    } else if (_bmi > 18.5) {
      return ' You have a normal body weight. Keep it up. ';
    } else {
      return 'You need to gain more weight. Take more calories';
    }
  }
}

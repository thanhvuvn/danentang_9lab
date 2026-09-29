import 'dart:math';

class BMICalculator {
  final int height;
  final int weight;
  double _bmi = 0;

  BMICalculator({required this.height, required this.weight});

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) return 'Thừa cân';
    if (_bmi > 18.5) return 'Bình thường';
    return 'Gầy';
  }

  String getFeedback() {
    if (_bmi >= 25)
      return 'Chỉ số hơi cao. Bạn nên chú ý chế độ ăn và tập luyện nhé!';
    if (_bmi > 18.5) return 'Tuyệt vời! Bạn đang có một cơ thể rất cân đối.';
    return 'Hơi nhẹ cân một chút. Hãy bổ sung thêm dinh dưỡng Việt nhé!';
  }
}

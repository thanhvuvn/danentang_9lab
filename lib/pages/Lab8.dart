import 'package:flutter/material.dart';
import 'package:labs/common/app_colors.dart';
import 'package:labs/common/custom_button.dart';
import 'package:labs/controllers/bmi_calculator.dart';

class Lab8 extends StatefulWidget {
  const Lab8({super.key});

  @override
  State<Lab8> createState() => _Lab8State();
}

class _Lab8State extends State<Lab8> {
  int height = 175;
  int weight = 65;
  int age = 21;

  // Hàm hiển thị kết quả bằng Modal Bottom Sheet hiện đại
  void _showResultSheet() {
    final calc = BMICalculator(height: height, weight: weight);
    final bmi = calc.calculate();
    final result = calc.getResult();
    final feedback = calc.getFeedback();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              result.toUpperCase(),
              style: const TextStyle(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              bmi,
              style: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w900,
                color: AppColors.textMain,
              ),
            ),
            Text(
              feedback,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              label: 'TÍNH LẠI',
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // BOX 1: CHIỀU CAO
            Expanded(
              child: _buildMainCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'CHIỀU CAO',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$height',
                          style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Text(' cm', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 230,
                      activeColor: AppColors.primary,
                      inactiveColor: AppColors.primary.withOpacity(0.2),
                      onChanged: (val) => setState(() => height = val.round()),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),

            // BOX 2: CÂN NẶNG & TUỔI
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildDataCard(
                      'CÂN NẶNG',
                      weight,
                      (val) => setState(() => weight = val),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildDataCard(
                      'TUỔI',
                      age,
                      (val) => setState(() => age = val),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // NÚT TÍNH TOÁN
            PrimaryButton(
              label: 'TÍNH TOÁN CHỈ SỐ',
              onPressed: _showResultSheet,
            ),
          ],
        ),
      ),
    );
  }

  // Widget dùng chung cho Card
  Widget _buildMainCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }

  // Widget con để chọn số (Cân nặng/Tuổi)
  Widget _buildDataCard(String label, int value, Function(int) onChanged) {
    return _buildMainCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$value',
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ActionButton(
                icon: Icons.remove,
                onTap: () => onChanged(value - 1),
              ),
              const SizedBox(width: 15),
              _ActionButton(icon: Icons.add, onTap: () => onChanged(value + 1)),
            ],
          ),
        ],
      ),
    );
  }
}

// Nút bấm tròn cộng trừ custom
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _ActionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.primary, size: 25),
      ),
    );
  }
}

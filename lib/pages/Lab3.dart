import 'dart:math';
import 'package:flutter/material.dart';
import 'package:labs/common/app_colors.dart';
import 'package:labs/common/custom_button.dart';

class Lab3 extends StatefulWidget {
  const Lab3({super.key});

  @override
  State<Lab3> createState() => _Lab3State();
}

class _Lab3State extends State<Lab3> {
  // Khai báo biến trạng thái cho 2 viên xúc xắc
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // Hàm xử lý logic đổ xúc xắc
  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'DICEE',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Thử vận may của bạn',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(height: 50),

              // Khu vực hiển thị 2 viên xúc xắc
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: rollDice,
                      child: Image.asset(
                        'lib/assets/images/dice$leftDiceNumber.png',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextButton(
                      onPressed: rollDice,
                      child: Image.asset(
                        'lib/assets/images/dice$rightDiceNumber.png',
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 80),

              // Nút bấm để kích hoạt logic đổ xúc xắc
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: PrimaryButton(label: 'ROLL DICE', onPressed: rollDice),
              ),

              const SizedBox(height: 20),
              Text(
                'Tổng điểm: ${leftDiceNumber + rightDiceNumber}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:labs/common/app_colors.dart';
import 'package:labs/common/custom_button.dart';

class Lab1 extends StatelessWidget {
  const Lab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sử dụng AppBar với giao diện hiện đại
      appBar: AppBar(
        title: const Text(
          'I AM RICH',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary, // Màu text chính
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Khẳng định giá trị',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Bạn đang sở hữu sự giàu có về kiến thức và trải nghiệm.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 50),

              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6366F1).withOpacity(0.3),
                      blurRadius: 40,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    'lib/assets/images/Diamond.jpg',
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // Sử dụng Custom Button đã định nghĩa ở bước trước
              PrimaryButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Bạn thật sự rất giàu có!')),
                  );
                },
                label: 'I AM RICH',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

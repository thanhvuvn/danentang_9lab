import 'dart:math';
import 'package:flutter/material.dart';
import 'package:labs/common/app_colors.dart';
import 'package:labs/common/custom_button.dart';

class Lab4 extends StatefulWidget {
  const Lab4({super.key});

  @override
  State<Lab4> createState() => _Lab4State();
}

class _Lab4State extends State<Lab4> {
  // Biến trạng thái để thay đổi câu trả lời
  String currentAnswer = "CHẠM"; // Câu trả lời ban đầu

  // Bộ dữ liệu giả lập câu trả lời của Magic 8 Ball
  final List<String> magicAnswers = [
    "CHẮC CHẮN RỒI",
    "KHÔNG NGHI NGỜ GÌ",
    "HỎI LẠI SAU ĐI",
    "TÔI KHÔNG THỂ NÓI",
    "ĐỪNG TRÔNG CHỜ",
    "XU HƯỚNG TỐT",
    "NGHE CÓ VẺ ĐÚNG",
    "CHỜ ĐÃ, CÓ LẼ",
  ];

  // Hàm xử lý khi người dùng đặt câu hỏi
  void askQuestion() {
    setState(() {
      // Lấy ngẫu nhiên một câu trả lời từ danh sách
      currentAnswer = magicAnswers[Random().nextInt(magicAnswers.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'MAGIC 8 BALL (GIẢ LẬP)',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hãy đặt một câu hỏi và\nnhấn nút hoặc chạm vào quả cầu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(height: 60),

              // --- BẮT ĐẦU PHẦN THIẾT KẾ QUẢ CẦU GIẢ LẬP ---
              GestureDetector(
                onTap: askQuestion,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // Hiệu ứng đổ bóng cho quả cầu
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 30,
                        offset: const Offset(10, 20),
                      ),
                    ],
                    // Tạo Gradient xuyên tâm để giả lập khối 3D
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF1E293B), // Màu xanh đen đậm ở tâm
                        Colors.black, // Màu đen ở viền
                      ],
                      center: const Alignment(0, 0), // Tâm gradient
                      radius: 1.2,
                    ),
                  ),
                  child: Center(
                    // Hiển thị câu trả lời ngẫu nhiên ở giữa
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        currentAnswer,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors
                              .primary, // Dùng màu Primary làm điểm nhấn
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // --- KẾT THÚC PHẦN THIẾT KẾ QUẢ CẦU GIẢ LẬP ---
              const SizedBox(height: 70),

              // Tái sử dụng PrimaryButton của bạn
              PrimaryButton(label: 'DỰ ĐOÁN NGAY', onPressed: askQuestion),

              const SizedBox(height: 20),
              const Text(
                'Chạm vào quả cầu để thay đổi câu trả lời',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

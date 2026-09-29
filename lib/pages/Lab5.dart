import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Thư viện phát nhạc
import 'package:labs/common/app_colors.dart';

class Lab5 extends StatelessWidget {
  const Lab5({super.key});

  // Hàm helper để phát âm thanh
  // Lưu ý: Các file âm thanh note1.wav đến note7.wav phải nằm trong assets
  void playSound(int noteNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$noteNumber.wav'));
  }

  // Hàm tạo ra các phím đàn (Key) để tránh lặp lại code
  Widget buildKey({
    required Color color,
    required int noteNumber,
    required String label,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: GestureDetector(
          onTap: () => playSound(noteNumber),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'XYLOPHONE',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            buildKey(
              color: const Color(0xFFEF4444),
              noteNumber: 1,
              label: 'DO',
            ),
            buildKey(
              color: const Color(0xFFF59E0B),
              noteNumber: 2,
              label: 'RE',
            ),
            buildKey(
              color: const Color(0xFF10B981),
              noteNumber: 3,
              label: 'MI',
            ),
            buildKey(
              color: const Color(0xFF3B82F6),
              noteNumber: 4,
              label: 'FA',
            ),
            buildKey(
              color: const Color(0xFF6366F1),
              noteNumber: 5,
              label: 'SOL',
            ),
            buildKey(
              color: const Color(0xFF8B5CF6),
              noteNumber: 6,
              label: 'LA',
            ),
            buildKey(
              color: const Color(0xFFEC4899),
              noteNumber: 7,
              label: 'SI',
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

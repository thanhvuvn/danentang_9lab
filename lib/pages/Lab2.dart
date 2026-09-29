import 'package:flutter/material.dart';
import 'package:labs/common/app_colors.dart';
import 'package:labs/common/custom_button.dart';

class Lab2 extends StatelessWidget {
  const Lab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'MICARD',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ảnh đại diện hình tròn với Border đẹp
              CircleAvatar(
                radius: 60.0,
                backgroundColor: AppColors.primary,
                child: const CircleAvatar(
                  radius: 56.0,
                  backgroundImage: AssetImage(
                    'lib/assets/images/avatar.jpg',
                  ), // Đảm bảo đã có file này
                ),
              ),
              const SizedBox(height: 15),

              // Tên hiển thị
              const Text(
                'Đặng Thanh Vũ',
                style: TextStyle(
                  fontSize: 32.0,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),

              // Chức danh
              Text(
                'DEVELOPER',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.5,
                ),
              ),

              // Đường kẻ phân cách ngắn hiện đại
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: AppColors.primary.withOpacity(0.3),
                  thickness: 1,
                ),
              ),

              const SizedBox(height: 10),

              // Card thông tin Số điện thoại
              _buildInfoCard(
                icon: Icons.phone_android_rounded,
                text: '+84 123 456 789',
              ),

              // Card thông tin Email
              _buildInfoCard(
                icon: Icons.email_outlined,
                text: 'vudt.23ite@vku.udn.vn',
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: PrimaryButton(label: 'CONTACT ME', onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String text}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(
          text,
          style: const TextStyle(fontSize: 17.0, color: Color(0xFF1E293B)),
        ),
      ),
    );
  }
}

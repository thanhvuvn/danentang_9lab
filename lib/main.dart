import 'package:flutter/material.dart';
import 'package:labs/common/app_colors.dart';
import 'package:labs/pages/Lab1.dart';
import 'package:labs/pages/Lab2.dart';
import 'package:labs/pages/Lab3.dart';
import 'package:labs/pages/Lab4.dart';
import 'package:labs/pages/Lab5.dart';
import 'package:labs/pages/Lab6.dart';
import 'package:labs/pages/Lab7.dart';
import 'package:labs/pages/Lab8.dart';
import 'package:labs/pages/Lab9.dart';

// Đọc tham số LAB từ --dart-define=LAB=3 (mặc định '0' = hiển thị menu)
const String _labParam = String.fromEnvironment('LAB', defaultValue: '0');

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Chọn trang khởi đầu dựa trên tham số LAB
  static Widget _resolveHome() {
    switch (_labParam) {
      case '1':
        return const Lab1();
      case '2':
        return const Lab2();
      case '3':
        return const Lab3();
      case '4':
        return const Lab4();
      case '5':
        return const Lab5();
      case '6':
        return const Lab6();
      case '7':
        return const Lab7();
      case '8':
        return const Lab8();
      case '9':
        return const Lab9();
      default:
        return const MainMenu();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Course Labs',
      theme: appTheme,
      home: _resolveHome(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> labs = [
      {
        'title': 'Lab 1: I Am Rich',
        'icon': Icons.diamond,
        'page': const Lab1(),
      },
      {'title': 'Lab 2: MiCard', 'icon': Icons.badge, 'page': const Lab2()},
      {'title': 'Lab 3: Dicee', 'icon': Icons.casino, 'page': const Lab3()},
      {
        'title': 'Lab 4: Magic 8 Ball',
        'icon': Icons.circle,
        'page': const Lab4(),
      },
      {
        'title': 'Lab 5: Xylophone',
        'icon': Icons.music_note,
        'page': const Lab5(),
      },
      {'title': 'Lab 6: Quizzler', 'icon': Icons.quiz, 'page': const Lab6()},
      {
        'title': 'Lab 7: Destini',
        'icon': Icons.auto_stories,
        'page': const Lab7(),
      },
      {
        'title': 'Lab 8: BMI Calculator',
        'icon': Icons.monitor_weight,
        'page': const Lab8(),
      },
      {'title': 'Lab 9: Clima', 'icon': Icons.cloud, 'page': const Lab9()},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Course Labs')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: labs.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(labs[index]['icon'], color: AppColors.primary),
              title: Text(
                labs[index]['title'],
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => labs[index]['page']),
              ),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:labs/common/app_colors.dart';
import 'package:labs/pages/Lab6.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 6 - Quizzler',
      theme: appTheme,
      home: const Lab6(),
    );
  }
}

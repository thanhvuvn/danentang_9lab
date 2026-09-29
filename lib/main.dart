import 'package:flutter/material.dart';
import 'package:labs/common/app_colors.dart';
import 'package:labs/pages/Lab3.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 3 - Dice Game',
      theme: appTheme,
      home: const Lab3(),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:magazine/page/home/home.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  void _navigateToMainScreen() async {
    await Future.delayed(const Duration(seconds: 2)); // Задержка в 5 секунд
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ), // Замените на ваш главный экран
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 400,
        ),
      ),
    );
  }
}

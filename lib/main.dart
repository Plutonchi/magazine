import 'package:flutter/material.dart';
import 'package:magazine/page/page.dart';

import 'page/home/home.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xff0C222F),
        appBarTheme:
            AppBarTheme(backgroundColor: Color(0xff0C222F), elevation: 0),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SpalshScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:magazine/page/page.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF181C2E),
          brightness: Brightness.dark,
          textTheme: TextTheme()),
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xffffffff),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

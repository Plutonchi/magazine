import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magazine/page/page.dart';
import 'bloc/bloc.dart';

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
        scaffoldBackgroundColor: Color(0xffffffff),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SplashBloc()),
          BlocProvider(create: (context) => OnboardingBloc()),
        ],
        child: SplashScreen(),
      ),
    );
  }
}

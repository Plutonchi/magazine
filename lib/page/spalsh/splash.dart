// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:magazine/bloc/splash/splash_bloc.dart';
// import 'package:magazine/page/page.dart';

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final bloc = BlocProvider.of<SplashBloc>(context);

//     Future<void>.delayed(Duration(seconds: 2), () {
//       bloc.add(SplashEvent.splashFinished);
//     });

//     return BlocListener<SplashBloc, bool>(
//       listener: (context, splashFinished) {
//         if (splashFinished) {
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => OnboardingScreen()),
//           );
//         }
//       },
//       child: Scaffold(
//         body: Center(
//           child: Image.asset(
//             'assets/images/logo.png',
//           ),
//         ),
//       ),
//     );
//   }
// }

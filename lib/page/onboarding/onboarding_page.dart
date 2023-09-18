// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:magazine/bloc/onboarding/onboarding_bloc.dart';
// import 'package:magazine/page/page.dart';

// class OnboardingScreen extends StatelessWidget {
//   final List<Map<String, String>> _onboardingData = [
//     {
//       'title': 'All your favorites',
//       'description':
//           'Get all your loved foods in one once place, you just place the orer we do the rest',
//       'imageUrl': 'assets/images/onboarding/1.png',
//     },
//     {
//       'title': 'Order from choosen chef',
//       'description':
//           'Get all your loved foods in one once place, you just place the orer we do the rest',
//       'imageUrl': 'assets/images/onboarding/2.png',
//     },
//     {
//       'title': 'Free delivery offers',
//       'description':
//           'Get all your loved foods in one once place, you just place the orer we do the rest',
//       'imageUrl': 'assets/images/onboarding/3.png',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(25),
//         child: BlocProvider(
//           create: (context) => OnboardingBloc(),
//           child: BlocConsumer<OnboardingBloc, int>(
//             listener: (context, currentPage) {
//               if (currentPage == -1) {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(
//                     builder: (context) => Login(),
//                   ),
//                 );
//               }
//             },
//             builder: (context, currentPage) {
//               if (currentPage < 0 || currentPage >= _onboardingData.length) {
//                 return Container();
//               }

//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     _onboardingData[currentPage]['imageUrl']!,
//                     height: 400,
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     _onboardingData[currentPage]['title']!,
//                     style: const TextStyle(
//                       fontSize: 26,
//                       fontFamily: 'SenExtraBold',
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     _onboardingData[currentPage]['description']!,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 18, fontFamily: 'SenRegular'),
//                   ),
//                   SizedBox(height: 70),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFFFF7622),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           minimumSize:
//                               Size(MediaQuery.of(context).size.width / 1.2, 55),
//                         ),
//                         onPressed: () {
//                           final bloc = BlocProvider.of<OnboardingBloc>(context);
//                           if (currentPage == _onboardingData.length - 1) {
//                             bloc.add(OnboardingEvent.lastPage);
//                           } else {
//                             bloc.add(OnboardingEvent.nextPage);
//                           }
//                         },
//                         child: Text(
//                           currentPage == _onboardingData.length - 1
//                               ? 'Get Started'
//                               : 'Next',
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontFamily: 'SenExtraBold',
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   currentPage == _onboardingData.length - 1
//                       ? SizedBox()
//                       : TextButton(
//                           onPressed: () {
//                             final bloc =
//                                 BlocProvider.of<OnboardingBloc>(context);
//                             bloc.add(OnboardingEvent.lastPage);
//                           },
//                           child: const Text(
//                             'Skip',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 16,
//                               fontFamily: 'SenRegular',
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

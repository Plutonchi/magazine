import 'dart:io';

import 'package:flutter/material.dart';
import 'package:magazine/page/auth/forgot/forgot_password.dart';
import 'package:magazine/page/auth/location/location_access.dart';
import 'package:magazine/page/auth/widgets/register_text_widgets.dart';
import 'package:magazine/page/auth/widgets/register_widgets.dart';
import 'package:magazine/utils/app_colors/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../signin/sign_in_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Color(0xFF121223),
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SenRegular',
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Please sign in to your existing account',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SenRegular',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.all(24),
                height: MediaQuery.of(context).size.height / 1.478,
                // height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegisterTextWidgets(
                      text: "EMAIL",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RegisterWidget(
                      controller: _emailController,
                      hintText: 'example@gmail.com',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RegisterTextWidgets(
                      text: "PASSWORD",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RegisterWidget(
                      controller: _passwordController,
                      hintText: '* * * * * * * *',
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: AppColors.colorA0,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                                border: Border.all(
                                  width: 3,
                                  color: Color(0xffE3EBF2),
                                ),
                              ),
                              // child: Checkbox(
                              //     checkColor: Colors.black,
                              //     activeColor: Colors.transparent,

                              //     onChanged: (value) {
                              //       setState(() {
                              //         _rememberMe = value!;
                              //       });
                              //     }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                color: Color(0xFF7E8A97),
                                fontSize: 13,
                                fontFamily: "SenRegular",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPassword(),
                                  ),
                                );
                              },
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SenRegular",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFF7622),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 31,
                    ),
                    SizedBox(
                      height: 62,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationAccess(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                            backgroundColor: AppColors.colorF7),
                        child: Center(
                          child: Text("Log In",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "SenRegular",
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        // width: 327,
                        // height: 62,
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(12),
                        //     color: AppColors.colorF7),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "SenRegular",
                              fontWeight: FontWeight.w400,
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ),
                              );
                            },
                            child: Text("Sign Up",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.colorF7,
                                  fontFamily: "SenRegular",
                                  fontWeight: FontWeight.w700,
                                )))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: RegisterTextWidgets(text: "Or"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 62,
                          height: 62,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/facebook.svg',
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Platform.isIOS
                            ? Container(
                                width: 62,
                                height: 62,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  'assets/svg/ios.svg',
                                ),
                              )
                            : Container(
                                width: 62,
                                height: 62,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  'assets/svg/google.svg',
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

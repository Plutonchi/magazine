import 'package:flutter/material.dart';
import 'package:magazine/page/auth/widgets/register_text_widgets.dart';
import 'package:magazine/page/auth/widgets/register_widgets.dart';
import 'package:magazine/utils/app_colors/app_color.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

final _emailController = TextEditingController();
final _userNameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _reTypePasswordController = TextEditingController();

class _SignInPageState extends State<SignInPage> {
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
                        'Sign Up',
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
                        'Please sign up to get started',
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
                height: MediaQuery.of(context).size.height / 1.35,
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
                      text: "NAME",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RegisterWidget(
                      controller: _emailController,
                      hintText: 'example@gmail.com',
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        RegisterTextWidgets(
                          text: "Re-Type Password",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RegisterWidget(
                          controller: _reTypePasswordController,
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
                          height: 10,
                        ),
                        SizedBox(
                          height: 31,
                        ),
                        SizedBox(
                          height: 62,
                          child: ElevatedButton(
                            onPressed: () {},
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
                          height: 38,
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
                          height: 20,
                        ),
                        Center(
                          child: RegisterTextWidgets(text: "Or"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              maxRadius: 30,
                              minRadius: 30,
                              backgroundImage:
                                  AssetImage("assets/images/facebook.png"),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            CircleAvatar(
                              maxRadius: 30,
                              minRadius: 30,
                              backgroundImage:
                                  AssetImage("assets/images/twitter.png"),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            CircleAvatar(
                              maxRadius: 30,
                              minRadius: 30,
                              backgroundImage:
                                  AssetImage("assets/images/apple.png"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

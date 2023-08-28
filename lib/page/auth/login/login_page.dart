import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magazine/bloc/bloc.dart';
import 'package:magazine/page/auth/signin/sign_in_page.dart';
import 'package:magazine/page/auth/widgets/register_text_widgets.dart';
import 'package:magazine/page/auth/widgets/register_widgets.dart';
import 'package:magazine/page/home/home.dart';
import 'package:magazine/utils/app_colors/app_color.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool _rememberMe = false;

void login(BuildContext context) {
  final String email = _emailController.text;
  final String password = _passwordController.text;

  BlocProvider.of<AuthenticationBloc>(context).add(
    LoginRequested(
      email: email,
      password: password,
      rememberMe: _rememberMe,
    ),
  );
}

void _resetPassword(BuildContext context) {
  final String email = _emailController.text;
  BlocProvider.of<AuthenticationBloc>(context).add(
    ResetPasswordRequested(
      email,
    ),
  );
}

void _navigationToRegistratoin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SignInPage(),
    ),
  );
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final passwordVisibilityCubit = context.watch<PasswordVisibilityCubit>();

    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (state is AuthenticationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
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
                    height: MediaQuery.of(context).size.height / 1.45,
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
                          obscureText: passwordVisibilityCubit.state,
                          hintText: '* * * * * * * *',
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisibilityCubit.state
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.colorA0,
                            ),
                            onPressed: () {
                              passwordVisibilityCubit.toggleVisibility();
                            },
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
                                  child: Checkbox(
                                      checkColor: Colors.black,
                                      activeColor: Colors.transparent,
                                      value: _rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value!;
                                        });
                                      }),
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
                                  onPressed: () => _resetPassword(context),
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
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(),
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
                                onPressed: () {},
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

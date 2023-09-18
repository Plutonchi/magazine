import 'package:flutter/material.dart';
import 'package:magazine/page/auth/location/location_access.dart';
import 'package:magazine/page/auth/widgets/register_text_widgets.dart';
import 'package:magazine/page/auth/widgets/register_widgets.dart';
import 'package:magazine/utils/app_colors/app_color.dart';

class SignInPage extends StatefulWidget {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                margin: EdgeInsets.only(left: 24),
                padding: EdgeInsets.only(right: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                width: 50,
                height: 50,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xff5E616F),
                      size: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
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
                height: MediaQuery.of(context).size.height,
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
                      hintText: 'Jonh Doe',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RegisterTextWidgets(
                      text: "EMAIL",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    RegisterWidget(
                      controller: _emailController,
                      hintText: 'example@gmail.com',
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegisterTextWidgets(
                          text: "PASSWORD",
                        ),
                        SizedBox(
                          height: 8,
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
                          height: 24,
                        ),
                        RegisterTextWidgets(
                          text: "Re-Type Password",
                        ),
                        SizedBox(
                          height: 8,
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
                          height: 47,
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
                              child: Text("SING UP",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "SenRegular",
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                          ),
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

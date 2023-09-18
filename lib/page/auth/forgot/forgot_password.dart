import 'package:flutter/material.dart';
import 'package:magazine/page/auth/verification/verification.dart';
import 'package:magazine/page/auth/widgets/register_text_widgets.dart';
import 'package:magazine/page/auth/widgets/register_widgets.dart';
import 'package:magazine/utils/app_colors/app_color.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.color12,
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
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Forgot Password',
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
                    SizedBox(
                      height: 49,
                    ),
                    Container(
                      padding: const EdgeInsets.all(24),
                      height: MediaQuery.of(context).size.height / 1.4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            height: 30,
                          ),
                          SizedBox(
                            height: 62,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Verification(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: AppColors.colorF7),
                              child: Center(
                                child: Text("SEND CODE",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "SenRegular",
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
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

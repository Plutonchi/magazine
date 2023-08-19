import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                height: MediaQuery.of(context).size.height / 1.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

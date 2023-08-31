import 'package:flutter/material.dart';
import 'package:magazine/page/auth/location/location_access.dart';
import 'package:magazine/page/auth/widgets/register_text_widgets.dart';
import 'package:magazine/page/auth/widgets/register_widgets.dart';
import 'package:magazine/utils/app_colors/app_color.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatefulWidget {
  Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Colors.transparent;
    const fillColor = Color(0xFFF0F5FA);
    const borderColor = Color.fromARGB(255, 0, 0, 0);
    final defaultPinTheme = PinTheme(
      width: 62,
      height: 62,
      textStyle: const TextStyle(
        fontSize: 18,
        fontFamily: 'SenRegular',
        fontWeight: FontWeight.w700,
        color: Color(0xFF32343E),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Form(
      key: formKey,
      child: Scaffold(
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
                        'Verification',
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
                        'We have sent a code to your email',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SenRegular',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'example@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'SenRegular',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(
                        height: 50,
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
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RegisterTextWidgets(
                                text: "CODE",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Pinput(
                                  controller: pinController,
                                  focusNode: focusNode,
                                  androidSmsAutofillMethod:
                                      AndroidSmsAutofillMethod
                                          .smsUserConsentApi,
                                  listenForMultipleSmsOnAndroid: true,
                                  defaultPinTheme: defaultPinTheme,
                                  separatorBuilder: (index) =>
                                      const SizedBox(width: 27),
                                  validator: (value) {
                                    value == '2222' ? null : 'Pin is incorrect';
                                  },
                                  hapticFeedbackType:
                                      HapticFeedbackType.lightImpact,
                                  onCompleted: (pin) {
                                    debugPrint('onCompleted: $pin');
                                  },
                                  onChanged: (value) {
                                    debugPrint('onChanged: $value');
                                  },
                                  focusedPinTheme: defaultPinTheme.copyWith(
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      borderRadius: BorderRadius.circular(2),
                                      border:
                                          Border.all(color: focusedBorderColor),
                                    ),
                                  ),
                                  submittedPinTheme: defaultPinTheme.copyWith(
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      color: fillColor,
                                      borderRadius: BorderRadius.circular(2),
                                      border:
                                          Border.all(color: focusedBorderColor),
                                    ),
                                  ),
                                  errorPinTheme: defaultPinTheme.copyBorderWith(
                                    border: Border.all(color: Colors.redAccent),
                                  ),
                                ),
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
                                        builder: (context) => LocationAccess(),
                                      ),
                                    );
                                    focusNode.unfocus();
                                    formKey.currentState!.validate();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      backgroundColor: AppColors.colorF7),
                                  child: Center(
                                    child: Text("VERIFY",
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

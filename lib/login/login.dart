import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/final_page.dart';
import 'package:flutter_application_1/login/enter_email.dart';
import 'package:flutter_application_1/login/enter_phone.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/login/google_button.dart';
import 'package:flutter_application_1/login/not_registered.dart';
import 'package:flutter_application_1/login/or_with_lines.dart';
import 'package:flutter_application_1/login/otp_button.dart';
import 'package:flutter_application_1/login/phone_email_container.dart';
import 'package:flutter_application_1/user_data.dart';
import 'package:flutter_application_1/verification/verification.dart';

final userData = UserData();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String errorText = "";
  bool isPhoneActive = true;
  bool inCorrectData = false;
  final verifyEmailAndPassword = checkEmailAndPassword;
  void switchActive() {
    setState(() {
      isPhoneActive = !isPhoneActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: calcWidth(36, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: calcHeight(60, context),
                ),
                const AutoSizeText(
                  'Login Account',
                  style: h2TextStyle,
                ),
                AutoSizeText(
                  'Hello, welcome back to our account',
                  style: basicTextStyle,
                ),
                SizedBox(
                  height: calcHeight(65, context),
                ),
                PhoneEmailContainer(
                  isPhoneActive: isPhoneActive,
                  switchActive: switchActive,
                ),
                SizedBox(
                  height: calcHeight(110, context),
                ),
                isPhoneActive
                    ? const EnterPhone(
                        onChanged: onPhoneChanged,
                      )
                    : EnterEmail(
                        userData: userData,
                      ),
                SizedBox(
                  height: calcHeight(60, context),
                  child: errorText.isEmpty
                      ? null
                      : Center(
                          child: AutoSizeText(
                            errorText,
                            style: errorText12PX,
                          ),
                        ),
                ),
                isPhoneActive
                    ? OtpButton(
                        onPressed: () {
                          if (userData.phone.length >= 9 &&
                              userData.phone.length <= 13) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Verification(
                                  userdata: userData,
                                ),
                              ),
                            );
                          } else {
                            setState(() {
                              errorText =
                                  "Phone number must be in range 9 and 13";
                              Timer(const Duration(seconds: 3), () {
                                errorText = '';
                              });
                            });
                          }
                        },
                        text: "Request OTP")
                    : OtpButton(
                        onPressed: () {
                          if (userData.email.isEmpty ||
                              userData.password.isEmpty) {
                            setState(() {
                              errorText =
                                  "Enter ${userData.email.isEmpty ? "email" : "password"} before clicking this button";
                              Timer(const Duration(seconds: 3), () {
                                errorText = '';
                              });
                            });
                          } else if (verifyEmailAndPassword(
                            email: userData.email,
                            password: userData.password,
                          )) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const FinalPage(),
                              ),
                            );
                          } else {
                            setState(() {
                              errorText =
                                  "Invalid Username or Password. Try Again!";
                              Timer(const Duration(seconds: 3), () {
                                errorText = '';
                              });
                            });
                          }
                        },
                        text: "Login",
                      ),
                SizedBox(
                  height: calcHeight(71, context),
                ),
                const OrWithLines(),
                SizedBox(
                  height: calcHeight(80, context),
                ),
                GoogleButton(onPressed: () {}),
                SizedBox(
                  height: calcHeight(40, context),
                ),
                const NotRegistered(),
                SizedBox(
                  height: calcHeight(92, context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

onPhoneChanged(String text) {
  userData.phone = text;
}

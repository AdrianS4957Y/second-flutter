import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/login/login.dart';
import 'package:flutter_application_1/user_data.dart';
import 'package:flutter_application_1/verification/enter_otp.dart';
import 'package:flutter_application_1/verification/header.dart';

class Verification extends StatefulWidget {
  final UserData userdata;
  // ignore: prefer_const_constructors_in_immutables
  Verification({
    super.key,
    required this.userdata,
  });

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: calcHeight(
                  61,
                  context,
                ),
              ),
              const Header(),
              SizedBox(
                height: calcHeight(
                  53,
                  context,
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/verification_img.png",
                  height: calcHeight(256, context),
                  width: calcWidth(258, context),
                ),
              ),
              SizedBox(
                height: calcHeight(65, context),
              ),
              EnterOtp(
                phoneNumber: widget.userdata.phone,
                userData: userData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

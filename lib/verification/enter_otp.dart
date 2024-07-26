import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/final_page.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/login/active_otp.dart';
import 'package:flutter_application_1/login/otp_button.dart';
import 'package:flutter_application_1/user_data.dart';

class EnterOtp extends StatefulWidget {
  final String phoneNumber;
  final UserData userData;
  const EnterOtp({
    super.key,
    required this.phoneNumber,
    required this.userData,
  });

  @override
  _EnterOtpState createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  List<String> otp = List.filled(4, "", growable: true);
  String errorText = '';
  bool showLoading = false;
  final otpFieldsList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final verifyOTP = checkOTP;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(left: calcWidth(36, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          textDirection: TextDirection.ltr,
          children: [
            const AutoSizeText(
              textAlign: TextAlign.left,
              "Enter OTP",
              style: superBigText,
              maxLines: 1,
            ),
            AutoSizeText(
              "An 4 digit code has been sent to ${widget.phoneNumber}",
              maxLines: 2,
            ),
            SizedBox(
              height: calcHeight(35, context),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: calcWidth(92, context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: otpFieldsList
                    .map(
                      (e) =>
                          buildOtpField(context, e, onChanged: (String text) {
                        int index = otpFieldsList.indexWhere((controller) {
                          return controller.hashCode == e.hashCode;
                        });
                        otp[index] = text;
                      }),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: calcHeight(70, context),
              child: errorText.isEmpty
                  ? null
                  : Padding(
                      padding: EdgeInsets.only(top: calcHeight(23, context)),
                      child: AutoSizeText(
                        errorText,
                        style: errorText12PX,
                      ),
                    ),
            ),
            showLoading
                ? ActiveOtp(onPressed: () {})
                : OtpButton(
                    onPressed: () {
                      if (otp.every((e) => e.isNotEmpty)) {
                        setState(() {
                          showLoading = true;
                        });
                        Timer(const Duration(seconds: 3), () {
                          setState(() {
                            showLoading = false;
                          });
                          if (verifyOTP(otp.join())) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const FinalPage(),
                              ),
                            );
                          } else {
                            setState(() {
                              errorText = "Invalid or Incorrect OTP. Try Again";
                              Timer(const Duration(seconds: 2), () {
                                setState(() {
                                  // ignore: avoid_function_literals_in_foreach_calls
                                  otp.forEach((str) {
                                    str = '';
                                  });
                                  // ignore: avoid_function_literals_in_foreach_calls
                                  otpFieldsList.forEach((controller) {
                                    controller.clear();
                                  });
                                  errorText = '';
                                });
                              });
                            });
                          }
                        });
                      }
                    },
                    text: "verify"),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  calcHeight(35, context),
                  calcWidth(36, context),
                  0,
                ),
                child: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  child: const AutoSizeText(
                    textAlign: TextAlign.center,
                    "Resend OTP",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOtpField(BuildContext context, TextEditingController controller,
      {void Function(String)? onChanged}) {
    return Container(
      width: calcHeight(64, context),
      height: calcWidth(63, context),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        style: superBigText,
      ),
    );
  }
}

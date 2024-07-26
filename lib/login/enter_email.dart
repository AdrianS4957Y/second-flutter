import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/login/login.dart';
import 'package:flutter_application_1/user_data.dart';

final containerDecoration = BoxDecoration(
  border: Border(
    bottom: BorderSide(
      color: colors["grey_border"] ?? const Color(0xFF000000),
    ),
  ),
);

class EnterEmail extends StatefulWidget {
  final UserData userData;
  // ignore: prefer_const_constructors_in_immutables
  EnterEmail({super.key, required this.userData});

  @override
  _EnterEmailState createState() => _EnterEmailState();
}

class _EnterEmailState extends State<EnterEmail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: calcWidth(356, context),
      child: Column(
        children: [
          Container(
            decoration: containerDecoration,
            child: Row(
              children: [
                Image.asset(
                  "assets/email.png",
                ),
                SizedBox(width: calcWidth(36, context)),
                Expanded(
                  child: TextField(
                    onChanged: (String text) {
                      userData.email = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: true,
                    decoration: const InputDecoration(
                      hintText: 'Email ID',
                      border: InputBorder.none,
                    ),
                    style: basicTextStyle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: calcHeight(43, context)),
          Container(
            decoration: containerDecoration,
            child: Row(
              children: [
                Image.asset(
                  "assets/lock.png",
                ),
                SizedBox(width: calcWidth(36, context)),
                Expanded(
                  child: TextField(
                    onChanged: (String text) {
                      userData.password = text;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                    ),
                    style: basicTextStyle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/login/login.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
  });

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: calcWidth(36, context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                size: calcWidth(27, context),
              ),
            ),
            const AutoSizeText(
              "OTP Verification",
              style: h2TextStyle,
            ),
            SizedBox(
              width: calcWidth(27, context),
            )
          ],
        ),
      ),
    );
  }
}

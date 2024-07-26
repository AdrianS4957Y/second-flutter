import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';

class GoogleButton extends StatefulWidget {
  final dynamic onPressed;
  const GoogleButton({
    super.key,
    required this.onPressed,
  });

  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: calcHeight(57, context),
      width: calcWidth(356, context),
      color: Colors.white,
      child: TextButton(
          onPressed: widget.onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/google.png"),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: calcWidth(52, context)),
                child: const AutoSizeText(
                  "Login with Google",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )),
    );
  }
}

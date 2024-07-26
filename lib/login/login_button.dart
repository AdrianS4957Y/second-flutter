import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';

class LoginButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Function checkActive;

  const LoginButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.checkActive,
  });

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void _handlePress() {
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: calcHeight(44, context),
      width: calcWidth(172, context),
      child: TextButton(
        onPressed: widget.checkActive() ? null : _handlePress,
        style: widget.checkActive()
            ? const ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Colors.white,
                ),
              )
            : const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.transparent,
                ),
              ),
        child: Text(
          widget.text,
          style: basicTextStyle,
        ),
      ),
    );
  }
}

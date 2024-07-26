import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';

class OtpButton extends StatefulWidget {
  final dynamic onPressed;
  final String text;
  const OtpButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  _OtpButtonState createState() => _OtpButtonState();
}

class _OtpButtonState extends State<OtpButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: calcHeight(57, context),
      width: calcWidth(356, context),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xB2FF9B63),
            Color(0xB2FF621F),
          ],
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: TextButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

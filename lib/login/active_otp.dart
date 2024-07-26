import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';

class ActiveOtp extends StatefulWidget {
  final dynamic onPressed;
  const ActiveOtp({
    super.key,
    required this.onPressed,
  });

  @override
  _ActiveOtpState createState() => _ActiveOtpState();
}

class _ActiveOtpState extends State<ActiveOtp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: calcHeight(57, context),
      width: calcWidth(356, context),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFF9B63),
            Color(0xFFFF621F),
          ],
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: TextButton.icon(
        label: const Text(
          "Verifying...",
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        onPressed: widget.onPressed,
        icon: Image.asset("assets/loading.png"),
      ),
    );
  }
}

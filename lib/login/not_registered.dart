import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';

class NotRegistered extends StatefulWidget {
  const NotRegistered({
    super.key,
  });

  @override
  _NotRegisteredState createState() => _NotRegisteredState();
}

class _NotRegisteredState extends State<NotRegistered> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AutoSizeText(
          "Not Registered yet? ",
          style: TextStyle(
            fontSize: calcHeight(16, context),
          ),
        ),
        AutoSizeText(
          "Create an Account",
          style: TextStyle(
            fontSize: calcHeight(16, context),
          ),
        ),
      ],
    );
  }
}

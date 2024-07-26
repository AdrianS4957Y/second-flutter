import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/verification/header.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({
    super.key,
  });

  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: calcHeight(90, context),
            ),
            const Header(),
            const Text(
              "404. Not found",
              style: superBigText,
            ),
          ],
        ),
      ),
    );
  }
}

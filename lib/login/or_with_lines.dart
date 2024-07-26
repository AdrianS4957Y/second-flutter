import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';

class OrWithLines extends StatefulWidget {
  const OrWithLines({
    super.key,
  });

  @override
  _OrWithLinesState createState() => _OrWithLinesState();
}

class _OrWithLinesState extends State<OrWithLines> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration:
              const BoxDecoration(border: Border.fromBorderSide(BorderSide())),
          height: 1,
          width: calcWidth(156, context),
        ),
        const Text("OR"),
        Container(
          decoration:
              const BoxDecoration(border: Border.fromBorderSide(BorderSide())),
          height: 1,
          width: calcWidth(156, context),
        ),
      ],
    );
  }
}

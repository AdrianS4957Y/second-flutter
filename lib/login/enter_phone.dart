import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';

class EnterPhone extends StatefulWidget {
  final void Function(String)? onChanged;
  const EnterPhone({
    super.key,
    this.onChanged,
  });

  @override
  _EnterPhoneState createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: calcWidth(356, context),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors["grey_border"] ?? const Color(0xFF000000),
          ),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/phone.png",
          ),
          SizedBox(width: calcWidth(36, context)),
          Expanded(
            child: TextField(
              onChanged: widget.onChanged,
              keyboardType: TextInputType.phone,
              autocorrect: true,
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                border: InputBorder.none,
              ),
              style: basicTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

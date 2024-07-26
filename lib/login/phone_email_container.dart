import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/login/login_button.dart';

class PhoneEmailContainer extends StatefulWidget {
  final bool isPhoneActive;
  final void Function() switchActive;
  const PhoneEmailContainer({
    super.key,
    required this.isPhoneActive,
    required this.switchActive,
  });

  @override
  _PhoneEmailContainerState createState() => _PhoneEmailContainerState();
}

class _PhoneEmailContainerState extends State<PhoneEmailContainer> {
  bool checkIsActive(bool isPhone) {
    return isPhone ? widget.isPhoneActive : !widget.isPhoneActive;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: calcWidth(356, context),
      height: calcHeight(56, context),
      decoration: BoxDecoration(
          color: colors["light_grey"],
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: calcHeight(6, context),
            horizontal: calcWidth(6, context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LoginButton(
              onPressed: widget.switchActive,
              text: "Phone Number",
              checkActive: () => checkIsActive(true),
            ),
            LoginButton(
              onPressed: widget.switchActive,
              text: "Email",
              checkActive: () => checkIsActive(false),
            )
          ],
        ),
      ),
    );
  }
}

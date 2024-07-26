import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_data.dart';

const colors = {
  "orange": Color(0xFFFFA500),
  "grey": Color(0xFF595959),
  "light_grey": Color(0xFFEDEDED),
  "grey_border": Color(0xFF979797),
};
double calcHeight(num number, BuildContext context) {
  return number * MediaQuery.of(context).size.height / 926;
}

double calcWidth(num number, BuildContext context) {
  return number * MediaQuery.of(context).size.width / 428;
}

final basicTextStyle = TextStyle(
  fontSize: 14,
  fontFamily: "Inter",
  fontWeight: FontWeight.w600,
  color: colors["grey"],
);
const errorText12PX = TextStyle(
    fontSize: 12,
    fontFamily: "Inter",
    fontWeight: FontWeight.w600,
    color: Colors.red);
const h2TextStyle = TextStyle(
  fontSize: 20,
  fontFamily: "Inter",
  fontWeight: FontWeight.w600,
);
const superBigText = TextStyle(
  fontSize: 25,
  fontFamily: "Inter",
  fontWeight: FontWeight.w700,
);
UserData defaultUserData = UserData(email: "a@b.exe", password: "1234");
bool checkOTP(String otp) {
  return otp == "1234";
}

bool checkEmailAndPassword({required String email, required String password}) {
  return email == defaultUserData.email && password == defaultUserData.password;
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/login/login.dart';

TextStyle buttonTextStyle({Color? color}) {
  return TextStyle(
    color: color ?? Colors.black,
    fontFamily: "Inter",
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

ButtonStyle customButtonStyle({Color? bgColor}) {
  return ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(bgColor ?? Colors.black),
    shape: const WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    ),
  );
}

double buttonWidthProc = 356 / 428;

class Aliments extends StatelessWidget {
  const Aliments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: calcHeight(659, context),
                child: Center(
                  child: Image.asset(
                    'assets/aliments.png',
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: calcHeight(267, context),
                child: Container(
                    color: colors['orange'],
                    height: double.maxFinite,
                    child: Column(
                      children: [
                        SizedBox(
                          height: calcHeight(54, context),
                        ),
                        SizedBox(
                          width: buttonWidthProc *
                              MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: () {
                              if (kDebugMode) {
                                print("Pressed login");
                              }
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                            style: customButtonStyle(bgColor: Colors.white),
                            child: Text(
                              "Login",
                              style: buttonTextStyle(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: calcHeight(25, context),
                        ),
                        SizedBox(
                          width: buttonWidthProc *
                              MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: () {},
                            style: customButtonStyle(bgColor: Colors.black),
                            child: Text(
                              "Register",
                              style: buttonTextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

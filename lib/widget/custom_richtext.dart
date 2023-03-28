import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../screen/register.dart';
import '../utils/const.dart';
class CustomRegietrText extends StatelessWidget {
  String text;
  String redirectText;
  VoidCallback ontap;
   CustomRegietrText({
    super.key,
    required this.text,
    required this.redirectText,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
            text: 'Already Sign In?',
            style: const TextStyle(
                fontFamily: 'BalooBhai',
                fontSize: 18,
                color: TextcustomColor),
            children: [
              TextSpan(
                  text: 'Register',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = ontap)
            ]),
      ),
    );
  }
}

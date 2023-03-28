import 'package:flutter/material.dart';

import '../screen/phonescreen.dart';
import '../utils/const.dart';

class Button extends StatelessWidget {
  String buttonName;
  Button({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27, left: 47, right: 47, bottom: 16),
      child: SizedBox(
          width: double.infinity,
          height: 48,

          // decoration: const BoxDecoration(color: buttonColor),
          child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: buttonColor),
              child: Text(
                buttonName,
                style: const TextStyle(
                  fontSize: 19,
                  fontFamily: 'BalooBhai',
                ),
              ))),
    );
  }
}

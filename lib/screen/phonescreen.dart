import 'package:flutter/material.dart';
import 'package:login_ui/utils/const.dart';
import 'package:login_ui/widget/logo.dart';

import '../widget/button.dart';
import '../widget/custrom_textfield.dart';

class PhoneScreen extends StatefulWidget {
  static var routeName = '/phone';

  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primarycolor,
        body: Column(children: [
          logoWidget(),
          const SizedBox(
            height: 56,
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(39),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: Padding(
                      padding: EdgeInsets.only(top: 53),
                      child: Text(
                        'Create Account with PhoneNumber',
                        style: TextStyle(
                            fontFamily: 'BalooBhai',
                            fontSize: 25,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    Custromtextfield(
                      label: 'PhoneNumber',
                      icon: Icons.phone,
                      hintText: 'Enter the phoneNumber',
                      suffixIcon: false,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Button(
                      buttonName: 'Send Otp',
                    )
                  ],
                )),
          ),
        ]));
  }
}

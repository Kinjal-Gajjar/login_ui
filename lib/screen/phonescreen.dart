import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/const.dart';
import '../widget/button.dart';
import '../widget/custrom_textfield.dart';
import '../widget/logo.dart';
import 'verifyscreen.dart';

class PhoneScreen extends StatefulWidget {
  static var routeName = '/phone';

  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

final formkey = GlobalKey<FormState>();

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
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
                        padding: EdgeInsets.only(top: 53, left: 23),
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
                        validation: 'Please enter phonenumber',
                        controller: phone,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Button(
                        buttonName: 'Send Otp',
                        onpress: ()async {
                          if(formkey.currentState!.validate()){
await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${phone.text.trim()}",
        codeSent: (verificationId, resendToken) {
          Navigator.push(context, MaterialPageRoute(builder:(context)=> VerifyScreen(verificationId: verificationId)));
          
        },
        verificationCompleted: (credential) {},
        verificationFailed: (ex) {
          log(ex.code.toString());
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: const Duration(seconds: 30));
                          }
                        },
                      )
                    ],
                  )),
            ),
          ])),
    );
  }
}

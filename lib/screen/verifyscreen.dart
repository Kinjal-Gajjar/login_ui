import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/const.dart';
import '../widget/button.dart';
import '../widget/custrom_textfield.dart';
import '../widget/logo.dart';
import 'success_screen.dart';

class VerifyScreen extends StatefulWidget {
  String verificationId;
  VerifyScreen({super.key, required this.verificationId});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

final formkey = GlobalKey<FormState>();

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController otp = TextEditingController();

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
                          'VerifyScreen',
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
                        label: 'OTP',
                        icon: Icons.phone,
                        hintText: 'Enter OTP',
                        suffixIcon: false,
                        obscureText: false,
                        validation: 'Please enter OTP',
                        controller: otp,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Button(
                        buttonName: 'Verify Otp',
                        onpress: () async {
                          if (formkey.currentState!.validate()) {
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: widget.verificationId,
                                    smsCode: otp.text.trim());

                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithCredential(credential);
                                  if (userCredential.user != null) {
        Navigator.pushReplacement                                                                                                                                                                 (
            context, MaterialPageRoute(builder: (context) => SuccesScreen()));
      }

                            } on FirebaseAuthException catch (ex) {
      log(ex.code.toString());
    }
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/const.dart';
import '../utils/tost.dart';
import '../widget/authbutton.dart';
import '../widget/button.dart';
import '../widget/custom_divider.dart';
import '../widget/custom_richtext.dart';
import '../widget/custrom_textfield.dart';
import '../widget/logo.dart';
import 'register.dart';
import 'success_screen.dart';

class LoginPage extends StatefulWidget {
  static var routeName = 'login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: primarycolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              logoWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 59, right: 60),
                child: Image.asset('assets/images/im1.png'),
              ),
              const SizedBox(
                height: 37,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(39)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 33,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custromtextfield(
                        label: 'E-mail',
                        icon: Icons.email,
                        obscureText: false,
                        suffixIcon: false,
                        hintText: 'Enter the Email',
                        validation: 'Please enter Email',
                        controller: email,
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Custromtextfield(
                        label: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        suffixIcon: true,
                        hintText: 'Please enter password',
                        validation: 'Please enter password',
                        controller: password,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          'Forgot your password ?',
                          style: TextStyle(
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color(0xffAA7C7C)),
                        ),
                      ),
                      Button(
                        buttonName: 'Login',
                        onpress: () {
                          if (formkey.currentState!.validate()) {
                            auth
                                .signInWithEmailAndPassword(
                                    email: email.text.toString(),
                                    password: password.text.toString())
                                .then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => SuccesScreen()));
                            }).onError((error, stackTrace) {
                              Utils().tostmessage(error.toString());
                            });
                          }
                        },
                      ),
                      CustomDividers(),
                      Authbutton(),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomRegietrText(
                        text: 'Sign In',
                        redirectText: 'Registration',
                        ontap: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

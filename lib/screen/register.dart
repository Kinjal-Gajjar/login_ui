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
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static var routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

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
              const SizedBox(
                height: 39,
              ),
              Container(
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
                        'Create Account',
                        style: TextStyle(
                            fontFamily: 'BalooBhai',
                            fontSize: 25,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    const SizedBox(
                      height: 54,
                    ),
                    Custromtextfield(
                      label: 'Username',
                      icon: Icons.people,
                      obscureText: false,
                      suffixIcon: false,
                      hintText: 'Enter the username',
                      validation: 'Please enter username',
                      controller: username,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Custromtextfield(
                      label: 'E-mail',
                      icon: Icons.email,
                      obscureText: false,
                      suffixIcon: false,
                      hintText: 'Enter the email',
                      validation: 'Please enter email',
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
                    Button(
                      buttonName: 'Registration',
                      onpress: () {
                        if (formkey.currentState!.validate()) {
                          auth
                              .createUserWithEmailAndPassword(
                                  email: email.text.toString(),
                                  password: password.text.toString())
                              .then((value) {
                            Navigator.pushReplacementNamed(
                                context, RegisterScreen.routeName);
                          }).onError((error, stackTrace) {
                            Utils().tostmessage(error.toString());
                          });
                        }
                      },
                    ),
                    const CustomDividers(),
                    const Authbutton(),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomRegietrText(
                      text: 'Log In',
                      redirectText: 'Login',
                      ontap: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

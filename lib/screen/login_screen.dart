import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/screen/register.dart';
import 'package:login_ui/utils/const.dart';
import 'package:login_ui/widget/logo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/authbutton.dart';
import '../widget/button.dart';
import '../widget/custom_divider.dart';
import '../widget/custom_richtext.dart';
import '../widget/custrom_textfield.dart';

class LoginPage extends StatefulWidget {
  static var routeName = 'login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Column(
        children: [
          logoWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 59, right: 60),
            child: Image.asset('assets/images/im1.png'),
          ),
          const SizedBox(
            height: 37,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(39)),
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
                    Button(buttonName: 'Login',),
                    CustomDividers(),
                    Authbutton(),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomRegietrText(text: 'Sign In',redirectText: 'Registration',ontap: (){
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}





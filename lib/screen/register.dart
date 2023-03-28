import 'package:flutter/material.dart';
import 'package:login_ui/utils/const.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Column(
        children: [
          logoWidget(),
          const SizedBox(
            height: 39,
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
                  Button(
                    buttonName: 'Registration',
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
            ),
          )
        ],
      ),
    );
  }
}

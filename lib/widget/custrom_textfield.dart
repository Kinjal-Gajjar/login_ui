import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Custromtextfield extends StatefulWidget {
  IconData icon;
  String label;
  String hintText;
  bool obscureText;
  bool suffixIcon;
  String validation;
  TextEditingController controller;
  Custromtextfield({
    super.key,
    required this.icon,
    required this.label,
    required this.suffixIcon,
    required this.obscureText,
    required this.hintText,
    required this.validation,
    required this.controller,
  });

  @override
  State<Custromtextfield> createState() => _CustromtextfieldState();
}

class _CustromtextfieldState extends State<Custromtextfield> {
  // Toggles the password show status
  void togglePasswordStatus() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 58,
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
                fontFamily: 'BalooBhai',
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: Color(0xffA68787)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 47, right: 48),
          child: TextFormField(
              cursorColor: const Color(0xffDEACAC),
              obscureText: widget.obscureText,
              controller: widget.controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return widget.validation;
                }
              },
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                      fontFamily: 'BalooBhai',
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                  suffixIcon: widget.suffixIcon
                      ? IconButton(
                          icon: Icon(
                            widget.obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: togglePasswordStatus,
                          color: const Color(0xffDEACAC),
                        )
                      : null,
                  prefixIcon: Icon(widget.icon),
                  prefixIconColor: const Color(0xffDEACAC),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xffDEACAC))),
                  fillColor: const Color(0xffFFF9F9),
                  focusColor: const Color(0xffDEACAC),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffDEACAC)),
                      borderRadius: BorderRadius.circular(15)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffDEACAC)),
                      borderRadius: BorderRadius.circular(15)),
                  hoverColor: const Color(0xffDEACAC))),
        ),
      ],
    );
  }
}

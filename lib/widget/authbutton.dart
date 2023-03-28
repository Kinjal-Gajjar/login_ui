import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screen/phonescreen.dart';
import '../screen/success_screen.dart';

class Authbutton extends StatelessWidget {
  const Authbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 15, bottom: 15),
                  backgroundColor: const Color(0xffC14949),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SuccesScreen();
                  },
                ));
              },
              child: const Icon(FontAwesomeIcons.google)),
          const SizedBox(
            width: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PhoneScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 15, bottom: 15),
                  backgroundColor: const Color.fromARGB(255, 40, 131, 101),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29))),
              child: const Icon(FontAwesomeIcons.phone)),
        ],
      ),
    );
  }
}

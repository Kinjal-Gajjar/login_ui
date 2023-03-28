import 'package:flutter/material.dart';
class CustomDividers extends StatelessWidget {
  const CustomDividers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 65,
      ),
      child: Row(
        children: [
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.32,
            color: const Color(0xffB97E7E),
          ),
          const Text(
            ' OR ',
            style: TextStyle(color: Color(0xffB97E7E)),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.32,
            color: const Color(0xffB97E7E),
          ),
        ],
      ),
    );
  }
}

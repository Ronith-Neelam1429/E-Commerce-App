import 'package:flutter/material.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Column(
        children: [
          Text("Thank you for your order!"),
        ],
      ),
    );
  }
}

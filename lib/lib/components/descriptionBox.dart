import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // TextStyle
    var myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.all(25),
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Delivery fee
            Column(
              children: [
                Text(
                  "\$0.99",
                  style: myPrimaryTextStyle,
                ),
                Text(
                  "Delivery fee",
                  style: mySecondaryTextStyle,
                ),
              ],
            ),

            // Delivery time
            Column(
              children: [
                Text(
                  "15-30 min",
                  style: myPrimaryTextStyle,
                ),
                Text(
                  "Delivery time",
                  style: mySecondaryTextStyle,
                ),
              ],
            ),
          ],
        ));
  }
}

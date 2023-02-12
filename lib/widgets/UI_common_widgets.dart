import 'package:flutter/material.dart';
import 'package:liveasy_assignment/constants/color_constants.dart';

class CommonWidgets {
  static Text heading(String text, BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.031,
          fontWeight: FontWeight.bold),
    );
  }

  static TextButton elevatedButton(
      String text, BuildContext context, String route) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: ColorConstants.buttonBackgroundColor,
          foregroundColor: ColorConstants.buttonTextColor,
          padding: const EdgeInsets.symmetric(vertical: 23.5),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.027,
                  color: ColorConstants.buttonTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  static Text subheading(String text, BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.020),
    );
  }

  static SizedBox addverticalHeight(double height) {
    return SizedBox(height: height);
  }
}

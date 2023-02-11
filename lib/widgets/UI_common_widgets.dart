import 'package:flutter/material.dart';
import 'package:liveasy_assignment/constants/color_constants.dart';

class CommonWidgets {
  static Text heading(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
    );
  }

  static TextButton elevatedButton(
      String text, double width, BuildContext context, String route) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: ColorConstants.buttonBackgroundColor,
          foregroundColor: ColorConstants.buttonTextColor,
          padding: EdgeInsets.symmetric(horizontal: width, vertical: 23.5),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.027,
              color: ColorConstants.buttonTextColor,
              fontWeight: FontWeight.bold),
        ));
  }

  static Text subheading(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey, fontSize: 18),
    );
  }

  static SizedBox addverticalHeight(double height) {
    return SizedBox(height: height);
  }
}

import 'package:flutter/material.dart';
import 'package:liveasy_assignment/Screens/page2.dart';
import 'package:liveasy_assignment/widgets/widgets.dart';

class Page1 extends StatelessWidget {
  static const String route = "Page1Route";
  Page1({super.key});

  final String heading = "Please select your language";
  final String subheading =
      "You can change the language\n                at any time.";

  double deviceWidth = 0;
  double deviceHeight = 0;

  void setUIDimensions(double width, double height) {
    deviceHeight = height;
    deviceWidth = width;
  }

  bool dimensionSet = false;

  @override
  Widget build(BuildContext context) {
    if (!dimensionSet) {
      setUIDimensions(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height);
      dimensionSet = true;
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
                image: AssetImage("assets/images/waves1.jpg"))),
        child: Center(

            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Image.asset(
                "assets/images/imageIcon.png",
                height: deviceHeight * 0.13,
                width: deviceWidth * 0.28,
              ),
              const SizedBox(height: 20),
              CommonWidgets.heading(heading),
              const SizedBox(height: 8),
              CommonWidgets.subheading(subheading),
              const SizedBox(height: 23),
              const DropDownWidget(),
              const SizedBox(height: 23),
              CommonWidgets.elevatedButton("NEXT", 100, context, Page2.route),
              const SizedBox(height: 160),
            ])),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

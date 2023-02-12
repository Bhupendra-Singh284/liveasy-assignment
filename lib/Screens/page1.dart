import 'package:flutter/material.dart';
import 'package:liveasy_assignment/Screens/page2.dart';
import 'package:liveasy_assignment/widgets/widgets.dart';

class Page1 extends StatelessWidget {
  static const String route = "Page1Route";
  const Page1({super.key});

  final String heading = "Please select your language";
  final String subheading = "You can change the language\nat any time.";

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

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
              CommonWidgets.heading(heading, context),
              const SizedBox(height: 8),
              CommonWidgets.subheading(subheading, context),
              const SizedBox(height: 23),
              DropDownWidget(
                context: context,
              ),
              const SizedBox(height: 23),
              SizedBox(
                  width: deviceWidth * 0.64,
                  child: CommonWidgets.elevatedButton(
                      "NEXT", context, Page2.route)),
              const SizedBox(height: 160),
            ])),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

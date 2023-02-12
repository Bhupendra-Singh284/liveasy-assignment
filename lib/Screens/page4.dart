import 'package:flutter/material.dart';
import 'package:liveasy_assignment/widgets/UI_common_widgets.dart';
import 'package:liveasy_assignment/Screens/page5.dart';

class Page4 extends StatefulWidget {
  static const route = "Page4Route";
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final String demoText = "Lorem ipsum dolor sit amet,\nconsectetur adipiscing";
  int? _value = 1;
  final String title = "Please select Your Profile";
  final String buttonText = "Continue";
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final fontSize = deviceHeight * 0.044;
    return WillPopScope(
        //forbidden swipe in iOS(my ThemeData(platform: TargetPlatform.iOS,)
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonWidgets.heading(title, context),
                    const SizedBox(
                      height: 35,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _value = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 25, 0, 25),
                              child: Transform.scale(
                                  scale: 1.4,
                                  child: Radio(
                                      value: 1,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      })),
                            ),
                            Image.asset(
                              "assets/images/shipper.jpg",
                              height: MediaQuery.of(context).size.height * 0.09,
                              width: MediaQuery.of(context).size.width * 0.19,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shipper",
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CommonWidgets.subheading(demoText, context)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _value = 2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 25, 0, 25),
                              child: Transform.scale(
                                  scale: 1.4,
                                  child: Radio(
                                      value: 2,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      })),
                            ),
                            Image.asset(
                              "assets/images/transporter.png",
                              height: MediaQuery.of(context).size.height * 0.09,
                              width: MediaQuery.of(context).size.width * 0.19,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 25, 10, 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Transporter",
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CommonWidgets.subheading(demoText, context)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CommonWidgets.elevatedButton(
                        buttonText, context, Page5.route),
                    const SizedBox(
                      height: 120,
                    )
                  ]),
            ),
          ),
        ));
  }
}

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
                    CommonWidgets.heading(title),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Shipper",
                                  style: TextStyle(fontSize: 35),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  demoText,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
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
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Transporter",
                                  style: TextStyle(fontSize: 35),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  demoText,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CommonWidgets.elevatedButton(
                        buttonText, 140, context, Page5.route),
                    const SizedBox(
                      height: 140,
                    )
                  ]),
            ),
          ),
        ));
  }
}

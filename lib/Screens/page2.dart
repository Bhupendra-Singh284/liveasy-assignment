import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liveasy_assignment/Authentication/verifyNumber.dart';
import 'package:liveasy_assignment/Screens/page3.dart';
import 'package:liveasy_assignment/constants/color_constants.dart';
import 'package:liveasy_assignment/Authentication/userDetails.dart';
import 'package:liveasy_assignment/widgets/UI_common_widgets.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});
  static const String route = "Page2Route";

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final TextEditingController numberController = TextEditingController();
  final String heading = "Please enter your mobile number";
  final String subheading =
      "You'll receive a 6 digit code\n            to verify next";
  final buttonText = "Continue";

  double deviceWidth = 0;
  double deviceHeight = 0;

  void setUIDimensions(double width, double height) {
    deviceHeight = height;
    deviceWidth = width;
  }

  bool dimensionSet = false;

  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userNum = Provider.of<UserDetails>(context, listen: false);
    final verify = Provider.of<VerifyNumber>(context, listen: false);
    if (!dimensionSet) {
      setUIDimensions(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height);
      dimensionSet = true;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.cancel_presentation_outlined,
            size: 45,
          ),
          onPressed: () {
            Navigator.pop(context);
            // FocusScope.of(context).unfocus();
          },
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
                image: AssetImage("assets/images/waves1.jpg"))),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonWidgets.heading(heading),
                const SizedBox(
                  height: 11,
                ),
                CommonWidgets.subheading(subheading),
                const SizedBox(
                  height: 35,
                ),
                Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: [
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter phone number";
                          } else if (value.length < 8) {
                            return "Enter phone number with 10 digits";
                          }
                          return null;
                        },
                        autofocus: true,
                        controller: numberController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black),
                        decoration: InputDecoration(
                            counterText: "",
                            hintText: "Mobile Number",
                            hintStyle: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 140, 132, 132),
                            ),
                            prefixIcon:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              IconButton(
                                onPressed: null,
                                icon: Image.asset(
                                  'icons/flags/png/in.png',
                                  package: 'country_icons',
                                  width: deviceWidth * 0.08,
                                  height: deviceHeight * 0.08,
                                ),
                              ),
                              const Text(
                                " +91    -    ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 40, 39, 39),
                                    fontSize: 25),
                              )
                            ]),
                            errorStyle: const TextStyle(fontSize: 16),
                            errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(
                                    width: 2,
                                    color: ColorConstants.borderColor)),
                            focusedErrorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(
                                    width: 2,
                                    color: ColorConstants.borderColor)),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(
                                    width: 2,
                                    color: ColorConstants.borderColor)),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(
                                    width: 2,
                                    color: ColorConstants.borderColor))),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextButton(
                          onPressed: () async {
                            if (_key.currentState!.validate()) {
                              verify.authenticate(
                                  numberController.text.toString(), context);
                              userNum.setPhoneNumber(
                                  numberController.text.toString());
                              final focus = FocusScope.of(context);
                              focus.unfocus();
                              Navigator.pushNamed(context, Page3.route);
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                ColorConstants.buttonBackgroundColor,
                            foregroundColor: ColorConstants.buttonTextColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 135, vertical: 20),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0))),
                          ),
                          child: Text(
                            buttonText,
                            style: const TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ))
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 285,
                )
              ]),
        ),
      ),
    );
  }
}

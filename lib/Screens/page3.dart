import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liveasy_assignment/Screens/page4.dart';
import 'package:liveasy_assignment/Authentication/userDetails.dart';
import 'package:liveasy_assignment/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:liveasy_assignment/Authentication/verifyNumber.dart';

import '../constants/color_constants.dart';

class Page3 extends StatelessWidget {
  static const String route = "Page3Route";
  Page3({super.key});

  final String title = "Verify Phone";
  final String subtitle = "Code is sent to ";
  final String contentText = "Did't receive the code?";
  final String reqAgainText = "Request again";
  final String buttonText = "VERIFY AND CONTINUE";

  final _key = GlobalKey<FormState>();

  String _value = "";

  static void pushPage4(BuildContext context) {
    Navigator.pushNamed(context, Page4.route);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final p = Provider.of<UserDetails>(context, listen: false);
    final verify = Provider.of<VerifyNumber>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
              Text(
                title,
                style: TextStyle(
                    fontSize: deviceHeight * 0.04, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 9,
              ),
              CommonWidgets.subheading(subtitle + p.showNumber(), context),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OtpTextField(
                          onSubmit: (value) {
                            _value = value;
                          },
                          margin: const EdgeInsets.only(right: 8),
                          focusedBorderColor: Colors.white,
                          borderColor: Colors.white,
                          showFieldAsBox: true,
                          borderRadius: BorderRadius.zero,
                          enabledBorderColor: Colors.white,
                          borderWidth: 0,
                          autoFocus: true,
                          cursorColor: const Color.fromARGB(255, 32, 31, 31),
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: deviceHeight * 0.03),
                          numberOfFields: 6,
                          fieldWidth: deviceWidth * 0.13,
                          filled: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          fillColor: const Color.fromARGB(255, 172, 215, 252),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonWidgets.subheading(
                                  "Did't receive the code?", context),
                              TextButton(
                                  onPressed: () {
                                    verify.resendOtp(p.showNumber(), context);
                                  },
                                  child: Text(
                                    reqAgainText,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ))
                            ]),
                        const SizedBox(
                          height: 12,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  ColorConstants.buttonBackgroundColor,
                              foregroundColor: ColorConstants.buttonTextColor,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0))),
                            ),
                            onPressed: () async {
                              if (_value.length < 6) {
                                Fluttertoast.showToast(
                                    msg: "Enter a 6 digit code",
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                    fontSize: 22);
                              } else {
                                final navigator = Navigator.of(context);
                                final focus = FocusScope.of(context);
                                final verified =
                                    await verify.verify(_value, context);
                                if (verified) {
                                  focus.unfocus();
                                  navigator.pushNamed(Page4.route);
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(buttonText,
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.024,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                        const SizedBox(
                          height: 250,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

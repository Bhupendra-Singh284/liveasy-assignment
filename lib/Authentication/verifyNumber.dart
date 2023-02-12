import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liveasy_assignment/Screens/page4.dart';

class VerifyNumber with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _id = "";
  int? _token;
  bool _resendOtpOpen = false;

  FirebaseAuth getAuthInstance() {
    return _auth;
  }

  Future<bool> verify(String smsCode, BuildContext context) async {
    final focus = FocusScope.of(context);
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: _id, smsCode: smsCode);
      await _auth.signInWithCredential(credential);

      focus.unfocus();
      return true;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          gravity: ToastGravity.SNACKBAR,
          msg: e.code.toString(),
          textColor: Colors.black,
          backgroundColor: Colors.white,
          fontSize: 22);
      return false;
    } catch (e) {
      return false;
    }
  }

  void authenticate(String num, BuildContext context) async {
    await _auth.verifyPhoneNumber(
      forceResendingToken: _token,
      phoneNumber: "+91$num",
      verificationCompleted: (PhoneAuthCredential credential) async {
        final navigator = Navigator.of(context);
        final focus = FocusScope.of(context);
        await _auth.signInWithCredential(credential);
        focus.unfocus();
        navigator.pushNamed(Page4.route);
      },
      verificationFailed: (FirebaseAuthException e) {
        final navigator = Navigator.of(context);
        final focus = FocusScope.of(context);
        focus.unfocus();
        navigator.pop();
        Fluttertoast.showToast(
            gravity: ToastGravity.SNACKBAR,
            msg: e.code.toString() == "too-many-requests"
                ? "${e.code}, Try again later"
                : e.code.toString(),
            textColor: Colors.black,
            backgroundColor: Colors.white,
            fontSize: 22);
      },
      codeSent: (String verificationId, int? resendToken) {
        _id = verificationId;
        _token = resendToken;
      },
      timeout: const Duration(seconds: 40),
      codeAutoRetrievalTimeout: (String verificationId) {
        _resendOtpOpen = true;
        _id = verificationId;
      },
    );
  }

  void resendOtp(String num, BuildContext context) {
    if (!_resendOtpOpen) {
      Fluttertoast.showToast(
          msg: "Wait for 40 second before receiving another otp",
          textColor: Colors.black,
          backgroundColor: Colors.white,
          fontSize: 22);
    } else {
      authenticate(num, context);
    }
  }
}

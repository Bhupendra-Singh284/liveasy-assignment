import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  static const route = "Page5Route";
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Thank you :)",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

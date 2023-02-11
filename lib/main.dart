import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:liveasy_assignment/Authentication/verifyNumber.dart';
import 'package:liveasy_assignment/routes/routes.dart';
import 'package:liveasy_assignment/Authentication/userDetails.dart';
import 'package:provider/provider.dart';

import 'Screens/page1.dart';

void main() async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => VerifyNumber(),
    ),
    ChangeNotifierProvider(create: (context) => UserDetails())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Page1.route,
      routes: getRoutes(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

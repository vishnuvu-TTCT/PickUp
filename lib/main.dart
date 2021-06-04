import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding_screen_driver/screens/onBoard2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.black,
      ),
      home: OnboardPage(),
    );
  }
}

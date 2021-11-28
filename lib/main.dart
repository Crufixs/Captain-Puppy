import 'package:fap/pages/Home%20Page.dart';
import 'package:fap/pages/Notes%20Page.dart';
import 'package:fap/pages/Profile%20Page.dart';
import 'package:fap/pages/welcome%20pages/Welcome%20page%201.dart';
import 'package:fap/services/breed_brain.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return WelcomePage();
  }
}

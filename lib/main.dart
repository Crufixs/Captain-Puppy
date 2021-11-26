import 'package:fap/pages/Home%20Page.dart';
import 'package:flutter/material.dart';

import 'model/Pet.dart';
import 'model/User.dart';

void main() {
  final Pet pet = Pet(
    petImage: 'https://i.imgur.com/13wGXx5.jpg',
    petName: 'Koa',
    breed: 'Pomeranian',
    gender: 'Male',
    age: 1,
    weight: 3.8,
    about: '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor '
        'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud '
        'exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."',
  );

  User.userName = 'someone';
  User.pet = pet;

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
    return HomePage();
  }
}

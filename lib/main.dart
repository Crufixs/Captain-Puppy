import 'dart:convert';
import 'package:fap/model/Note.dart';
import 'package:fap/pages/Edit%20Note%20Page.dart';
import 'package:fap/pages/Home%20Page.dart';
import 'package:fap/pages/Notes%20Page.dart';
import 'package:fap/pages/welcome%20pages/Welcome%20page%201.dart';
import 'package:fap/providers/theme_provide.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/Pet.dart';
import 'model/User.dart';
import 'package:provider/provider.dart';
import 'package:fap/providers/theme_provide.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadData();
  runApp(MyHome());
}

dynamic loadData() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? json = prefs.getString('userData');

  if (json == null) {
    print('NO JSON FOUND - WILL CREATE A NEW ONE');
    saveData();

    return User.userName;
  }

  print('YEHEY JSON FOUND');
  Map<String, dynamic> decodedJson = jsonDecode(json);
  User.fromJson(decodedJson);
  print('ANG USERNAME KO AY: ' + User.userName.toString());
  print('EXAMPLE NOTE: ' + User.notes[4].title);
  User.isDarkMode = false;
  return User.userName;
}

void saveData() async {

  final Pet pet = Pet(
    petImage: 'https://i.imgur.com/13wGXx5.jpg',
    petName: 'Koa',
    breed: 'Pomeranian',
    gender: 'Male',
    age: 1,
    weight: 3.8,
    about:
        '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor '
        'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud '
        'exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."',
  );

  User.userName = 'someone';
  User.pet = pet;
  User.notes = [
    new Note("Title1", "Content1", "November 28, 2021"),
    new Note("Title2", "Content2", "November 28, 2021"),
    new Note("Title3", "Content3", "November 28, 2021"),
    new Note("Title4", "Content4", "November 28, 2021"),
    new Note("Title5", "Content5", "November 28, 2021"),
    new Note("Title6", "Content6", "November 28, 2021"),
    new Note("Title7", "Content7", "November 28, 2021"),
    new Note("Title8", "Content8", "November 28, 2021"),
    new Note("Title9", "Content9", "November 28, 2021"),
    new Note("Title10", "Content10", "November 28, 2021"),
  ];

  print('ANG USERNAME KO AY: ' + User.userName.toString());

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String json = jsonEncode(User.toJson());
  prefs.setString('userData', json);
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
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider =
              Provider.of<ThemeProvider>(context, listen: true);
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: HomePage(),
          );
        },
      );
}

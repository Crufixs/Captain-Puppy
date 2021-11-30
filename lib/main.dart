import 'dart:convert';
import 'package:fap/model/Note.dart';
import 'package:fap/pages/Edit%20Note%20Page.dart';
import 'package:fap/pages/Home%20Page.dart';
import 'package:fap/pages/Notes%20Page.dart';
import 'package:fap/pages/Welcome%20page%201.dart';
import 'package:fap/providers/theme_provide.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/Pet.dart';
import 'model/User.dart';
import 'package:provider/provider.dart';
import 'package:fap/providers/theme_provide.dart';

bool isNewUser = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadData();
  runApp(MyHome());
}

loadData () async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  String? json =  prefs.getString('userData');

  if(json == null){
    print('NO JSON FOUND - WILL CREATE A NEW ONE');
    saveData();
    isNewUser = true;

    return;
  }

  isNewUser = false;

  print('YEHEY JSON FOUND');
  Map<String, dynamic> decodedJson = jsonDecode(json);
  User.fromJson(decodedJson);
  print('ANG USERNAME KO AY: ' + User.userName.toString());
  print('EXAMPLE NOTE: ' + User.notes[4].title);

  return User.userName;
}

void saveData() async{
  final Pet pet = Pet(
    petImage: 'images/profileIcon.png',
    petName: '',
    breed: '',
    gender: 'Male',
    age: 1,
    weight: 3.5,
    about: '',
  );

  User.userName = '';
  User.pet = pet;
  // User.notes = [
  //   new Note("Title1", "Content1", "November 28, 2021"),
  //   new Note("Title2", "Content2", "November 28, 2021"),
  //   new Note("Title3", "Content3", "November 28, 2021"),
  //   new Note("Title4", "Content4", "November 28, 2021"),
  //   new Note("Title5", "Content5", "November 28, 2021"),
  //   new Note("Title6", "Content6", "November 28, 2021"),
  //   new Note("Title7", "Content7", "November 28, 2021"),
  //   new Note("Title8", "Content8", "November 28, 2021"),
  //   new Note("Title9", "Content9", "November 28, 2021"),
  //   new Note("Title10", "Content10", "November 28, 2021"),
  // ];

  print('ANG USERNAME KO AY: ' + User.userName.toString());

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String json = jsonEncode(User.toJson());
  // prefs.setString('userData', json);
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


class _MyAppState extends State<MyApp>{
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context,_){
      print(isNewUser);
      final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
      return MaterialApp(
        // routes: {
        //   '/Home': (context) => HomePage(),
        //   '/Welcome' : (context) => WelcomePage(),
        // },
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: (isNewUser) ? WelcomePage() : HomePage(),
      );
    },
  );
}

// class Startup extends StatelessWidget {
//   // const Startup({
//   //   Key? key,
//   // }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if(isNewUser){
//
//     }
//     return Scaffold(
//
//     );
//   }
// }



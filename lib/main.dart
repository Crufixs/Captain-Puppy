import 'dart:convert';
import 'dart:io';
import 'package:fap/model/Note.dart';
import 'package:fap/pages/Edit%20Note%20Page.dart';
import 'package:fap/pages/Home%20Page.dart';
import 'package:fap/pages/Notes%20Page.dart';
import 'package:fap/pages/Welcome%20page%201.dart';
import 'package:fap/providers/theme_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/Pet.dart';
import 'model/User.dart';
import 'package:provider/provider.dart';
import 'package:fap/providers/theme_provide.dart';

bool isNew = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadData();
  runApp(MyHome());
}

loadData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.clear();
  String? json = prefs.getString('userData');

  if (json == null) {
    print('NO JSON FOUND - WILL CREATE A NEW ONE');
    isNew = true;
    saveData();

    return;
  }

  isNew = false;
  print('YEHEY JSON FOUND');
  Map<String, dynamic> decodedJson = jsonDecode(json);
  User.fromJson(decodedJson);
  // print('ANG USERNAME KO AY: ' + User.userName.toString());
  // print('EXAMPLE NOTE: ' + User.notes[4].title);

  return;
}

void saveData() async {

  //copying file to user's phone
  final profilePicFileName = 'profilePic.png';
  final byteData = await rootBundle.load('images/profilePic.png');
  String dir = (await getApplicationDocumentsDirectory()).path;
  final buffer = byteData.buffer;
  await File('$dir/$profilePicFileName').writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));


  final Pet pet = Pet(
    // petImage: '${(await getTemporaryDirectory()).path}/profilePic.png',
    petImage: '$dir/$profilePicFileName',
    petName: '',
    breed: '',
    gender: 'Male',
    age: 1,
    weight: 3.8,
    about: '',
  );

  User.userName = '';
  User.pet = pet;
  // User.notes = [];

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
            home: (!isNew) ? HomePage() : WelcomePage(),
          );
        },
      );
}

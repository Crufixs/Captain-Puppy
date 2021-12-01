import 'dart:convert';
import 'package:fap/model/User.dart';
import 'package:fap/pages/Edit%20Note%20Page.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  void showNoteAlert() {}
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Notes and Trash Can
              Container(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Notes', style: TextTitle),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditNotePage(
                                index: -1,
                              ),
                            ),
                          ).then((value) => setState(() {}));
                        },
                        child: Icon(
                          Icons.add,
                          color: Color(0xffF2F2F2),
                          size: 30,
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              constants.secondColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Notes Area
              Container(
                height: screenHeight * 0.7,
                width: 350,
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: SingleChildScrollView(
                  child: NotesColumn(),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: fourthColor, width: 5),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Add Notes Button
            ],
          ),
        ),
      ),
    );
  }
}

class NotesColumn extends StatefulWidget {
  const NotesColumn({Key? key}) : super(key: key);

  @override
  _NotesColumnState createState() => _NotesColumnState();
}

class _NotesColumnState extends State<NotesColumn> {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    for (int i = 0; i < User.notes.length; i++) {
      String displayTitle = User.notes[i].title;
      if (displayTitle == "") displayTitle = "Untitled";
      children.add(
        Container(
          // height: 30,
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => NoteAlert(index: i),
                  ).then((value) => setState(() {})),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                displayTitle,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: User.isDarkMode!
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                User.notes[i].date,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: User.isDarkMode!
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(constants.thirdColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: children,
    );
  }
}

class NoteAlert extends StatefulWidget {
  NoteAlert({required this.index});

  final int index;

  @override
  _NoteAlertState createState() => _NoteAlertState();
}

class _NoteAlertState extends State<NoteAlert> {
  @override
  void initState() {
    index = widget.index;
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    String displayTitle = User.notes[index].title;
    if (displayTitle == "") displayTitle = "Untitled";

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10),
      content: Container(
        height: screenHeight * 0.8,
        width: screenWidth * 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                displayTitle,
                style: constants.TextContentHeading1,
              ),
              Text(
                User.notes[index].date,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: User.isDarkMode! ? Colors.white : Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Text('Edit'),
                      onTap: () {
                        //pop
                        //then push from notes page
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return EditNotePage(index: index);
                          },
                        ).then((value) => setState(() {}));
                      },
                    ),
                    GestureDetector(
                      child: Text('Delete'),
                      onTap: () async {
                        User.notes.removeAt(index);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String json = jsonEncode(User.toJson());
                        prefs.setString('userData', json);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      User.notes[index].content,
                      style: constants.TextContentNormal,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

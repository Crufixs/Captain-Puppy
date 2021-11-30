import 'dart:convert';

import 'package:fap/model/User.dart';
import 'package:fap/pages/Edit%20Note%20Page.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notes',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

              //Notes Area
              Container(
                height: screenHeight * 0.7,
                width: 350,
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: SingleChildScrollView(
                  child: NotesColumn(),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff7D79F2), width: 8),
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
      children.add(
        NotesCard(
          index: i,
        ),
      );
    }

    return Column(
      children: children,
    );
  }
}


class NotesCard extends StatefulWidget {
  NotesCard({
    required this.index,
  });

  final int index;

  @override
  _NotesCardState createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  int index = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    String displayTitle = User.notes[index].title;
    if (displayTitle == "") displayTitle = "Untitled";

    return Container(
      // height: 30,
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => NoteAlert(index: index),
              ).then((value) => setState(() {})),
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
                            color:
                                User.isDarkMode! ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          User.notes[index].date,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color:
                                User.isDarkMode! ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor:
                MaterialStateProperty.all<Color>(constants.secondColor),
              ),
            ),
          ),
        ],
      ),
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
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Text('Edit'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditNotePage(
                              index: index,
                            ),
                          ),
                        ).then((value) => setState(() {}));
                      },
                    ),
                    GestureDetector(
                      child: Text('Delete'),
                      onTap: () async{
                        print(User.notes.length);
                        User.notes.removeAt(index);
                        print(User.notes.length);

                        SharedPreferences prefs = await SharedPreferences.getInstance();
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

// class NoteAlert extends StatelessWidget {
//
// }

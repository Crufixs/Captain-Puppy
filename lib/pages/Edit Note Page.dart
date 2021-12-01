import 'dart:convert';
import 'package:date_format/date_format.dart';
import 'package:fap/model/Note.dart';
import 'package:fap/model/User.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditNotePage extends StatefulWidget {
  EditNotePage({required this.index});

  final int index;

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  @override
  void initState() {
    super.initState();
    index = widget.index;
    if (index == -1)
      heading = "Add Note";
    else {
      heading = "Edit Note";
      initialTitle = User.notes[index].title;
      initialContent = User.notes[index].content;
    }

    titleController = TextEditingController(text: initialTitle);
    contentController = TextEditingController(text: initialContent);
  }

  final _formKey = GlobalKey<FormState>();
  String heading = "";
  String initialContent = "";
  String initialTitle = "";

  int index = -1;

  var titleController = TextEditingController();
  var contentController = TextEditingController();

  validateNote() async {
    final now = new DateTime.now();
    String formattedDate = formatDate(now, [MM, " ", d, ",", yyyy]);

    String title = titleController.text;
    String content = contentController.text;

    if (title == "" && content == "") return;

    if (index == -1) {
      //New Note
      Note note = Note(title, content, formattedDate);
      User.notes.add(note);
    } else {
      //Update Note
      User.notes[index].title = title;
      User.notes[index].content = content;
      User.notes[index].date = formattedDate;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(User.toJson());
    prefs.setString('userData', json);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            //backgroundColor: constants.fifthColor,
            elevation: 0,
            title: Center(
              child: Text(
                heading,
                //style: constants.TextContentHeading1,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.clear,
                color: Colors.black,
                size: 25,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await validateNote();
                      Navigator.pop(context);
                    }
                  },
                  child: Icon(
                    Icons.check,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              )
            ],
          ),
          body: Container(
            //color: constants.fifthColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Title',
                      // hintStyle: constants.TextContentHeading2
                    ),
                    validator: (String? value) {
                      if (value != null && value.length > 30) {
                        return 'Title is too long.';
                      }
                      return null;
                    },
                    //style: constants.TextContentHeading2,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: contentController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add Notes',
                        //hintStyle: constants.TextContent
                      ),
                      //style: constants.TextContent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

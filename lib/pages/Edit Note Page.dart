import 'package:fap/utilities/constants.dart' as constants;
import 'package:flutter/material.dart';

class EditNotePage extends StatefulWidget {
  EditNotePage({required this.isNew});

  final bool isNew;

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isNew)
      heading = "Add Note";
    else {
      heading = "Edit Note";
    }
  }

  String heading = "";
  String content = "";
  String title = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: constants.fifthColor,
          elevation: 0,
          title: Center(
            child: Text(
              heading,
              style: constants.TextContentHeading1,
            ),
          ),
          leading: GestureDetector(
            onTap: (){
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
                onTap: (){

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
          color: constants.fifthColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Title',
                    hintStyle: constants.TextContentHeading2
                  ),
                  style: constants.TextContentHeading2,
                ),

                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add Notes',
                        hintStyle: constants.TextContent
                    ),
                    style: constants.TextContent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:fap/model/User.dart';
import 'package:fap/pages/Edit%20Note%20Page.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class NotesPage extends StatelessWidget {
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
                            builder: (context) => EditNotePage(isNew: true),
                          ),
                        );
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
              Container(
                // width: screenWidth * .9,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipOval(
                        // child: ElevatedButton(
                        //     onPressed: (){},
                        //     child: Icon(
                        //       Icons.add,
                        //       color: Color(0xffF2F2F2),
                        //       size: 30,
                        //     ),
                        //   style: ButtonStyle(
                        //     shape:
                        //     MaterialStateProperty.all<RoundedRectangleBorder>(
                        //       RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(50.0),
                        //       ),
                        //     ),
                        //     backgroundColor: MaterialStateProperty.all<Color>(
                        //         constants.secondColor),
                        //   ),
                        // ),
                        )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotesColumn extends StatelessWidget {
  // const NotesColumn({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    // for(int i=0; i<User.notes.length; i++){
    //   children.add(
    //
    //   );
    // }

    return Column(
      children: [
        NotesCard(),
        NotesCard(),
        NotesCard(),
        NotesCard(),
        NotesCard(),
        NotesCard(),
        NotesCard(),
        NotesCard(),
        NotesCard(),
        NotesCard(),
      ],
    );
  }
}

class NotesCard extends StatelessWidget {
  const NotesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    String formattedDate = formatDate(now, [MM, " ", d, ",", yyyy]);

    return Container(
      // height: 30,
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'NOTES KUNYARE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
                          formattedDate,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
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

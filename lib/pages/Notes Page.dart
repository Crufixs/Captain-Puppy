import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Expanded(
            child: Row(),
          ),

          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Notes'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.cake,
                        color: Color(0xff7d79f2),
                        size: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          
          Expanded(
            child: DecoratedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {  }, child: null,

                          style: ButtonStyle(
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                constants.thirdColor),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {  }, child: null,
                          style: ButtonStyle(
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                constants.thirdColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {  }, child: null,
                          style: ButtonStyle(
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                constants.thirdColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {  }, child: null,
                          style: ButtonStyle(
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                constants.thirdColor),

                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {  }, child: null,
                          style: ButtonStyle(
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                constants.thirdColor),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
              ),
            ),
          ),


          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.add,
                  color: Color(0xffdc1a1a),
                  size: 80,
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

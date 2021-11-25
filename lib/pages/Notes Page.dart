import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Notes',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 175,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){},
                      child: Image.asset(
                        "images/trashCan.png",
                        width: 50,
                        height: 50,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
         margin: EdgeInsets.only(left: 30,right:30),
            child: DecoratedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 300,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: null,
                            style: ButtonStyle(
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  constants.secondColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 300,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: null,
                            style: ButtonStyle(
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  constants.secondColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 300,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: null,
                            style: ButtonStyle(
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  constants.secondColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 300,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: null,
                            style: ButtonStyle(
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  constants.secondColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 300,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: null,
                            style: ButtonStyle(
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  constants.secondColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff7D79F2), width: 8),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 ClipOval(
                   child: ElevatedButton(
                       onPressed: (){},
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
                 )
              ],
            ),
          ),
        ),
      ],
    );
  }

}

import 'package:fap/main.dart';
import 'package:fap/model/User.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:flutter/material.dart';

import 'BabyPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //EXPANDED 1
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: screenWidth * 0.9,
              // height: 120,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hi, ' + User.userName + "!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            'Your dog misses you today',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'images/FluffyPuppy.png',
                            height: 120,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //EXPANDED 2
            Container(
              width: screenWidth * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.pets,
                        color: Color(0xff7d79f2),
                        size: 50,
                      ),
                      Text(
                        'Pomeranian',
                        style: TextStyle(
                          color: Color(0xff7d79f2),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'images/gender.png',
                        width: 50,
                        height: 50,
                      ),
                      Text('Male',
                          style: TextStyle(
                            color: Color(0xff7D79F2),
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.cake,
                        color: Color(0xff7d79f2),
                        size: 50,
                      ),
                      Text(
                        '1 y/o',
                        style: TextStyle(
                          color: Color(0xff7d79f2),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "images/weight.png",
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        '3.5 kg',
                        style: TextStyle(
                          color: Color(0xff7d79f2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // EXPANDED 3
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.47,
                      child: ElevatedButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/profileIcon.png",
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: Color(0xffF2F2F2),
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              constants.fourthColor),
                        ),
                        onPressed: () {
                          changePage(context, 2);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.47,
                      child: ElevatedButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/noteIcon.png",
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Notes',
                              style: TextStyle(
                                color: Color(0xffF2F2F2),
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              constants.secondColor),
                        ),
                        onPressed: () {
                          changePage(context, 4);
                        },
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
                    Container(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.47,
                      child: ElevatedButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.pets,
                              color: Color(0xffF2F2F2),
                              size: 80,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Breeds',
                              style: TextStyle(
                                color: Color(0xffF2F2F2),
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              constants.firstColor),
                        ),
                        onPressed: () {
                          changePage(context, 3);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.47,
                      child: ElevatedButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/expensesIcon.png",
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Expenses',
                              style: TextStyle(
                                color: Color(0xffF2F2F2),
                              ),
                            ),
                          ],
                        ),
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
                        onPressed: () {
                          changePage(context, 1);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),

            //EXPANDED 4
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/qmarkFinal.png",
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                Text(
                                  'Help',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),

                              ],
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void changePage(BuildContext context, int pageNo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BabyPage(selectedPage: pageNo),
      ),
    );
  }
}

import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      //EXPANDED 1
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi, Taylor!',
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
                        height: 120.0,
                        width: 120.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        //EXPANDED 2
        Expanded(
          flex: 1,
          child: Container(
            width: 350,
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
                    Text(
                      'Male',
                      style: TextStyle(
                        color: Color(0xff7D79F2),
                      )
                    )

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
        ),
        // EXPANDED 3
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 200,
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
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 150,
                    height: 200,
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
                      onPressed: () {},
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
                    width: 150,
                    height: 200,
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
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 150,
                    height: 200,
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //EXPANDED 4
        Expanded(
            flex: 1,
            child: Row(
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
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}

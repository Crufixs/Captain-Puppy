import 'package:fap/components/Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../Edit Profile.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List messages = [
    "Lorem Ipsum is simply dummy text of the printing "
        "and typesetting industry. Lorem Ipsum has been the industry's ",
    "standard dummy text ever since the 1500s, when an unknown printer "
        "took a galley of type and scrambled it to make a type specimen book.",
    "and typesetting industry. Lorem Ipsum has been the industry's "
        "standard dummy text ever since the 1500s, when an unknown printer ",
    " "
  ];
  int _currentIndex = 0;

  generateTextOrButton(int index){
    if(index != 3){
      return Flexible(
        child: Text(messages[index]),
      );
    } else {
      return Button(
        onClicked: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditProfile()),
          );
        },
        hPadding: 10,
        vPadding: 10,
        text: 'Let\'s Get Started!',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment:MainAxisAlignment.center,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    // reverse: false,
                    enableInfiniteScroll: false,
                    height: MediaQuery.of(context).size.height,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
                items: [0, 1, 2, 3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Image.asset("images/page$i.png"),
                          ),
                          generateTextOrButton(i),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: messages.map((urlOfItem) {
                                int index = messages.indexOf(urlOfItem);
                                return Container(
                                  width: 10.0,
                                  height: 10.0,
                                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentIndex == index
                                        ? Color.fromRGBO(0, 0, 0, 0.8)
                                        : Color.fromRGBO(0, 0, 0, 0.3),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


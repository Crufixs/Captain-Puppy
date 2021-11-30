import 'package:fap/components/Button.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Edit Profile.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({required this.fromHelp});
  final bool fromHelp;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

//ROAR
class _WelcomePageState extends State<WelcomePage> {
  List messages = [
    "I miss screaming and fighting and kissing in the rain "
        "It's 2:00 a.m. and I'm cursing your name "
        "So in love that I acted insane "
        "And that's the way I loved you "
        "Breaking down and coming undone "
        "It's a roller coaster kinda rush ",
    "I diss screaming and fighting and kissing in the rain "
        "It's 2:00 a.m. and I'm cursing your name "
        "So in love that I acted insane "
        "And that's the way I loved you "
        "Breaking down and coming undone "
        "It's a roller coaster kinda rush ",
    "I riss screaming and fighting and kissing in the rain "
        "It's 2:00 a.m. and I'm cursing your name "
        "So in love that I acted insane "
        "And that's the way I loved you "
        "Breaking down and coming undone "
        "It's a roller coaster kinda rush ",
    "dummy"
  ];

  int _currentIndex = 0;

  generateTextOrButton(int index) {
    if (index != 3) {
      return Flexible(
        child: Container(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(messages[index]),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Button(
          color: constants.firstColor,
          onClicked: () {
            if (fromHelp) {
              Navigator.pop(context);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProfile(isNew: true)),
              );
            }
          },
          hPadding: 30,
          vPadding: 30,
          text: 'Let\'s Get Started!',
        ),
      );
    }
  }

  bool fromHelp = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fromHelp = widget.fromHelp;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                                // color: Colors.white,
                                ),
                            child: Container(
                                height: 450,
                                width: 450,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 80),
                                  child: Image.asset("images/page$i.png"),
                                )),
                          ),
                          generateTextOrButton(i),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: messages.map((text) {
                                int index = messages.indexOf(text);
                                return Container(
                                  width: 10.0,
                                  height: 10.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
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

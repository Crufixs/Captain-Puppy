import 'package:fap/components/Button.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:fap/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:audioplayers/audioplayers.dart';

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
    "Manage expenses for your dog's needs such as food, utilities, and health care.",
    "Get to know more about various dog breeds and their characteristics.",
    "Keep track of your activities with your personal journal dedicated for your pet.",
    "dummy"
  ];

  List titles = [
    "Track Your Expenses",
    "Learn About Breeds",
    "Take Down Notes",
    "Ready to get started with your " + "\npet management app?",
  ];

  int _currentIndex = 0;

  generateTextOrButton(int index) {
    if (index != 3) {
      return Flexible(
        child: Column(
          children: [
            const SizedBox (height: 5),
            Text(
              titles[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )
            ),
            Container(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                    messages[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Button(
              color: constants.firstColor,
              onClicked: () {
                final player = AudioCache();
                player.play('assets/audio/dogBark.mp3');
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
              hPadding: 20,
              vPadding: 20,
              text: 'Let\'s Get Started!',
            ),
          ],
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
                                height: 400,
                                width: 400,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 80, bottom: 20),
                                  child: Image.asset("assets/images/wpage$i.png"),
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
                                        ? firstColor
                                        : Colors.grey,
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

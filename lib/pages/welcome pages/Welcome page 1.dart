import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomePage1 extends StatelessWidget {
  List messages = [
    "",
    "Lorem Ipsum is simply dummy text of the printing "
    "and typesetting industry. Lorem Ipsum has been the industry's ",
    "standard dummy text ever since the 1500s, when an unknown printer "
        "took a galley of type and scrambled it to make a type specimen book.",
    "and typesetting industry. Lorem Ipsum has been the industry's "
        "standard dummy text ever since the 1500s, when an unknown printer "
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: MediaQuery.of(context).size.height),
            items: [1,2,3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                          ),
                          child: Image.asset("images/page$i.png"),
                      ),
                      Flexible(
                          child: Text(messages[i]),

                      )
                    ],
                  );
                },
              );
            }).toList(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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

      ),

    );
  }
}
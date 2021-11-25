import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                    "images/page1.png",
                  width: 300,
                  height: 300,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text("Lorem Ipsum is simply dummy text of the printing and "
                    "typesetting industry. Lorem Ipsum has been the industry's "
                    "standard dummy text ever since the 1500s, when an unknown"
                    " printer took a galley of type and scrambled it to make a "
                    "type specimen book. It has survived not only five centuries, "
                    "but also the leap into electronic typesetting, remaining essentially unchanged."
                ),
              ),
            ],
          ),
          Row(
            children: [
              CarouselSlider(
                items: [],
                options: CarouselOptions(height: 400.0),)
            ],
          ),
        ],
      )
    );
  }
}
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class SliderLabel extends StatefulWidget {
  @override
  _SliderLabelState createState() => _SliderLabelState();
}

class _SliderLabelState extends State<SliderLabel> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              child: Slider(
                  value: value,
                  min: 0,
                  max: 150,
                  divisions: 150,
                  activeColor: thirdColor,
                  inactiveColor: thirdTransparentColor,
                  label: value.round().toString(),
                  onChanged: (value) => setState(() => this.value = value),     // takes the current position of the slider
              ),
            ),
          ],
        );
  }
}
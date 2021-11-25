import 'package:flutter/material.dart';
import 'package:fap/utilities/constants.dart';
import 'package:fap/components/User.dart';
import 'package:fap/components/User_Details.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // should not be stored in buttons
        infoEnter(context, 'Male', 'Gender'),
        infoEnter(context, '1 y/o', 'Age'),
        infoEnter(context, '3.8kg', 'Weight'),
      ],
    );
  }

  infoEnter(BuildContext context, String value, text) {
    return Row(//MaterialButton
        // onPressed: () {},
        children: [
      Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: thirdColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

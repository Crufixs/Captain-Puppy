import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //CODE
      body: Center(
        child: Text("HOME", style: TextTitle),
      ),
      bottomNavigationBar: CustomNavBar(currentIndex: 0, context: context),
    );
  }
}

import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Center(
            child: Text("PROFILE", style: TextTitle),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(currentIndex: 2, context: context),
    );
  }
}

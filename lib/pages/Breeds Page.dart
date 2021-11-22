import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class BreedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Text("BREEDS", style: TextTitle),
        ),
      ),
      bottomNavigationBar: CustomNavBar(currentIndex: 3, context: context),
    );
  }
}

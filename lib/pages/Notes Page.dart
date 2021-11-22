import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Text("NOTES", style: TextTitle),
        ),
      ),
      bottomNavigationBar: CustomNavBar(currentIndex: 4, context: context),
    );
  }
}

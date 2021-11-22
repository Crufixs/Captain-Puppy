import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Text("EXPENSES", style: TextTitle),
        ),
      ),
      bottomNavigationBar: CustomNavBar(currentIndex: 1, context: context),
    );
  }
}

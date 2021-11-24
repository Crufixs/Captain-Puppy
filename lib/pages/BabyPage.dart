import 'package:fap/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Breeds Page.dart';
import 'Expenses Page.dart';
import 'Home Page.dart';
import 'Notes Page.dart';
import 'Profile Page.dart';

class BabyPage extends StatefulWidget {
  BabyPage({this.selectedPage});
  var selectedPage;

  @override
  _BabyPageState createState() => _BabyPageState(selectedPage: selectedPage);
}

class _BabyPageState extends State<BabyPage> {
  _BabyPageState({this.selectedPage});
  var selectedPage;

  final _pageOptions = [
    Container(),
    ExpensesPage(),
    ProfilePage(),
    BreedsPage(),
    NotesPage(),
    BreedsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: _pageOptions[selectedPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: secondColor,
        selectedItemColor: firstColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24),
            activeIcon: Icon(Icons.home, size: 40),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            activeIcon: Icon(Icons.attach_money, size: 40),
            label: 'Expenses',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            activeIcon: Icon(Icons.account_circle, size: 40),
            label: 'Profile',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            activeIcon: Icon(Icons.pets, size: 40),
            label: 'Breeds',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_rounded),
            activeIcon: Icon(Icons.note_alt_rounded, size: 40),
            label: 'Notes',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            if (index == 0) {
              Navigator.pop(context);
            }
            selectedPage = index;
          });
        },
      ),
    );
  }
}

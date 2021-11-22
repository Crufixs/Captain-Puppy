import 'package:fap/pages/Breeds%20Page.dart';
import 'package:fap/pages/Expenses%20Page.dart';
import 'package:fap/pages/Home%20Page.dart';
import 'package:fap/pages/Notes%20Page.dart';
import 'package:fap/pages/Profile%20Page.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({required this.currentIndex, required this.context});
  final BuildContext context;
  final int currentIndex;

  final screens = [
    HomePage(),
    ExpensesPage(),
    ProfilePage(),
    BreedsPage(),
    NotesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: currentIndex,
      onTap: (index) => navigatePage(index),
    );
  }

  void navigatePage(int index) async {
    if (currentIndex != index) {
      switch (index) {
        case 0:
          //HomePage
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
          break;
        case 1:
          //Expenses
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExpensesPage(),
            ),
          );
          break;
        case 2:
          //Profile
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(),
            ),
          );
          break;
        case 3:
          //Breeds
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BreedsPage(),
            ),
          );
          break;
        case 4:
          //Notes
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotesPage(),
            ),
          );
          break;
      }
    }
  }
}

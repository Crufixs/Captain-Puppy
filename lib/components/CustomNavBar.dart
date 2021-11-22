import 'package:fap/pages/Breeds%20Page.dart';
import 'package:fap/pages/Expenses%20Page.dart';
import 'package:fap/pages/Home%20Page.dart';
import 'package:fap/pages/Notes%20Page.dart';
import 'package:fap/pages/Profile%20Page.dart';
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
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Expenses',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Profile',
          backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Breeds',
          backgroundColor: Colors.pink,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note_alt_rounded),
          label: 'Notes',
          backgroundColor: Colors.pink,
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber[800],
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

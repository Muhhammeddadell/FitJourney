import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_application/presentation/screens/exercises/exercieses.dart';
import 'package:workout_application/presentation/screens/home/home_page.dart';
import 'package:workout_application/presentation/screens/profile.dart';

import '../../exercieses.dart';
import '../meals_display.dart';

class navibar extends StatefulWidget {
  navibar({super.key});

  @override
  State<navibar> createState() => _navibar();
}

class _navibar extends State<navibar> {
  int _selectedIndex = 0;
  List _widgetOptions = [
    HomePage(),
    oExercieses(),
    newMeals(),
    Profilepage(),
  ];
  void onTap(int index) {
    setState(() {});
  }

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ("home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: ("train"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_rounded),
            label: ("meals"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ("profile"),
          ),
        ],
      ),
    );
  }
}

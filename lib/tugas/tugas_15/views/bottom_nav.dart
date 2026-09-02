import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_18/views/profile.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/views/home.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/views/search.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class BottomNavMeal extends StatefulWidget {
  const BottomNavMeal({super.key});

  @override
  State<BottomNavMeal> createState() => _BottomNavMealState();
}

class _BottomNavMealState extends State<BottomNavMeal> {
  int _currentIndex = 0;
  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _widgetOptions = [HomeMeal(), Search(), ProfileDay18()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        height: 64,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 96),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32), // Applies to all corners
        ),
        backgroundColor: Color(0xff0d0d0d),
        snakeViewColor: Color(0xffff7a00),
        selectedItemColor: Color(0xff0d0d0d),
        unselectedItemColor: Color(0xffff7a00),
        currentIndex: _currentIndex,
        onTap: (value) {
          changeIndex(value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.kitchen), label: "Kategori"),
        ],
      ),
      body: _widgetOptions.elementAt(_currentIndex),
    );
  }
}

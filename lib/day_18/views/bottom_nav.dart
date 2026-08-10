import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_18/views/profile.dart';
import 'package:flutter_masibelajar/tugas/tugas_8/home.dart';
import 'package:flutter_masibelajar/tugas/tugas_8/tentang.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class BottomNavDay18 extends StatefulWidget {
  const BottomNavDay18({super.key});

  @override
  State<BottomNavDay18> createState() => _BottomNavDay18State();
}

class _BottomNavDay18State extends State<BottomNavDay18> {
  int _currentIndex = 0;
  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _widgetOptions = [HomePage(), Tentang(), ProfileDay18()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        height: 64,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 128),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32), // Applies to all corners
        ),
        snakeViewColor: Color(0xff1C3F32),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xff1C3F32),
        currentIndex: _currentIndex,
        onTap: (value) {
          changeIndex(value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Tentang"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
      body: _widgetOptions.elementAt(_currentIndex),
    );
  }
}

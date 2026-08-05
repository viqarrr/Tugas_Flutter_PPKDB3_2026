import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_9/list.dart';
import 'package:flutter_masibelajar/tugas/tugas_9/list_of_map.dart';
import 'package:flutter_masibelajar/tugas/tugas_9/list_of_model.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class HomeTugas9 extends StatefulWidget {
  const HomeTugas9({super.key});

  @override
  State<HomeTugas9> createState() => _HomeTugas9State();
}

class _HomeTugas9State extends State<HomeTugas9> {
  int _currentIndex = 0;
  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _widgetOptions = [
    ListTugas9(),
    ListOfMapTugas9(),
    ListOfModelTugas9(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBody: true,
      bottomNavigationBar: SnakeNavigationBar.color(
        snakeShape: SnakeShape.indicator,
        behaviour: SnakeBarBehaviour.pinned,
        elevation: 8,
        snakeViewColor: Color(0xff1C3F32),
        unselectedItemColor: Color(0x851C3F32),
        selectedItemColor: Color(0xff1C3F32),
        selectedLabelStyle: TextStyle(color: Color(0xff1C3F32)),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (value) {
          changeIndex(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: "List of Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_rounded),
            label: "List of Model",
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_currentIndex),
    );
  }
}

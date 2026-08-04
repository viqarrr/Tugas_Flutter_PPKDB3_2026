import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_6_flutter.dart';
import 'package:flutter_masibelajar/tugas/tugas_day_5.dart';
import 'package:flutter_masibelajar/tugas/tugas_day_8.dart';

class BottomNavigatorDay13 extends StatefulWidget {
  const BottomNavigatorDay13({super.key});

  @override
  State<BottomNavigatorDay13> createState() => _BottomNavigatorDay13State();
}

class _BottomNavigatorDay13State extends State<BottomNavigatorDay13> {
  int _selectedBottom = 0;
  void changeBottom(int index) {
    print("Ini Adalah value dari $_selectedBottom");
    setState(() {
      _selectedBottom = index;
    });
  }

  final List<Widget> _widgetOptions = [TugasDay8(), LoginPage(), TugasDay5()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bottom Navigator Day 13",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottom,
        onTap: (value) {
          changeBottom(value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Business",
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedBottom),
    );
  }
}

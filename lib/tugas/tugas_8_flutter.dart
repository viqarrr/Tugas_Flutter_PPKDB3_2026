import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_7/category.dart';
import 'package:flutter_masibelajar/tugas/tugas_7/dark_mode.dart';
import 'package:flutter_masibelajar/tugas/tugas_7/datepick.dart';
import 'package:flutter_masibelajar/tugas/tugas_7/timepicker.dart';
import 'package:flutter_masibelajar/tugas/tugas_7/tnc.dart';
import 'package:flutter_masibelajar/tugas/tugas_8/home.dart';
import 'package:flutter_masibelajar/tugas/tugas_8/tentang.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class Tugas8Flutter extends StatefulWidget {
  const Tugas8Flutter({super.key});

  @override
  State<Tugas8Flutter> createState() => _Tugas8FlutterState();
}

class _Tugas8FlutterState extends State<Tugas8Flutter> {
  int _currentIndex = 0;
  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _widgetOptions = [HomePage(), Tentang()];

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
        ],
      ),
      drawer: _currentIndex == 0
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Color(0xff1C3F32)),
                    child: Container(
                      height: 22,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.edit_document),
                    title: Text("Syarat dan Ketentuan"),
                    onTap: () {
                      context.push(SyaratDanKetentuan());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.light_mode_rounded),
                    title: Text("Mode Tampilan"),
                    onTap: () {
                      context.push(DarkMode());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.category_rounded),
                    title: Text("Kategori Produk"),
                    onTap: () {
                      context.push(Category());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text("Pilih Tanggal"),
                    onTap: () {
                      context.push(DatePick());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.timer),
                    title: Text("Atur Pengingat"),
                    onTap: () {
                      context.push(TimePick());
                    },
                  ),
                ],
              ),
            )
          : null,
      body: _widgetOptions.elementAt(_currentIndex),
    );
  }
}

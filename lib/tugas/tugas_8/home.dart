import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_7/category.dart';
import 'package:flutter_masibelajar/tugas/tugas_7/dark_mode.dart';
import 'package:flutter_masibelajar/tugas/tugas_7/datepick.dart';
import 'package:flutter_masibelajar/tugas/tugas_7/timepicker.dart';
import 'package:flutter_masibelajar/tugas/tugas_7/tnc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBottom = 0;
  void changeBottom(int index) {
    setState(() {
      _selectedBottom = index;
    });
    context.pop();
  }

  final List<Widget> _widgetOptions = [
    SyaratDanKetentuan(),
    DarkMode(),
    Category(),
    DatePick(),
    TimePick(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      drawer: Drawer(
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
                changeBottom(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.light_mode_rounded),
              title: Text("Mode Tampilan"),
              onTap: () {
                changeBottom(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.category_rounded),
              title: Text("Kategori Produk"),
              onTap: () {
                changeBottom(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text("Pilih Tanggal"),
              onTap: () {
                changeBottom(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text("Atur Pengingat"),
              onTap: () {
                changeBottom(4);
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedBottom),
    );
  }
}

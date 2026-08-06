import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_13/input_widget.dart';
import 'package:flutter_masibelajar/day_15/list.dart';
import 'package:flutter_masibelajar/day_15/list_model.dart';
import 'package:flutter_masibelajar/day_15/list_of_map.dart';
import 'package:flutter_masibelajar/day_16/text_form_field.dart';
import 'package:flutter_masibelajar/day_17/services/preference_handler.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_11/login.dart';
import 'package:flutter_masibelajar/tugas/tugas_day_5.dart';
import 'package:flutter_masibelajar/tugas/tugas_day_8.dart';
import 'package:flutter_masibelajar/tugas/tugas_day_9.dart';

class DrawerDay13 extends StatefulWidget {
  const DrawerDay13({super.key});

  @override
  State<DrawerDay13> createState() => _DrawerDay13State();
}

class _DrawerDay13State extends State<DrawerDay13> {
  int _selectedBottom = 0;
  void changeBottom(int index) {
    print("Ini Adalah value dari $_selectedBottom");
    setState(() {
      _selectedBottom = index;
    });
    context.pop();
  }

  final List<Widget> _widgetOptions = [
    TugasDay9(),
    TugasDay8(),
    TugasDay5(),
    InputWidget(),
    ListDataDay14(),
    ListOfMapDay15(),
    ListOfModelDay15(),
    TextFormFieldDay16(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawr", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff1c3f32)),
              child: Image.asset("assets/images/dark_logo_plenty.png"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.home_filled),
                      title: Text("Home"),
                      onTap: () {
                        changeBottom(0);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.school),
                      title: Text("School"),
                      onTap: () {
                        changeBottom(1);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.business),
                      title: Text("Business"),
                      onTap: () {
                        changeBottom(2);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.input),
                      title: Text("Input Widget"),
                      onTap: () {
                        changeBottom(3);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text("List"),
                      onTap: () {
                        changeBottom(4);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text("List of Map"),
                      onTap: () {
                        changeBottom(5);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text("List of Model"),
                      onTap: () {
                        changeBottom(6);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.text_fields),
                      title: Text("Text Form Field"),
                      onTap: () {
                        changeBottom(7);
                      },
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.logout, size: 16, color: Colors.red),
                  title: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  onTap: () {
                    PreferenceHandler.logOut();
                    context.pushAndRemoveAll(LoginDay17());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedBottom),
    );
  }
}

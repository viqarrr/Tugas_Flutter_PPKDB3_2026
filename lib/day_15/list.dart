import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDataDay14 extends StatelessWidget {
  ListDataDay14({super.key});
  final List<String> namaBuah = [
    "Apel",
    "Mangga",
    "Pisang",
    "Jeruk",
    "Anggur",
    "Semangka",
    "Melon",
    "Stroberi",
    "Nanas",
    "Pepaya",
    "Durian",
    "Rambutan",
    "Nangka",
    "Salak",
    "Alpukat",
    "Ceri",
    "Kelapa",
    "Manggis",
    "Jambu",
    "Kiwi",
    "Markisa",
    "Lemon",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: namaBuah.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(13),
            ),
            // leading: Icon(Icons.water, size: 32, color: Colors.blue),
            title: Text(
              namaBuah[index],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                // color: Colors.grey[700],
              ),
            ),
            subtitle: Text(
              'Ini Buah',
              style: TextStyle(color: Colors.grey[700], fontSize: 12),
            ),
            trailing: Icon(CupertinoIcons.arrow_right, size: 18),
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfMapDay15 extends StatelessWidget {
  ListOfMapDay15({super.key});

  List<Map<String, dynamic>> dataProduk = [
    {"nama": "Apel", "harga": 25000, "asal": "Jepang"},
    {"nama": "Pisang", "harga": 15000, "asal": "Indonesia"},
    {"nama": "Jeruk", "harga": 20000, "asal": "Spanyol"},
    {"nama": "Mangga", "harga": 30000, "asal": "India"},
    {"nama": "Anggur", "harga": 40000, "asal": "Italia"},
    {"nama": "Semangka", "harga": 18000, "asal": "Brazil"},
    {"nama": "Melon", "harga": 22000, "asal": "Australia"},
    {"nama": "Kiwi", "harga": 50000, "asal": "Selandia Baru"},
    {"nama": "Nanas", "harga": 12000, "asal": "Filipina"},
    {"nama": "Stroberi", "harga": 45000, "asal": "Amerika Serikat"},
    {"nama": "Durian", "harga": 60000, "asal": "Thailand"},
    {"nama": "Rambutan", "harga": 25000, "asal": "Malaysia"},
    {"nama": "Pepaya", "harga": 10000, "asal": "Meksiko"},
    {"nama": "Jambu", "harga": 15000, "asal": "Vietnam"},
    {"nama": "Leci", "harga": 35000, "asal": "Cina"},
    {"nama": "Delima", "harga": 30000, "asal": "Iran"},
    {"nama": "Sirsak", "harga": 20000, "asal": "Karibia"},
    {"nama": "Ceri", "harga": 55000, "asal": "Turki"},
    {"nama": "Alpukat", "harga": 40000, "asal": "Meksiko"},
    {"nama": "Blueberry", "harga": 60000, "asal": "Kanada"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: dataProduk.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(13),
            ),
            // leading: Icon(Icons.water, size: 32, color: Colors.blue),
            title: Text(
              dataProduk[index]["nama"],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                // color: Colors.grey[700],
              ),
            ),
            subtitle: Text(
              "Rp. ${dataProduk[index]["harga"].toString()} \n"
              "Buah ini berasal dari ${dataProduk[index]["asal"]}",
              style: TextStyle(color: Colors.grey[700], fontSize: 12),
            ),
            trailing: Icon(CupertinoIcons.arrow_right, size: 18),
          );
        },
      ),
    );
  }
}

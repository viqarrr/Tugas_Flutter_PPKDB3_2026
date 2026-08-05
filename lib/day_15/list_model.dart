import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_15/model/buah_model.dart';

class ListOfModelDay15 extends StatelessWidget {
  ListOfModelDay15({super.key});

  List<BuahModel> dataProduk = [
    BuahModel(nama: "Apel", harga: 25000, asal: "Jepang"),
    BuahModel(nama: "Pisang", harga: 15000, asal: "Indonesia"),
    BuahModel(nama: "Jeruk", harga: 20000, asal: "Spanyol"),
    BuahModel(nama: "Mangga", harga: 30000, asal: "India"),
    BuahModel(nama: "Anggur", harga: 40000, asal: "Italia"),
    BuahModel(nama: "Semangka", harga: 18000, asal: "Brazil"),
    BuahModel(nama: "Melon", harga: 22000, asal: "Australia"),
    BuahModel(nama: "Kiwi", harga: 50000, asal: "Selandia Baru"),
    BuahModel(nama: "Nanas", harga: 12000, asal: "Filipina"),
    BuahModel(nama: "Stroberi", harga: 45000, asal: "Amerika Serikat"),
    BuahModel(nama: "Durian", harga: 60000, asal: "Thailand"),
    BuahModel(nama: "Rambutan", harga: 25000, asal: "Malaysia"),
    BuahModel(nama: "Pepaya", harga: 10000, asal: "Meksiko"),
    BuahModel(nama: "Jambu", harga: 15000, asal: "Vietnam"),
    BuahModel(nama: "Leci", harga: 35000, asal: "Cina"),
    BuahModel(nama: "Delima", harga: 30000, asal: "Iran"),
    BuahModel(nama: "Sirsak", harga: 20000, asal: "Karibia"),
    BuahModel(nama: "Ceri", harga: 55000, asal: "Turki"),
    BuahModel(nama: "Alpukat", harga: 40000, asal: "Meksiko"),
    BuahModel(nama: "Blueberry", harga: 60000, asal: "Kanada"),
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
            leading: Text(
              (index + 1).toString(),
              style: TextStyle(fontSize: 32),
            ),
            title: Text(
              dataProduk[index].nama,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                // color: Colors.grey[700],
              ),
            ),
            subtitle: Text(
              "Rp. ${dataProduk[index].harga.toString()}\n"
              "Buah ini berasal dari ${dataProduk[index].asal}",
              style: TextStyle(color: Colors.grey[700], fontSize: 12),
            ),
            trailing: Icon(CupertinoIcons.arrow_right, size: 18),
          );
        },
      ),
    );
  }
}

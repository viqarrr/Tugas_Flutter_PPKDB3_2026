import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListOfMapTugas9 extends StatelessWidget {
  ListOfMapTugas9({super.key});

  final List<Map<String, dynamic>> dataKategori = [
    {"nama": "Buah-buahan", "icon": FaIcon(FontAwesomeIcons.appleWhole)},
    {"nama": "Sayuran", "icon": FaIcon(FontAwesomeIcons.carrot)},
    {"nama": "Elektronik", "icon": FaIcon(FontAwesomeIcons.tv)},
    {"nama": "Pakaian Pria", "icon": FaIcon(FontAwesomeIcons.person)},
    {"nama": "Pakaian Wanita", "icon": FaIcon(FontAwesomeIcons.personDress)},
    {"nama": "Alat Tulis Kantor", "icon": FaIcon(FontAwesomeIcons.filePen)},
    {"nama": "Buku & Majalah", "icon": FaIcon(FontAwesomeIcons.book)},
    {"nama": "Peralatan Dapur", "icon": FaIcon(FontAwesomeIcons.kitchenSet)},
    {"nama": "Makanan Ringan", "icon": FaIcon(FontAwesomeIcons.cheese)},
    {"nama": "Minuman", "icon": FaIcon(FontAwesomeIcons.bottleWater)},
    {"nama": "Mainan Anak", "icon": FaIcon(FontAwesomeIcons.cubesStacked)},
    {
      "nama": "Peralatan Olahraga",
      "icon": FaIcon(FontAwesomeIcons.baseballBatBall),
    },
    {"nama": "Produk Kesehatan", "icon": FaIcon(FontAwesomeIcons.stethoscope)},
    {"nama": "Kosmetik", "icon": FaIcon(FontAwesomeIcons.sprayCanSparkles)},
    {"nama": "Obat-obatan", "icon": FaIcon(FontAwesomeIcons.kitMedical)},
    {"nama": "Aksesoris Mobil", "icon": FaIcon(FontAwesomeIcons.car)},
    {"nama": "Perabot Rumah", "icon": FaIcon(FontAwesomeIcons.couch)},
    {"nama": "Sepatu & Sandal", "icon": FaIcon(FontAwesomeIcons.shoePrints)},
    {"nama": "Barang Bekas", "icon": FaIcon(FontAwesomeIcons.recycle)},
    {"nama": "Voucher & Tiket", "icon": FaIcon(FontAwesomeIcons.ticket)},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 64, left: 16, right: 16, bottom: 96),
      separatorBuilder: (context, index) {
        return SizedBox(height: 8);
      },
      itemCount: dataKategori.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Etalase Toko",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                "Cari barang berdasarkan kategori",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
              ),
            ],
          );
        }

        return ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(13),
          ),
          leading: dataKategori[index]["icon"],
          title: Text(
            dataKategori[index]["nama"],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              // color: Colors.grey[700],
            ),
          ),
        );
      },
    );
  }
}

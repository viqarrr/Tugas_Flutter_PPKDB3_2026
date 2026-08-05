import 'package:flutter/material.dart';

class ListTugas9 extends StatelessWidget {
  ListTugas9({super.key});
  final List<String> dataKategori = [
    "Buah-buahan",
    "Sayuran",
    "Elektronik",
    "Pakaian Pria",
    "Pakaian Wanita",
    "Alat Tulis Kantor",
    "Buku & Majalah",
    "Peralatan Dapur",
    "Makanan Ringan",
    "Minuman",
    "Mainan Anak",
    "Peralatan Olahraga",
    "Produk Kesehatan",
    "Kosmetik",
    "Obat-obatan",
    "Aksesoris Mobil",
    "Perabot Rumah",
    "Sepatu & Sandal",
    "Barang Bekas",
    "Voucher & Tiket",
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
          // leading: Icon(Icons.water, size: 32, color: Colors.blue),
          title: Text(
            dataKategori[index],
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

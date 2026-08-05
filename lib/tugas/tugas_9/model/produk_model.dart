import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProdukModel {
  final String nama;
  final String gambar;
  final int harga;
  final List<double> ukuran;
  final String deskripsi;
  ProdukModel({
    required this.nama,
    required this.gambar,
    required this.harga,
    required this.ukuran,
    required this.deskripsi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'gambar': gambar,
      'harga': harga,
      'ukuran': ukuran,
    };
  }

  factory ProdukModel.fromMap(Map<String, dynamic> map) {
    return ProdukModel(
      nama: map['nama'] as String,
      gambar: map['gambar'] as String,
      harga: map['harga'] as int,
      ukuran: List<double>.from((map['ukuran'] as List<double>)),
      deskripsi: map['deskripsi'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdukModel.fromJson(String source) =>
      ProdukModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'package:flutter/material.dart';

class SyaratDanKetentuan extends StatefulWidget {
  const SyaratDanKetentuan({super.key});

  @override
  State<SyaratDanKetentuan> createState() => _SyaratDanKetentuanState();
}

class _SyaratDanKetentuanState extends State<SyaratDanKetentuan> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Syarat dan Ketentuan",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Terakhir diperbarui pada 3 Agustus 2026",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            Text(
              'Syarat dan Ketentuan ini merupakan perjanjian yang mengikat secara hukum yang dibuat antara Anda, baik secara pribadi maupun atas nama suatu entitas, terkait akses dan penggunaan Anda atas aplikasi Plenty serta segala bentuk media, saluran media, situs web seluler, atau aplikasi seluler yang terkait, tertaut, atau terhubung dengannya dengan cara apapun.',
            ),
            Text(
              'Anda setuju bahwa dengan mengakses Situs ini, Anda telah membaca, memahami, dan menyetujui untuk terikat oleh seluruh Syarat dan Ketentuan ini. Jika Anda tidak setuju dengan seluruh Syarat dan Ketentuan ini, maka Anda secara tegas dilarang menggunakan Situs ini dan Anda wajib segera menghentikan penggunaannya.',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saya menyetujui syarat dan ketentuan yang berlaku.",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Row(
                  spacing: 4,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = !_isChecked;
                          _isChecked = value ?? false;
                        });
                      },
                      activeColor: Color(0xff1C3F32),
                      visualDensity: VisualDensity(
                        horizontal: -4,
                        vertical: -4,
                      ),
                    ),
                    Text(
                      _isChecked
                          ? "Pendaftaran diperbolehkan"
                          : "Pendaftaran belum tersedia",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Tentang extends StatelessWidget {
  const Tentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(
            "Tentang Aplikasi",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Plenty",
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Versi 0.0.1 | Viqar 'Ammar Zulfa Mulya",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              Text(
                'Plenty adalah aplikasi mobile yang mengubah aktivitas merawat tanaman menjadi kebiasaan yang lebih menyenangkan melalui instruksi perawatan personal, log pertumbuhan visual, gamifikasi (streak & lencana), serta forum interaksi komunitas.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

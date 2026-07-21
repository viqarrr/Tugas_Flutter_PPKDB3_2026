import 'package:flutter/material.dart';

class TugasDay5 extends StatelessWidget {
  const TugasDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Profil Saya",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [Icon(Icons.settings, size: 30, color: Colors.black87)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.account_circle_rounded, size: 100),
          Text("Viqar 'Ammar Zulfa Mulya", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.black87, size: 24),
              Text("Jakarta", style: TextStyle(fontSize: 16,)),
            ],
          ),
          Text(
            "Lulusan SMK Jurusan Pengembangan Perangkat Lunak dan Game",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xff2C3639)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

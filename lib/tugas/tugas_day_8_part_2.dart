import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TugasDay8Part2 extends StatelessWidget {
  const TugasDay8Part2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Kejadian Jalanan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(CupertinoIcons.arrow_left_circle),
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              spacing: 16,
              children: [
                Text(
                  "Laporkan Kejadian Jalanan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Column(
                  spacing: 8,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: Icon(CupertinoIcons.question_circle_fill),
                        hintText: "Masukkan Kejadian",
                        label: Text("Kejadian"),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 18,
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: Icon(CupertinoIcons.location_solid),
                        hintText: "Masukkan Lokasi",
                        label: Text("Lokasi"),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 18,
                        ),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: Icon(CupertinoIcons.person_fill),
                        hintText: "Masukkan Nama Pelapor",
                        label: Text("Nama Pelapor"),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 18,
                        ),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: Icon(CupertinoIcons.line_horizontal_3),
                        hintText: "Masukkan Detail Kejadian",
                        label: Text("Detail Kejadian"),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            children: [
              Text(
                "Riwayat Kejadian Terakhir",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(13),
                ),
                leading: Icon(Icons.water, size: 32, color: Colors.blue),
                title: Text(
                  'Banjir',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // color: Colors.grey[700],
                  ),
                ),
                subtitle: Text(
                  'Jl. Daan Mogot KM 12\n'
                  'Dilaporkan 10 menit yang lalu',
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
                trailing: Icon(CupertinoIcons.arrow_right, size: 18),
              ),
              SizedBox(height: 8),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(13),
                ),
                leading: Icon(
                  Icons.car_crash,
                  size: 32,
                  color: Colors.yellow[700],
                ),
                title: Text(
                  'Kecelakaan Truk & Motor',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // color: Colors.grey[700],
                  ),
                ),
                subtitle: Text(
                  'Tol Dalam Kota KM 08 A (Arah Cawang)\n'
                  'Baru saja',
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
                trailing: Icon(CupertinoIcons.arrow_right, size: 18),
              ),
              SizedBox(height: 8),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(13),
                ),
                leading: Icon(
                  CupertinoIcons.tree,
                  size: 32,
                  color: Colors.green[700],
                ),
                title: Text(
                  'Pohon Tumbang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // color: Colors.grey[700],
                  ),
                ),
                subtitle: Text(
                  'Jl. Raya Pasar Minggu (Dekat Stasiun)\n'
                  'Dilaporkan 15 menit yang lalu',
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
                trailing: Icon(CupertinoIcons.arrow_right, size: 18),
              ),
              SizedBox(height: 8),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(13),
                ),
                leading: Icon(
                  Icons.construction_rounded,
                  size: 32,
                  color: Colors.yellow[700],
                ),
                title: Text(
                  'Proyek Pengaspalan Jalan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // color: Colors.grey[700],
                  ),
                ),
                subtitle: Text(
                  'Jl. Sudirman (Depan Gedung Mandiri)\n'
                  'Mulai 08:00 WIB (Estimasi selesai 17:00 WIB)',
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
                trailing: Icon(CupertinoIcons.arrow_right, size: 18),
              ),
              SizedBox(height: 8),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(13),
                ),
                leading: Icon(
                  Icons.traffic_rounded,
                  size: 32,
                  color: Colors.red,
                ),
                title: Text(
                  'Traffic Light Mati Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // color: Colors.grey[700],
                  ),
                ),
                subtitle: Text(
                  'Persimpangan Tomang Raya\n'
                  'Dilaporkan 40 menit yang lalu',
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
                trailing: Icon(CupertinoIcons.arrow_right, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

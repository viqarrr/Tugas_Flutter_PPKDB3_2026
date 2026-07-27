import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulDay9 extends StatefulWidget {
  const StatefulDay9({super.key});

  @override
  State<StatefulDay9> createState() => _StatefulDay9State();
}

class _StatefulDay9State extends State<StatefulDay9> {
  int counter = 0;
  bool showImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Stateful Day 9",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(CupertinoIcons.arrow_left_circle),
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Langkah 3: Tampilkan variabel state di widget
          Text("Nilai: $counter"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Langkah 6: Tambahkan setState di dalam fungsi aksi
                  setState(() {
                    counter++; // Memperbarui nilai state
                  });
                },
                child: Text("Tambah"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Langkah 6: Tambahkan setState di dalam fungsi aksi
                  setState(() {
                    counter = 0; // Memperbarui nilai state
                  });
                },
                child: Text("Reset"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Langkah 6: Tambahkan setState di dalam fungsi aksi
                  setState(() {
                    counter--; // Memperbarui nilai state
                  });
                },
                child: Text("Kurang"),
              ),
            ],
          ),

          TextButton(
            onPressed: () {
              setState(() {
                showImage = !showImage;
              });
            },
            child: Text(
              showImage ? "Saya belum siap" : "Saya sudah siap",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),

          if (showImage)
            Image.asset("assets/images/images.jpg", height: 300, width: 300),

          ElevatedButton(
            onPressed: () {
              debugPrint('Klik Saya');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Image.asset(
                    "assets/images/images.jpg",
                    height: 300,
                    width: 300,
                  ),
                ),
              );
            },
            child: Text("Klik saya"),
          ),

          IconButton(
            onPressed: () {
              debugPrint('Icon Diklik');
            },
            icon: Icon(CupertinoIcons.hand_point_left_fill, size: 48),
          ),

          TextButton(
            onPressed: () {
              debugPrint('Lah Teksnya Diklik');
            },
            child: Text('Batal'),
          ),

          InkWell(
            onTap: () {
              debugPrint('Lah Teksnya Diklik');
            },
            child: Image.asset(
              "assets/images/images.jpg",
              height: 300,
              width: 300,
            ),
          ),

          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 64),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'WIH ONTAP',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
            onDoubleTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 64),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'LAH DOUBLETAP',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 64),
                    decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'LOH LONGPRESS',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },

            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Ini GestureDetector'),
            ),
          ),

          FloatingActionButton(
            onPressed: () {
              debugPrint('FAB Ditekan');
            },
            tooltip: 'FAB',
            child: Icon(Icons.tap_and_play),
          ),
        ],
      ),
    );
  }
}

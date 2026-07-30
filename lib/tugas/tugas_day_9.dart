import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TugasDay9 extends StatefulWidget {
  const TugasDay9({super.key});

  @override
  State<TugasDay9> createState() => _TugasDay9State();
}

class _TugasDay9State extends State<TugasDay9> {
  int counter = 0;
  bool showElevatedButtonText = false;
  bool showIconColor = false;
  bool showDescription = false;
  bool showInkWellMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter -= 5;
          });
        },
        backgroundColor: Colors.cyan[600],
        tooltip: 'Decrement Button',
        child: Icon(Icons.horizontal_rule_rounded, color: Colors.white),
      ),
      appBar: AppBar(
        title: Text(
          "Interaksi Flutter",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(CupertinoIcons.arrow_left_circle),
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            Text(
              "Tombol ini adalah ElevatedButton",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showElevatedButtonText = !showElevatedButtonText;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan[600],
              ),
              child: Text("Klik saya!", style: TextStyle(color: Colors.white)),
            ),
            if (showElevatedButtonText)
              Text("Hai! Saya ElevatedButton", style: TextStyle(fontSize: 14)),

            SizedBox(height: 32),
            Text(
              "Di bawah ini adalah IconButton",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  showIconColor = !showIconColor;
                });
              },
              icon: Icon(
                Icons.traffic,
                size: 48,
                color: showIconColor ? Colors.green : Colors.red,
              ),
            ),
            Text(
              showIconColor ? "Silahkan Jalan" : "Berhenti!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: showIconColor ? Colors.green : Colors.red,
              ),
            ),

            SizedBox(height: 32),
            Text(
              "Kalo ini TextButton",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {
                setState(() {
                  showDescription = !showDescription;
                });
              },
              child: Text(
                showDescription ? "Tutup Deskripsi" : "Lihat Deskripsi",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[600],
                ),
              ),
            ),

            if (showDescription)
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 42),
                child: Text(
                  "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sapiente esse nulla officiis sunt non placeat illum consectetur quasi mollitia quibusdam.",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),

            SizedBox(height: 32),
            Text(
              "Nah yang ini InkWell",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            InkWell(
              splashFactory: InkRipple.splashFactory,
              onTap: () {
                setState(() {
                  showInkWellMessage = !showInkWellMessage;
                });
                debugPrint('STTT INI PESAN RAHASIA');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.cyan[600],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "Sentuh Aku",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            if (showInkWellMessage)
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 42),
                child: Text(
                  "Jangan Sentuh Aku!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),

            SizedBox(height: 32),
            Text(
              "Terus ini GestureDetector",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  counter++;
                  debugPrint("Ditekan sekali");
                });
              },
              onDoubleTap: () {
                setState(() {
                  counter += 2;
                  debugPrint("Ditekan dua kali");
                });
              },
              onLongPress: () {
                setState(() {
                  counter += 3;
                  debugPrint("Tahan Lama");
                });
              },

              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.cyan[600],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "Angka: $counter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

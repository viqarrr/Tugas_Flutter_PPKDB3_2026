import 'package:flutter/material.dart';

class GridViewDay8 extends StatelessWidget {
  const GridViewDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[3000],
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Grid View Day 8",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: GridView.count(
        crossAxisCount: 4, // Menampilkan 2 kotak per baris
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xf25ff00ff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  width: 50,
                ),
              ),
              Positioned(
                left: 40,
                top: 35,
                child: Icon(
                  Icons.airline_stops,
                  size: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                top: 10,
                left: 55,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  height: 15,
                  width: 15,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xf25ff00ff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  width: 50,
                ),
              ),
              Positioned(
                left: 40,
                top: 35,
                child: Icon(
                  Icons.access_time,
                  size: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                top: 10,
                left: 55,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  height: 15,
                  width: 15,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xf25ff00ff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  width: 50,
                ),
              ),
              Positioned(
                left: 40,
                top: 35,
                child: Icon(
                  Icons.access_time,
                  size: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xf25ff00ff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  width: 50,
                ),
              ),
              Positioned(
                left: 40,
                top: 35,
                child: Icon(
                  Icons.no_adult_content_rounded,
                  size: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xf25ff00ff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  width: 50,
                ),
              ),
              Positioned(
                left: 40,
                top: 35,
                child: Icon(
                  Icons.access_time,
                  size: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xf25ff00ff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  width: 50,
                ),
              ),
              Positioned(
                left: 40,
                top: 35,
                child: Icon(
                  Icons.access_time,
                  size: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xf25ff00ff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  width: 50,
                ),
              ),
              Positioned(
                left: 40,
                top: 35,
                child: Icon(
                  Icons.access_time,
                  size: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xf25ff00ff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  width: 50,
                ),
              ),
              Positioned(
                left: 40,
                top: 35,
                child: Icon(
                  Icons.access_time,
                  size: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

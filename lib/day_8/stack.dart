import 'package:flutter/material.dart';

class StackDay8 extends StatelessWidget {
  const StackDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Stack Day 8", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: Stack(
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
              height: 100,
              width: 100,
            ),
          ),
          Positioned(
            top: 10,
            left: 100,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              height: 25,
              width: 25,
            ),
          ),
          Positioned(
            left: 60,
            top: 60,
            child: Icon(
              Icons.access_time,
              size: 72,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

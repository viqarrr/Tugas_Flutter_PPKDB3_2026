import 'package:flutter/material.dart';

class SinglechildScrollDay8 extends StatelessWidget {
  const SinglechildScrollDay8({super.key});

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(width: 250, height: 200, color: Colors.red),
                  Container(width: 200, height: 300, color: Colors.green),
                  Container(width: 300, height: 300, color: Colors.blue),
                ],
              ),
            ),
            Container(width: 250, height: 200, color: Colors.red),
            Container(width: 200, height: 300, color: Colors.green),
            Container(width: 300, height: 300, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}

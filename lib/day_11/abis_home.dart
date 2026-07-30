import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_11/home.dart';

class SetelahHomeRoutingDay11 extends StatelessWidget {
  const SetelahHomeRoutingDay11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setelah Home Routing Day 11",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.arrow_left_circle),
        ),
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Balik/Pop"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeRoutingDay11()),
                  ((route) => false),
                );
              },
              child: Text("PushReplacement"),
            ),
          ),
        ],
      ),
    );
  }
}

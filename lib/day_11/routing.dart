import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_11/home.dart';

class RoutingDay11 extends StatelessWidget {
  const RoutingDay11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Routing Day 11",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeRoutingDay11()),
                );
              },
              child: Text("Push"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
              child: Text("PushNamed"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeRoutingDay11()),
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

import 'package:flutter/material.dart';

class LayoutingDay5 extends StatelessWidget {
  const LayoutingDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Hello Batch 7", style: TextStyle(color: Colors.white))
        title: Text.rich(
          TextSpan(
            text: "Hello, ",
            style: TextStyle(color: Colors.black87),
            children: <TextSpan>[
              TextSpan(
                text: "Batch 7",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        
        actions: [Icon(Icons.settings)],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          Row(children: [Icon(Icons.air), Text("Wushh")]),
          Text("Brrr"),
          Text("Brrr"),
          Text("Brrr"),
        ],
      ),
    );
  }
}

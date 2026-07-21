import 'package:flutter/material.dart';

class StylingDay5 extends StatelessWidget {
  const StylingDay5({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          Text("18℃", style: TextStyle(fontSize: 72)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(Icons.air, color: Colors.blue, size: 48),
                  Text(
                    "Wushh",
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.ac_unit, color: Colors.blue, size: 48),
                  Text(
                    "Brrrrrr",
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.wavy,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            spacing: 16,
            children: [
              Icon(Icons.arrow_upward, size: 54,),
              Icon(Icons.arrow_downward, size: 54, )
            ],
          )
        ],
      ),
    );
  }
}

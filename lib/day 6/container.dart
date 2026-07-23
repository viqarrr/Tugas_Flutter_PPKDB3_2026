import 'package:flutter/material.dart';

class ContainerDay6 extends StatelessWidget {
  const ContainerDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded Day 7"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: Container(color: Colors.indigo)),
                      Expanded(flex: 1, child: Container(color: Colors.yellow)),
                      Expanded(flex: 6, child: Container(color: Colors.indigo)),
                    ],
                  ),
                ),
                Expanded(child: Container(color: Colors.yellow)),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: Container(color: Colors.indigo)),
                      Expanded(flex: 1, child: Container(color: Colors.yellow)),
                      Expanded(flex: 6, child: Container(color: Colors.indigo)),
                    ],
                  ),
                ),
              ],
            ),
            // child: Column(
            //   children: [
            //     Expanded(child: Container(color: Colors.amberAccent,))
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}

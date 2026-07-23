import 'package:flutter/material.dart';

class ImageContainerDay6 extends StatelessWidget {
  const ImageContainerDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Container"), backgroundColor: Colors.amber),
      body: Column(children: [
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/images.jpg"))
          ),
        )
      ],),
    );
  }
}

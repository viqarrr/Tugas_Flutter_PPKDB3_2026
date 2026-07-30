import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ImageDay10 extends StatefulWidget {
  const ImageDay10({super.key});

  @override
  State<ImageDay10> createState() => ImageDay10State();
}

class ImageDay10State extends State<ImageDay10> {
  bool showImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Day 10",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: Center(
        child: Column(
          children: [
            showImage
                ? Image.asset(
                    'assets/images/images.jpg',
                    width: 200,
                    height: 200,
                  )
                : Shimmer(
                    child: Container(
                      color: Colors.red,
                      width: 200,
                      height: 200,
                    ),
                  ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showImage = !showImage;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(milliseconds: 500),
                      backgroundColor: Colors.red,
                      content: Center(
                        child: Text(
                          "saya akan lawan!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 72,
                          ),
                        ),
                      ),
                    ),
                  );
                });
              },
              child: Text(
                showImage ? "Oh ini" : "Mana Gambarnya",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Image.network('https://picsum.photos/200'),
          ],
        ),
      ),
    );
  }
}

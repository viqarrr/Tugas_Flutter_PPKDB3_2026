import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeTugas10 extends StatelessWidget {
  const HomeTugas10({super.key, required this.nama, required this.kotaAsal});
  final String nama;
  final String kotaAsal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/celebrate.json'),
            Text.rich(
              TextSpan(
                text: "Terima Kasih, ",
                children: <TextSpan>[
                  TextSpan(
                    text: nama,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " dari "),
                  TextSpan(
                    text: kotaAsal,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " telah mendaftar"),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/pages/authentication.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/widgets/centered_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBF7F1),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 16,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat datang di Plenty",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff66706B),
                  ),
                ),
                Text(
                  "Menanam dengan menyenangkan",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff363D45),
                    height: 1.2,
                  ),
                ),
              ],
            ),
            CenteredButton(
              onPressed: () {
                context.push(Authentication());
              },
              padding: EdgeInsets.symmetric(vertical: 16),
              margin: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Color(0xff1C3F32),
              borderRadius: BorderRadius.circular(36),
              content: Text(
                "Mulai",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

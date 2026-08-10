import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_18/models/user_model.dart';

class DetailProfileDay18 extends StatelessWidget {
  const DetailProfileDay18({super.key, required this.user});
  final UserModelSQL user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle_rounded, size: 100),
            Text(
              user.email,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Icon(Icons.password, color: Colors.black87, size: 24),
                Text(user.password, style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

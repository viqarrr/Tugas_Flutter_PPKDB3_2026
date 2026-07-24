import 'package:flutter/material.dart';

class TextFieldDay8 extends StatelessWidget {
  const TextFieldDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Text Field Day 8",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.app_settings_alt),
              hintText: "Text Field Loh Ya😹",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.app_settings_alt),
              hintText: "Text Field Loh Ya😹",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.app_settings_alt),
              hintText: "Text Field Loh Ya😹",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.app_settings_alt),
              hintText: "Text Field Loh Ya😹",
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({super.key});

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: _isChecked ? Colors.black : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          Switch(
            activeThumbColor: Colors.black,
            inactiveThumbColor: Colors.white,
            activeTrackColor: Colors.white,
            trackOutlineColor: _isChecked
                ? WidgetStatePropertyAll(Colors.white)
                : WidgetStatePropertyAll(Colors.transparent),
            thumbIcon: _isChecked
                ? WidgetStatePropertyAll(
                    Icon(Icons.dark_mode_rounded, color: Colors.white),
                  )
                : WidgetStatePropertyAll(
                    Icon(Icons.light_mode_rounded, color: Colors.amberAccent),
                  ),
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = !_isChecked;
              });
            },
          ),
          Text(
            _isChecked ? "Aktifkan Mode Terang" : "Aktifkan Mode Gelap",
            style: TextStyle(color: _isChecked ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}

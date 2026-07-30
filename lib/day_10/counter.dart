import 'package:flutter/material.dart';

class CounterDay10 extends StatefulWidget {
  const CounterDay10({super.key});

  @override
  State<CounterDay10> createState() => _CounterDay10State();
}

class _CounterDay10State extends State<CounterDay10> {
  @override
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter Day 10",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(counter.toString(), style: TextStyle(fontSize: 100)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Langkah 6: Tambahkan setState di dalam fungsi aksi
                  setState(() {
                    counter++; // Memperbarui nilai state
                  });
                },
                child: Text("Tambah"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Langkah 6: Tambahkan setState di dalam fungsi aksi
                  setState(() {
                    counter = 0; // Memperbarui nilai state
                  });
                },
                child: Text("Reset"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Langkah 6: Tambahkan setState di dalam fungsi aksi
                  setState(() {
                    counter--; // Memperbarui nilai state
                  });
                },
                child: Text("Kurang"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

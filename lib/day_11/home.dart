import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_11/abis_home.dart';

class HomeRoutingDay11 extends StatelessWidget {
  const HomeRoutingDay11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Routing Day 11",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          pushButton(
            context,
            "Push",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SetelahHomeRoutingDay11(),
                ),
              );
            },
          ),
          pushButton(
            context,
            "PushNamed",
            onPressed: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
          pushButton(
            context,
            "PushReplacement",
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SetelahHomeRoutingDay11(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Center pushButton(
    BuildContext context,
    String text, {
    void Function()? onPressed,
  }) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

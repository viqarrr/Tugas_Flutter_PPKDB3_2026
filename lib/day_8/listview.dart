import 'package:flutter/material.dart';

class ListViewDay8 extends StatelessWidget {
  const ListViewDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ListView Day 8",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 18),
            color: Colors.lime,
            width: 400,
            height: 400,
            child: ListTile(
              leading: Icon(
                Icons.agriculture,
                size: 72,
                color: Colors.grey[700],
              ),
              title: Text(
                "ngenngg",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 18),
            color: Colors.grey,
            width: 400,
            height: 400,
            child: ListTile(
              leading: Icon(Icons.agriculture, size: 72, color: Colors.lime),
              title: Text(
                "ngenngg",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.lime,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 18),
            color: Colors.lime,
            width: 400,
            height: 400,
            child: ListTile(
              leading: Icon(
                Icons.agriculture,
                size: 72,
                color: Colors.grey[700],
              ),
              title: Text(
                "ngenngg",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 18),
            color: Colors.grey,
            width: 400,
            height: 400,
            child: ListTile(
              leading: Icon(Icons.agriculture, size: 72, color: Colors.lime),
              title: Text(
                "ngenngg",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.lime,
                ),
              ),
            ),
          ),
        ],
      ),

      //  ListView.separated(
      //       itemCount: 100,
      //       separatorBuilder: (BuildContext context, int index) {
      //         return Divider(height: 100);
      //       },
      //       itemBuilder: (BuildContext context, int index) {
      //         return ListTile(
      //           leading: Text("${index + 1}"),
      //           title: Text("Nama : ${index + 1}"),
      //           subtitle: Text("Email : ${index + 1}"),
      //           trailing: Icon(Icons.arrow_forward),
      //         );
      //       },
      //     ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Detail Game", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [Icon(Icons.home_filled)],
        actionsPadding: EdgeInsets.only(right: 12),
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff1B2838)),
        child: Column(
          children: [
            SizedBox(height: 14),
            Center(
              child: Text(
                "DreadOut 2",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 98),
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.language,
                    size: 28.0,
                    color: Colors
                        .black, // atau ganti warna/gradient sesuai kebutuhan UI Plenty
                  ),
                  SizedBox(width: 8),
                  Text("www.digitalhappiness.net"),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 4, left: 14),
                  child: Row(
                    spacing: 4,
                    children: [
                      Icon(Icons.call, size: 20.0, color: Colors.white),
                      Text(
                        "(022) 20452158",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(top: 4, right: 14),
                  child: Row(
                    spacing: 4,
                    children: [
                      Icon(Icons.location_on, size: 20.0, color: Colors.white),
                      Text(
                        "Bandung, Indonesia",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24, top: 24),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    spacing: 4,
                    children: [
                      Text("OVERALL REVIEWS:", style: TextStyle(fontSize: 12)),
                      Text(
                        "Mostly Positive",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue[800],
                        ),
                      ),
                      Text("1.830 Reviews", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, top: 24),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    spacing: 4,
                    children: [
                      Text("OVERALL REVIEWS:", style: TextStyle(fontSize: 12)),
                      Text(
                        "Mostly Positive",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue[800],
                        ),
                      ),
                      Text("1.830 Reviews", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "A third-person horror adventure that draws inspiration from Indonesian urban legend. Play as Linda, a high school student with the ability to sense and see ghosts. This spine-chilling sequel expands on the cult hit original, making DreadOut 2 another terrifying addition to the horror genre.",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 18),

            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/dreadout_2.jpg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

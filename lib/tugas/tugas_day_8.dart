import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TugasDay8 extends StatelessWidget {
  const TugasDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registrasi & Layanan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(CupertinoIcons.arrow_left_circle),
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 12,
          children: [
            Container(
              padding: EdgeInsets.all(32),
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              child: Column(
                spacing: 16,
                children: [
                  Text(
                    "Bergabung Dengan Kami",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    spacing: 8,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          fillColor: Color(0x258FC858),
                          filled: true,
                          prefixIcon: Icon(Icons.person),
                          hintText: "Masukkan Username",
                          label: Text("Username"),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 18,
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          fillColor: Color(0x258FC858),
                          filled: true,
                          prefixIcon: Icon(Icons.email),
                          hintText: "Masukkan Alamat Email",
                          label: Text("Email"),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 18,
                          ),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          fillColor: Color(0x258FC858),
                          filled: true,
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          hintText: "Masukkan Password",
                          label: Text("Password"),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 18,
                          ),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          fillColor: Color(0x258FC858),
                          filled: true,
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          hintText: "Ulangi Password",
                          label: Text("Konfirmasi Password"),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              spacing: 12,
              children: [
                Text(
                  "Layanan Kami",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4, // Menampilkan 2 kotak per baris
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 10,
                          left: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xf508fc858),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 35,
                          child: Icon(
                            Icons.airline_stops,
                            size: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 45,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            height: 15,
                            width: 30,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 50,
                          child: Text(
                            "New",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 10,
                          left: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xf508fc858),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 35,
                          child: Icon(
                            Icons.energy_savings_leaf_outlined,
                            size: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 45,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            height: 15,
                            width: 30,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 50,
                          child: Text(
                            "New",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 10,
                          left: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xf508fc858),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 35,
                          child: Icon(
                            Icons.directions,
                            size: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 10,
                          left: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xf508fc858),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 35,
                          child: Icon(
                            Icons.water,
                            size: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 10,
                          left: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xf508fc858),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 35,
                          child: Icon(
                            Icons.sports_kabaddi,
                            size: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 10,
                          left: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xf508fc858),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 35,
                          child: Icon(
                            Icons.psychology,
                            size: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 10,
                          left: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xf508fc858),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 35,
                          child: Icon(
                            Icons.power_sharp,
                            size: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 10,
                          left: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xf508fc858),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 35,
                          child: Icon(
                            Icons.safety_check,
                            size: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_10/home_tugas_10.dart';
import 'package:flutter_masibelajar/widgets/input_field.dart';
import 'package:lottie/lottie.dart';

class Tugas10Flutter extends StatefulWidget {
  const Tugas10Flutter({super.key});

  @override
  State<Tugas10Flutter> createState() => _Tugas10FlutterState();
}

class _Tugas10FlutterState extends State<Tugas10Flutter> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomorTeleponController = TextEditingController();
  final TextEditingController kotaAsalController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteractionIfError,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  spacing: 32,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      spacing: 8,
                      children: [
                        InputField(
                          label: "Nama Lengkap",
                          hintText: "Masukkan nama lengkap anda",
                          controller: namaController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "nama lengkap tidak boleh kosong";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        InputField(
                          label: "Email",
                          hintText: "Masukkan email",
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email tidak boleh kosong";
                            } else if (!value.contains("@")) {
                              return "Email tidak valid";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        InputField(
                          label: "Nomor telepon",
                          hintText: "Masukkan nomor telepon",
                          controller: nomorTeleponController,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        InputField(
                          label: "Kota Asal",
                          hintText: "Masukkan kota asal anda",
                          controller: kotaAsalController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Kota asal tidak boleh kosong";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(spreadRadius: 1, color: Color(0xff375DFB)),
                          BoxShadow(
                            color: Color(0x48253ea7),
                            offset: Offset(0, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Colors.white,
                                content: Column(
                                  spacing: 16,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      spacing: 6,
                                      children: [
                                        Lottie.asset(
                                          'assets/animations/success.json',
                                          repeat: false,
                                          height: 100,
                                        ),
                                        Text(
                                          "Pendaftaran Berhasil",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.push(
                                        HomeTugas10(
                                          nama: namaController.text,
                                          kotaAsal: kotaAsalController.text,
                                        ),
                                      );
                                    },
                                    child: Text("Lanjut"),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Colors.white,
                                content: Column(
                                  spacing: 16,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      spacing: 6,
                                      children: [
                                        Lottie.asset(
                                          'assets/animations/input_error.json',
                                          repeat: false,
                                          height: 100,
                                        ),
                                        Text(
                                          "Pendaftaran Gagal",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      spacing: 4,
                                      children: [
                                        if (namaController.value.text.isEmpty)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.dangerous_rounded,
                                                color: Colors.red,
                                              ),
                                              Text("Nama tidak boleh kosong!"),
                                            ],
                                          ),
                                        if (emailController
                                                .value
                                                .text
                                                .isEmpty ||
                                            !emailController.value.text
                                                .contains("@"))
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.dangerous_rounded,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                emailController
                                                        .value
                                                        .text
                                                        .isEmpty
                                                    ? "Email tidak boleh kosong!"
                                                    : "Email tidak valid",
                                              ),
                                            ],
                                          ),
                                        if (kotaAsalController
                                            .value
                                            .text
                                            .isEmpty)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.dangerous_rounded,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                "Kota asal tidak boleh kosong!",
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: Text("Baiklah"),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0x251D61E7),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Daftar",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

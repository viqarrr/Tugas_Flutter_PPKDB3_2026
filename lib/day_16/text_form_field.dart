import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_16/home_abal_abal.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/widgets/input_field.dart';
import 'package:lottie/lottie.dart';

class TextFormFieldDay16 extends StatefulWidget {
  const TextFormFieldDay16({super.key});

  @override
  State<TextFormFieldDay16> createState() => _TextFormFieldDay16State();
}

class _TextFormFieldDay16State extends State<TextFormFieldDay16> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              InputField(
                label: "Email",
                hintText: "Masukkan email",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "email tidak boleh kosong";
                  } else if (!value.contains("@")) {
                    return "email tidak valid";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {});
                },
              ),
              InputField(
                label: "Password",
                hintText: "Masukkan password",
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password tidak boleh kosong";
                  } else if (value.length < 8) {
                    return "password kurang dari 8 karakter";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {});
                },
              ),
              InputField(
                label: "Konfirmasi Password",
                hintText: "Masukkan konfirmasi password",
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "konfirmasi password tidak boleh kosong";
                  } else if (value.length < 8) {
                    return "konfirmasi password kurang dari 8 karakter";
                  } else if (value != passwordController.text) {
                    return "konfirmasi password tidak sesuai";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {});
                },
              ),
              ElevatedButton(
                onPressed: () {
                  print(emailController.text);
                  print(passwordController.text);
                  print(confirmPasswordController.text);
                  if (_formKey.currentState!.validate()) {
                    context.push(
                      HomeAbalAbalDay16(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  } else {
                    print("Belum tervalidasi");
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Info"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset('assets/animations/error.json'),
                            Text("${emailController.text} tidak valid"),
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
                child: Text("Tekan ini"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

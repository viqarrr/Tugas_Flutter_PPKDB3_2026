import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_18/database/db_helper.dart';
import 'package:flutter_masibelajar/day_18/models/user_model.dart';
import 'package:flutter_masibelajar/day_18/views/profile.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/widgets/input_field.dart';
import 'package:lottie/lottie.dart';

class EditProfileDay18 extends StatefulWidget {
  final UserModelSQL user;
  const EditProfileDay18({super.key, required this.user});

  @override
  State<EditProfileDay18> createState() => _EditProfileDay18State();
}

class _EditProfileDay18State extends State<EditProfileDay18> {
  late final TextEditingController emailC = TextEditingController(
    text: widget.user.email.toString(),
  );
  late final TextEditingController passwordC = TextEditingController(
    text: widget.user.password.toString(),
  );
  final _formKey = GlobalKey<FormState>();

  void update() async {
    final user = emailC.text.trim();
    final pass = passwordC.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final pengguna = UserModelSQL(
      id: widget.user.id,
      nama: "null",
      username: "null",
      asalKota: "null",
      email: user,
      nomorHp: user,
      password: pass,
    );

    bool success = await DBHelper().updateUser(pengguna);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Akun berhasil diperbarui')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Akun gagal diperbarui!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
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
                      "Edit Pengguna",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      spacing: 8,
                      children: [
                        InputField(
                          label: "Email",
                          hintText: "Masukkan email",
                          controller: emailC,
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
                          label: "Password",
                          hintText: "Masukkan password",
                          controller: passwordC,
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
                                          "Update Pengguna Berhasil",
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
                                      update();
                                      context.push(ProfileDay18());
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
                                          "Update Pengguna Gagal",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      spacing: 4,
                                      children: [
                                        if (emailC.value.text.isEmpty ||
                                            !emailC.value.text.contains("@"))
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.dangerous_rounded,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                emailC.value.text.isEmpty
                                                    ? "Email tidak boleh kosong!"
                                                    : "Email tidak valid",
                                              ),
                                            ],
                                          ),
                                        if (passwordC.value.text.isEmpty)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.dangerous_rounded,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                "Password tidak boleh kosong!",
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
                            "Edit",
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

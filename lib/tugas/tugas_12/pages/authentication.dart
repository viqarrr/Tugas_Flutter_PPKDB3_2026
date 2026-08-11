import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/multi_step_form.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/pages/login.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/widgets/centered_button.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffEBF7F1),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 16,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat datang di Plenty",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff66706B),
                    ),
                  ),
                  Text(
                    "Daftar atau masuk ke akun anda",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff363D45),
                      height: 1.2,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 8,
                children: [
                  CenteredButton(
                    onPressed: () {
                      context.push(MultiStepForm());
                    },
                    padding: EdgeInsets.symmetric(vertical: 16),
                    margin: EdgeInsets.only(top: 16),
                    backgroundColor: Color(0xff1C3F32),
                    borderRadius: BorderRadius.circular(36),
                    content: Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Atau",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6C7278),
                    ),
                  ),
                  CenteredButton(
                    onPressed: () {
                      context.push(Login());
                    },
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Color(0xffE8EAED),
                    borderRadius: BorderRadius.circular(36),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Icon(
                          CupertinoIcons.mail,
                          fontWeight: FontWeight.bold,
                          size: 20,
                          color: Color(0xff363D45),
                        ),
                        Text(
                          "Masuk dengan Email",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff363D45),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CenteredButton(
                    onPressed: () {
                      context.push(MultiStepForm());
                    },
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Color(0xffE8EAED),
                    borderRadius: BorderRadius.circular(36),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Image.asset("assets/images/google.png", height: 20),
                        Text(
                          "Masuk dengan Google",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff363D45),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

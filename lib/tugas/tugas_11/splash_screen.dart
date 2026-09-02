import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_17/services/preference_handler.dart';
import 'package:flutter_masibelajar/day_32/views/post_list.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/pages/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(Duration(seconds: 2));

    if (PreferenceHandler.isLogin) {
      context.push(PostList());
    } else {
      context.push(Welcome());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C3F32),
      body: Center(
        child: Image.asset("assets/images/dark_logo.png", width: 250),
      ),
    );
  }
}

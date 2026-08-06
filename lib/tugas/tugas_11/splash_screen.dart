import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_13/drawer.dart';
import 'package:flutter_masibelajar/day_17/services/preference_handler.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_11/login.dart';

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
      context.push(DrawerDay13());
    } else {
      context.push(LoginDay17());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/light_logo_plenty.png", width: 250),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/views/home.dart';

class SplashMeal extends StatefulWidget {
  const SplashMeal({super.key});

  @override
  State<SplashMeal> createState() => _SplashMealState();
}

class _SplashMealState extends State<SplashMeal> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(Duration(seconds: 2));
    context.push(HomeMeal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1a1a),
      body: Center(
        child: Image.asset("assets/images/meal_logo.png", width: 144),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/views/auth_selection_screen.dart';

export 'views/auth_selection_screen.dart';
export 'views/login_screen.dart';
export 'views/register_screen.dart';
export 'views/home_screen.dart';
export 'views/profile_edit_screen.dart';

class Tugas16App extends StatelessWidget {
  const Tugas16App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 16 - Autentikasi & CRUD Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.canvasDefault,
        primaryColor: AppColors.primaryNavy,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryNavy,
          primary: AppColors.primaryNavy,
        ),
        useMaterial3: true,
      ),
      home: const AuthSelectionScreenTugas16(),
    );
  }
}

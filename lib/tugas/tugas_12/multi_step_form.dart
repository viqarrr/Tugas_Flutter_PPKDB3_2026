import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_18/models/user_model.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/database/db_helper.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/pages/authentication.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/pages/city.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/pages/email.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/pages/name.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/pages/password.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/pages/password_confirmation.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/pages/phone_number.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/pages/username.dart';

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({super.key});

  @override
  State<MultiStepForm> createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final PageController _pageController = PageController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  List<Widget> get inputPages => [
    NameInput(controller: _nameController, onValidNext: _nextPage),
    UsernameInput(controller: _usernameController, onValidNext: _nextPage),
    EmailInput(controller: _emailController, onValidNext: _nextPage),
    PhoneNumberInput(controller: _phoneController, onValidNext: _nextPage),
    PasswordInput(controller: _passwordController, onValidNext: _nextPage),
    PasswordConfirmationInput(
      passwordC: _passwordController,
      onValidNext: _nextPage,
    ),
    CityInput(controller: _cityController, onValidNext: _nextPage),
  ];
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _nextPage() {
    print(_currentIndex);
    print(inputPages.length - 1);
    if (_currentIndex < inputPages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      register();
    }
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void register() async {
    final name = _nameController.text.trim();
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final pass = _passwordController.text;
    final asalKota = _cityController.text.trim();

    if (name.isEmpty || username.isEmpty || pass.isEmpty || asalKota.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final pengguna = UserModelSQL(
      username: username,
      nama: name,
      email: email,
      password: pass,
      asalKota: asalKota,
    );
    print(pengguna);

    bool success = await DBHelperTugas12().registerUser(pengguna);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Akun berhasil dibuat')));
      context.push(Authentication());
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email sudah terdaftar!')));
    }
  }

  void submitForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBF7F1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (_currentIndex != 0) {
                        _previousPage();
                      } else {
                        context.pop();
                      }
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: (_currentIndex + 1) / inputPages.length,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff1C3F32),
                      backgroundColor: Colors.blueGrey[100],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _currentIndex = i),
                children: inputPages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

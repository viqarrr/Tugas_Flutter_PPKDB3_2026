import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_11/abis_home.dart';
import 'package:flutter_masibelajar/day_11/routing.dart';
import 'package:flutter_masibelajar/day_17/services/preference_handler.dart';
import 'package:flutter_masibelajar/day_18/database/db_helper.dart';
import 'package:flutter_masibelajar/day_18/models/user_model.dart';
import 'package:flutter_masibelajar/day_18/views/bottom_nav.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';

class LoginDay18 extends StatefulWidget {
  const LoginDay18({super.key});

  @override
  State<LoginDay18> createState() => _LoginDay18State();
}

class _LoginDay18State extends State<LoginDay18> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  void register() async {
    final user = emailC.text.trim();
    final pass = passwordC.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final pengguna = UserModelSQL(
      email: user,
      password: pass,
      nama: "null",
      username: "null",
      asalKota: "null",
    );

    bool success = await DBHelper().registerUser(pengguna);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Akun berhasil dibuat')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email sudah terdaftar!')));
    }
  }

  void login() async {
    final email = emailC.text.trim();
    final password = passwordC.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final pengguna = await DBHelper().loginUser(email, password);

    if (!mounted) return;

    if (pengguna != null) {
      PreferenceHandler.setLogin(true);
      context.pushAndRemoveAll(BottomNavDay18());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal! email atau Password salah.'),
        ), // SnackBar
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 22,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  spacing: 24,
                  children: [
                    Column(
                      spacing: 12,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Color(0xff6C7278),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: Color(0xff4d81e7),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 16,
                      children: [
                        inputField(
                          false,
                          emailC,
                          (value) {
                            if (value == null || value.isEmpty) {
                              return "Email tidak boleh kosong";
                            } else if (!value.contains("@")) {
                              return "Email tidak valid";
                            }
                            return null;
                          },
                          (value) {
                            setState(() {});
                            return;
                          },
                          "Email",
                          "Your email address...",
                        ),
                        inputField(
                          _obscureText,
                          passwordC,
                          (value) {
                            if (value == null || value.isEmpty) {
                              return "Password tidak boleh kosong";
                            } else if (value.length < 8) {
                              return "Password kurang dari 8 karakter";
                            }
                            return null;
                          },
                          (value) {
                            setState(() {});
                            return;
                          },
                          "Password",
                          "********",
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 0.8,
                                  alignment: Alignment.centerLeft,
                                  child: Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    side: BorderSide(
                                      color: Color(0xff6C7278),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff6C7278),
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsetsGeometry.zero,
                                ),
                              ),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4d81e7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      spacing: 24,
                      children: [
                        CenteredButton(
                          backgroundColor: Color(0xff1D61E7),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 1,
                              color: Color(0xff375DFB),
                            ),
                            BoxShadow(
                              color: Color(0x48253ea7),
                              offset: Offset(0, 1),
                              blurRadius: 2,
                            ),
                          ],
                          content: Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                        ),
                        CenteredButton(
                          backgroundColor: Color(0xff1D61E7),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 1,
                              color: Color(0xff375DFB),
                            ),
                            BoxShadow(
                              color: Color(0x48253ea7),
                              offset: Offset(0, 1),
                              blurRadius: 2,
                            ),
                          ],
                          content: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              register();
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 16,
                          children: [
                            Expanded(child: Divider(color: Color(0xffEDF1F3))),
                            Text(
                              "Or",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff6C7278),
                              ),
                            ),
                            Expanded(child: Divider(color: Color(0xffEDF1F3))),
                          ],
                        ),
                        Column(
                          spacing: 16,
                          children: [
                            CenteredButton(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 14),
                              border: BoxBorder.all(
                                color: Color(0xffEFF0F6),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x50f4f5fa),
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ],
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Image.asset(
                                    "assets/images/google.png",
                                    height: 18,
                                  ),
                                  Text(
                                    "Continue with Google",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1A1C1E),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RoutingDay11(),
                                  ),
                                );
                              },
                            ),
                            CenteredButton(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 14),
                              border: BoxBorder.all(
                                color: Color(0xffEFF0F6),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x50f4f5fa),
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ],
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Image.asset(
                                    "assets/images/facebook.png",
                                    height: 18,
                                  ),
                                  Text(
                                    "Continue with Facebook",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1A1C1E),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SetelahHomeRoutingDay11(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
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

  Column inputField(
    bool? obscureText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    String label,
    String hintText, [
    Widget? suffixIcon,
  ]) {
    return Column(
      spacing: 8,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: "Plus Jakarta Sans",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff6C7278),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x24E4E5E7),
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: TextFormField(
                obscureText: obscureText!,
                controller: controller,
                validator: validator,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.5,
                    horizontal: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xffedf1f3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xffedf1f3)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  fillColor: Colors.white,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14),
                  suffixIcon: suffixIcon,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CenteredButton extends StatelessWidget {
  final Color backgroundColor;
  final Widget content;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow>? boxShadow;
  final void Function()? onPressed;

  const CenteredButton({
    super.key,
    required this.backgroundColor,
    required this.content,
    required this.borderRadius,
    this.padding,
    this.border,
    this.boxShadow,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          elevation: 0,
          padding: padding,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Center(child: content),
      ),
    );
  }
}

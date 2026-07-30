import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            Container(
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
                      inputField("Email", "Your email address..."),
                      inputField(
                        "Password",
                        "********",
                        Icon(
                          CupertinoIcons.eye_slash,
                          size: 16,
                          color: Color(0xffacb5bb),
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
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff4d81e7),
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
                          BoxShadow(spreadRadius: 1, color: Color(0xff375DFB)),
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column inputField(String label, String hintText, [Widget? suffixIcon]) {
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
              child: TextField(
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

  const CenteredButton({
    super.key,
    required this.backgroundColor,
    required this.content,
    required this.borderRadius,
    this.padding,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Center(child: content),
      ),
    );
  }
}

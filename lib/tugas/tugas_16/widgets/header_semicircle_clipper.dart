import 'package:flutter/material.dart';

/// Clipper yang menghasilkan bentuk lengkungan setengah lingkaran (semicircle) yang mulus
/// dan cembung ke bawah pada header profil.
class HeaderSemicircleClipper extends CustomClipper<Path> {
  final double curveDepth;

  const HeaderSemicircleClipper({this.curveDepth = 48.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    // Mulai dari pojok kiri atas
    path.moveTo(0, 0);

    // Garis lurus ke tepi kiri sebelum lengkungan
    path.lineTo(0, h - curveDepth);

    // Lengkungan setengah lingkaran mulus ke bawah (apex di tengah tepat pada h)
    path.quadraticBezierTo(
      w / 2,
      h + curveDepth,
      w,
      h - curveDepth,
    );

    // Garis lurus naik ke pojok kanan atas
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant HeaderSemicircleClipper oldClipper) {
    return oldClipper.curveDepth != curveDepth;
  }
}

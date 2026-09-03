import 'package:flutter/material.dart';

class HeaderConcaveClipper extends CustomClipper<Path> {
  final double cutoutRadius;
  final double curveDepth;

  const HeaderConcaveClipper({
    this.cutoutRadius = 58.0,
    this.curveDepth = 42.0,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    final cx = w / 2;

    path.moveTo(0, 0);
    path.lineTo(0, h);

    final entryX = cx - cutoutRadius - 32;
    path.lineTo(entryX > 0 ? entryX : 0, h);

    path.cubicTo(
      cx - cutoutRadius,
      h,
      cx - cutoutRadius + 12,
      h - curveDepth,
      cx,
      h - curveDepth,
    );

    path.cubicTo(
      cx + cutoutRadius - 12,
      h - curveDepth,
      cx + cutoutRadius,
      h,
      cx + cutoutRadius + 32 < w ? cx + cutoutRadius + 32 : w,
      h,
    );

    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant HeaderConcaveClipper oldClipper) {
    return oldClipper.cutoutRadius != cutoutRadius ||
        oldClipper.curveDepth != curveDepth;
  }
}

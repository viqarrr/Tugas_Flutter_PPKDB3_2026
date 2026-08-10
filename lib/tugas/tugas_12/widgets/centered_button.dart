import 'package:flutter/material.dart';

class CenteredButton extends StatelessWidget {
  final Color backgroundColor;
  final Widget content;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
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
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
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

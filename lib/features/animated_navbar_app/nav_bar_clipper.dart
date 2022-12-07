import 'package:flutter/material.dart';

class NavBarClipper extends CustomClipper<Path> {
  const NavBarClipper(this.value);

  final double value;

  @override
  Path getClip(Size size) {
    final w = size.width, h = size.height;

    return Path()
      ..moveTo(0, 10)
      ..lineTo(value - 40, 10)
      ..cubicTo(value - 30, 10, value - 20, 0, value, 0)
      ..cubicTo(value + 20, 0, value + 30, 10, value + 40, 10)
      ..lineTo(w, 10)
      ..lineTo(w, h)
      ..lineTo(0, h);
  }

  @override
  bool shouldReclip(covariant NavBarClipper oldClipper) {
    return oldClipper.value != value;
  }
}

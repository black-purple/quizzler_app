import 'package:flutter/material.dart';

BoxShadow kelevation1 = BoxShadow(
  color: Colors.blueGrey,
  blurRadius: 15,
  spreadRadius: 0.1,
  offset: Offset.zero,
);
BoxShadow kelevation2 = BoxShadow(
  color: Colors.blueGrey,
  blurRadius: 70,
  spreadRadius: 8,
  offset: Offset.zero,
);
BoxShadow kglowElevation = BoxShadow(
  color: Colors.tealAccent,
  blurRadius: 20.0,
  spreadRadius: 3.1,
  offset: Offset.zero,
);

BoxShadow knoGlow = BoxShadow(
  color: Colors.transparent,
  blurRadius: 0,
  spreadRadius: 0,
  offset: Offset.zero,
);

BoxShadow kelevation3 = BoxShadow(
  color: Color(0xFF37474F),
  blurRadius: 70,
  spreadRadius: 3,
  offset: Offset.zero,
);

double deviceHeight(BuildContext context) {
  double deviceHeight = MediaQuery.of(context).size.height;
  return deviceHeight;
}

double deviceWidth(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  return deviceWidth;
}

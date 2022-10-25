import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget(
      {Key? key, required this.child, required this.imagePath})
      : super(key: key);

  final Widget child;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset(imagePath).image, fit: BoxFit.fitHeight),
        ),
        child: Center(child: child));
  }
}

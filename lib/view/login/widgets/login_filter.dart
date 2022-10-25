import 'dart:ui';

import 'package:flutter/material.dart';

class LoginFilter extends StatelessWidget {
  const LoginFilter({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child:
                Container(color: Colors.white.withOpacity(0.2), child: child)));
  }
}

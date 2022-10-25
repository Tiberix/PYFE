import 'dart:ui';

import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
        child: Container(color: Colors.grey.withOpacity(0.05), child: child),
      ),
    );
  }
}

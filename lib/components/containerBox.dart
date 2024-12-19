import 'package:flutter/material.dart';
import 'package:munchkins/const.dart';

class Containerbox extends StatelessWidget {
  const Containerbox({super.key, this.child, this.height});
  final child;
  final height;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: backgroundColorDark,
          ),
          child: child,
        ),
      );
  }
}

import 'package:flutter/material.dart';

class SpaceNeedleInACircle extends StatelessWidget {
  const SpaceNeedleInACircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset('assets/spaceneedle.jpeg', width: 400, height: 400, fit: BoxFit.cover,),
    );
  }
}
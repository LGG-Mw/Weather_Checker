import 'package:flutter/material.dart';

class BigTemp extends StatelessWidget {
  final int tempInfahrenheit;
  const BigTemp(this.tempInfahrenheit, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$tempInfahrenheit°', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold,),);
  }
}
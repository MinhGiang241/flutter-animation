import 'package:animation/animaion/drawer.dart';
import 'package:flutter/material.dart';

class Lesson8 extends StatelessWidget {
  const Lesson8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MainDrawer(),
      body: Column(),
    );
  }
}

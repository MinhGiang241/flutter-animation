// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
      body: const Center(child: Text('Welcome')),
    );
  }
}

import 'dart:math';

import 'package:animation/animaion/drawer.dart';
import 'package:flutter/material.dart';

import 'lesson_1.dart';
import 'lesson_2.dart';
import 'lesson_3.dart';
import 'lesson_4.dart';
import 'lesson_5.dart';
import 'lesson_6.dart';
import 'lesson_7.dart';

class Lesson8 extends StatefulWidget {
  const Lesson8({super.key});

  @override
  State<Lesson8> createState() => _Lesson8State();
}

const data = [
  {"title": "lesson1", 'page': Lesson1()},
  {"title": "lesson2", 'page': Lesson2()},
  {"title": "lesson3", 'page': Lesson3()},
  {"title": "lesson4", 'page': Lesson4()},
  {"title": "lesson5", 'page': Lesson5()},
  {"title": "lesson6", 'page': Lesson6()},
  {"title": "lesson7", 'page': Lesson7()},
  {"title": "lesson8", 'page': Lesson8()},
];

class _Lesson8State extends State<Lesson8> with TickerProviderStateMixin {
  final Widget drawer = (Material(
    child: Container(
      color: Colors.cyan,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 100, top: 100),
        itemCount: 8,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]['title'] as String),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      data[index]['page'] as Widget,
                ),
              );
            },
          );
        },
      ),
    ),
  ));

  late AnimationController _xControllerForChild;
  late Animation<double> _yRotationAnimationForChild;

  late AnimationController _xControllerForDrawer;
  late Animation<double> _yRotationAnimationForDrawer;

  @override
  void initState() {
    super.initState();
    _xControllerForChild = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _yRotationAnimationForChild = Tween<double>(
      begin: 0,
      end: -pi / 2,
    ).animate(_xControllerForChild);

    _xControllerForDrawer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _yRotationAnimationForDrawer = Tween<double>(
      begin: pi / 2.7,
      end: 0,
    ).animate(_xControllerForDrawer);
  }

  @override
  void dispose() {
    _xControllerForChild.dispose();
    _xControllerForDrawer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxDrag = screenWidth * 0.8;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        final delta = details.delta.dx / maxDrag;
        _xControllerForChild.value += delta;
        _xControllerForDrawer.value += delta;
      },
      onHorizontalDragEnd: (details) {
        if (_xControllerForChild.value < 0.5) {
          _xControllerForChild.reverse();
          _xControllerForDrawer.reverse();
        } else {
          _xControllerForChild.forward();
          _xControllerForDrawer.forward();
        }
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _xControllerForChild,
          _xControllerForDrawer,
        ]),
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                color: const Color(0xFF1a1b26),
              ),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(_xControllerForChild.value * maxDrag)
                  ..rotateY(_yRotationAnimationForChild.value),
                child: const Scaffold(
                  backgroundColor: Colors.purpleAccent,
                  body: Center(child: Text('Hello')),
                ),
              ),
              Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(
                      -screenWidth + _xControllerForDrawer.value * maxDrag)
                  ..rotateY(_yRotationAnimationForDrawer.value),
                child: drawer,
              ),
            ],
          );
        },
      ),
    );
  }
}

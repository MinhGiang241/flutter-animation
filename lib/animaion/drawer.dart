import 'package:animation/animaion/lesson_6.dart';
import 'package:flutter/material.dart';

import 'lesson_1.dart';
import 'lesson_2.dart';
import 'lesson_3.dart';
import 'lesson_4.dart';
import 'lesson_5.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {"title": "lesson1", 'page': const Lesson1()},
      {"title": "lesson2", 'page': const Lesson2()},
      {"title": "lesson3", 'page': const Lesson3()},
      {"title": "lesson4", 'page': const Lesson4()},
      {"title": "lesson5", 'page': const Lesson5()},
      {"title": "lesson6", 'page': const Lesson6()},
    ];
    return Drawer(
      child: ListView(children: [
        const SizedBox(height: 30),
        ...data.map(
          (v) => ListTile(
            title: Text(v['title'] as String),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => v['page'] as Widget,
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}

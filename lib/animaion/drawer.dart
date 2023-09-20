import 'package:flutter/material.dart';

import 'lesson_1.dart';
import 'lesson_2.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {"title": "lesson1", 'page': const Lesson1()},
      {"title": "lesson2", 'page': const Lesson2()}
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

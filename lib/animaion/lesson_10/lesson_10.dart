import 'package:animation/animaion/drawer.dart';
import 'package:animation/animaion/lesson_10/screen_title.dart';
import 'package:animation/animaion/lesson_10/trip_list.dart';
import 'package:flutter/material.dart';

class Lesson10 extends StatelessWidget {
  const Lesson10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 10"),
      ),
      drawer: const MainDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://source.unsplash.com/random/1920x1080/?wallpaper,landscape'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft,
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(height: 160, child: ScreenTitle(text: 'Ninja Trips')),
            Flexible(child: TripList())
          ],
        ),
      ),
    );
  }
}

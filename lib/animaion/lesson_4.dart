import 'package:animation/animaion/drawer.dart';
import 'package:flutter/material.dart';

class Lesson4 extends StatelessWidget {
  const Lesson4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lesson 4'),
        ),
        drawer: const MainDrawer(),
        body: ListView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) {
              final person = people[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        person: person,
                      ),
                    ),
                  );
                },
                leading: Hero(
                    tag: person.name,
                    child: Text(person.emoji,
                        style: const TextStyle(fontSize: 40))),
                title: Text(
                  person.name,
                ),
                subtitle: Text('${person.age} years old'),
                trailing: const Icon(Icons.arrow_forward_ios),
              );
            }));
  }
}

const people = [
  Person(name: 'John', age: 20, emoji: '⛽'),
  Person(name: 'Jane', age: 21, emoji: '☔'),
  Person(name: 'Jack', age: 22, emoji: '🎅'),
];

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({
    required this.age,
    required this.name,
    required this.emoji,
  });
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.person, super.key});
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                // Maybe wrapp all by material with color is transparent
                return ScaleTransition(
                    scale: animation.drive(
                      Tween<double>(begin: 0.0, end: 2.0)
                          .chain(CurveTween(curve: Curves.fastOutSlowIn)),
                    ),
                    child: toHeroContext.widget);
              case HeroFlightDirection.pop:
                return fromHeroContext.widget;
              default:
                return toHeroContext.widget;
            }
          },
          tag: person.name,
          child: Material(
            color: Colors.transparent,
            child: Text(
              person.emoji,
              style: const TextStyle(fontSize: 50),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(person.name, style: const TextStyle(fontSize: 20)),
            Text('${person.age} years old',
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

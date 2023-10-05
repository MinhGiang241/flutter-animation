import 'package:animation/animaion/lesson_10/heart.dart';
import 'package:flutter/material.dart';
import 'package:ipsum/ipsum.dart';

import 'trip.dart';

class DetailsPage extends StatelessWidget {
  final Trip trip;
  DetailsPage({super.key, required this.trip});
  final Ipsum lip = Ipsum();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              child: Hero(
                tag: trip.id,
                child: Image.network(
                  trip.img,
                  height: 360,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text(
                trip.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[800]),
              ),
              subtitle: Text('${trip.night} night stay only \$${trip.price}',
                  style: const TextStyle(letterSpacing: 1)),
              trailing: const Heart(),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  lip.paragraphs(2),
                ),
              ),
            )
          ],
        ));
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import 'details_page.dart';
import 'trip.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  final List<Widget> _tripTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addTrips();
    });
  }

  void _addTrips() {
    List<Trip> _trips = [
      Trip(
          id: '1',
          title: 'Beach Paridise',
          price: '350',
          night: '3',
          img:
              'https://source.unsplash.com/random/1920x1080/?wallpaper,landscape'),
      Trip(
          id: '2',
          title: 'Beach Paridise',
          price: '350',
          night: '3',
          img:
              'https://source.unsplash.com/random/1920x1080/?wallpaper,landscape'),
      Trip(
          id: '3',
          title: 'Beach Paridise',
          price: '350',
          night: '3',
          img:
              'https://source.unsplash.com/random/1920x1080/?wallpaper,landscape'),
      Trip(
          id: '4',
          title: 'Beach Paridise',
          price: '350',
          night: '3',
          img:
              'https://source.unsplash.com/random/1920x1080/?wallpaper,landscape'),
    ];

    Future ft = Future(() {});

    for (var e in _trips) {
      ft = ft.then((_) {
        return Future.delayed(const Duration(milliseconds: 50), () {
          _tripTiles.add(_buildTile(e));
          _listKey.currentState!.insertItem(_tripTiles.length - 1);
        });
      });
    }
  }

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(trip: trip),
          ),
        );
      },
      contentPadding: const EdgeInsets.all(25),
      subtitle: Text(
        '${trip.night} nights',
        style: TextStyle(
            fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey[60]),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trip.title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[60]),
          )
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Hero(
          tag: trip.id,
          child: Image.network(
            trip.img,
            height: 50,
          ),
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }

  final Tween<Offset> _offset =
      Tween(begin: const Offset(1, 0), end: const Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _tripTiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(_offset),
          child: _tripTiles[index],
        );
      },
    );
  }
}

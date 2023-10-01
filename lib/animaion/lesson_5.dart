import 'package:animation/animaion/drawer.dart';
import 'package:flutter/material.dart';

class Lesson5 extends StatefulWidget {
  const Lesson5({super.key});

  @override
  State<Lesson5> createState() => _Lesson5State();
}

const double defaultWidth = 100;

class _Lesson5State extends State<Lesson5> {
  var _isZoomedIn = false;
  var _buttonTitle = 'Zoom In';
  double _width = defaultWidth;
  var _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const MainDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 370),
                curve: _curve,
                width: _width,
                child: SizedBox(
                  child: Image.network(
                      'https://source.unsplash.com/random/1920x1080/?wallpaper,landscape'),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isZoomedIn = !_isZoomedIn;
                    _buttonTitle = _isZoomedIn ? "Zoom Out" : "Zoom In";
                    _width = _isZoomedIn
                        ? MediaQuery.of(context).size.width
                        : defaultWidth;
                    _curve =
                        _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
                  });
                },
                child: Text(_buttonTitle),
              ),
            ],
          ),
        ));
  }
}

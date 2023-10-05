import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _curve;

  bool isFav = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);

    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 30,
            end: 50,
          ),
          weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 50,
            end: 30,
          ),
          weight: 50),
    ]).animate(_curve);

    _controller.addListener(() {});

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return IconButton(
          onPressed: () {
            if (isFav) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          icon: Icon(Icons.favorite,
              color: _colorAnimation.value, size: _sizeAnimation.value),
        );
      },
    );
  }
}

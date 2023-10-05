import 'package:animation/animaion/drawer.dart';
import 'package:flutter/material.dart';

class Lesson9 extends StatefulWidget {
  const Lesson9({super.key});

  @override
  State<Lesson9> createState() => _Lesson9State();
}

class _Lesson9State extends State<Lesson9> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconScaleAnimation;
  late Animation<double> _containerScaleAnimation;
  late Animation<Offset> _yAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _yAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.23),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _iconScaleAnimation = Tween<double>(
      begin: 7,
      end: 6,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));

    _containerScaleAnimation = Tween<double>(
      begin: 2.0,
      end: 0.4,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller
      ..reset()
      ..forward();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 9"),
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                minHeight: 100,
                maxHeight: MediaQuery.of(context).size.height * 0.8,
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 160,
                        ),
                        const Text(
                          "This is Title",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'This is subtitle',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: SlideTransition(
                      position: _yAnimation,
                      child: ScaleTransition(
                        scale: _containerScaleAnimation,
                        child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: ScaleTransition(
                                scale: _iconScaleAnimation,
                                child: const Icon(
                                  Icons.check,
                                ))),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

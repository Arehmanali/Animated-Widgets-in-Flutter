import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last/Components/image.dart';

class MyFadeTransition extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyFadeTransition>
    with SingleTickerProviderStateMixin {
  String title = 'Fade Transition';

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
    image = AssetImage(getImageLink());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final list = [blackWidow, venom, spiderMan, drStrange];
  int imageIndex = 0;

  String getImageLink() {
    String imageLink;
    imageLink = list[imageIndex];

    return imageLink;
  }

  late AssetImage image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: OutlinedButton(
        onPressed: () {
          setState(() {
            imageIndex++;
            if (imageIndex == list.length) {
              imageIndex = 0;
            }
            image = AssetImage(getImageLink());
          });
        },
        child: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Image(image: image, width: 300.0),
          ),
        ),
      ),
    );
  }
}

import 'package:last/Components/image.dart';
import 'package:flutter/material.dart';

final title = 'Positioned Transition';

class MyPositionTransition extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyPositionTransition>
    with SingleTickerProviderStateMixin {
  late Animation<RelativeRect> _animation;
  late AnimationController _controller;
  late Animation<double> _curve;
  //late RelativeRect _animationValue;
  //late AnimationStatus _state;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _curve = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _animation = RelativeRectTween(
            begin: RelativeRect.fromLTRB(200.0, 200.0, 200.0, 200.0),
            end: RelativeRect.fromLTRB(20.0, 20.0, 20.0, 20.0))
        .animate(_curve)
          ..addListener(() {})
          ..addStatusListener((AnimationStatus state) {
            if (state == AnimationStatus.completed) {
              _controller.reverse();
            } else if (state == AnimationStatus.dismissed) {
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
      body: Stack(
        children: [
          AnimatorTransition(
            animation: _animation,
            child: Image(
              height: 300,
              width: 300,
              image: AssetImage(spiderMan),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatorTransition extends StatelessWidget {
  final Widget child;
  final Animation<RelativeRect> animation;

  AnimatorTransition({required this.child, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedTransition(rect: animation, child: this.child),
      ],
    );
  }
}

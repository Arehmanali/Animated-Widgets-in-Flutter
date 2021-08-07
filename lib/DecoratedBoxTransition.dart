import 'package:flutter/material.dart';
import 'package:last/Components/image.dart';

/// This is the stateful widget that the main application instantiates.
class MyDecoratedBox extends StatefulWidget {
  const MyDecoratedBox({Key? key}) : super(key: key);

  @override
  State<MyDecoratedBox> createState() => _DecoratedBoxTransitionState();
}

class _DecoratedBoxTransitionState extends State<MyDecoratedBox>
    with TickerProviderStateMixin {
  String title = 'DecorateBoxTransition';

  DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.white,
      border:
          Border.all(color: Colors.grey, style: BorderStyle.solid, width: 8.0),
      borderRadius: BorderRadius.zero,
      shape: BoxShape.rectangle,
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black, blurRadius: 14.0, spreadRadius: 8.0)
      ],
    ),
    end: BoxDecoration(
      color: Colors.grey,
      border: Border.all(
          color: Colors.orange, style: BorderStyle.solid, width: 4.0),
      borderRadius: BorderRadius.circular(8.0),
      shape: BoxShape.rectangle,
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black, blurRadius: 2.0, spreadRadius: 2.0)
      ],
    ),
  );

  late AnimationController _controller;
  bool _transit = true;

  final list = [blackWidow, spiderMan, drStrange, venom];
  int imageIndex = 0;
  late AssetImage image;

  String getImageLink() {
    String imageLink;
    imageLink = list[imageIndex];

    return imageLink;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    image = AssetImage(getImageLink());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      //drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DecoratedBoxTransition(
              position: DecorationPosition.background,
              decoration: _decorationTween.animate(_controller),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    imageIndex++;
                    if (imageIndex == list.length) {
                      imageIndex = 0;
                    }
                    image = AssetImage(getImageLink());
                  });
                },
                child: Container(
                  width: 300.0,
                  height: 180.0,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Image(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  if (_transit) {
                    _controller.forward();
                    _controller.isCompleted;
                  } else if (_controller.isCompleted) {
                    _controller.reverse();
                  }
                  _transit = !_transit;
                },
                elevation: 0.0,
                child: Icon(Icons.play_arrow, color: Colors.white, size: 36.0),
                tooltip: 'Play',
                heroTag: 'Transit',
                backgroundColor: Color(0xFF832685),
              ),
            )
          ],
        ),
      ),
    );
  }
}

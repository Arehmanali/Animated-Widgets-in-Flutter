import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:last/DecoratedBoxTransition.dart';
import 'package:last/FadeTransition.dart';
import 'package:last/Hero.dart';
import 'package:last/PositionTransition.dart';
import 'package:last/mainDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Good Bye Assignment';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.blue, // status bar color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        //'/': (context) => const MyHomePage(title: '',),
        '/DecoratedBoxTransition': (context) => MyDecoratedBox(),
        '/FadeTransition': (context) => MyFadeTransition(),
        '/Hero': (context) => MyHero(),
        '/PositionBox': (context) => MyPositionTransition(),
      },
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: ProfileCard(),
    );
  }
}

class ProfileCard extends StatelessWidget {
  ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/success.jpg'),
            width: 400,
          ),
          Text(
            "Time to Say GoodBye!",
            style: TextStyle(fontSize: 40, color: Colors.deepOrange),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "This Application is a part of my flutter learning pathway. " +
                  "In this Appliction, I have used different animated widgets " +
                  "like DecoratedBoxTransition, FadeTransition, Hero and PositionTransition",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

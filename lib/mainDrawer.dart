import 'package:flutter/material.dart';
import 'package:last/FadeTransition.dart';
import 'package:last/Hero.dart';
import 'package:last/PositionTransition.dart';
import 'package:last/main.dart';
import 'DecoratedBoxTransition.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.all(0.0),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(0.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        UserAccountsDrawerHeader(
                          accountName: Text(
                            "Rehman Ali",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          accountEmail: Text("merehmanali@gmail.com"),
                          currentAccountPicture: CircleAvatar(
                            backgroundColor: Colors.blue,
                            backgroundImage: NetworkImage(
                                'https://avatars.githubusercontent.com/u/55204040?v=4'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.deepOrange,
                    size: 30,
                  ),
                  title: const Text(
                    "Home",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepOrange,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                ),
                Divider(
                  thickness: 5,
                  color: Colors.deepOrange,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.select_all,
                    color: Colors.deepOrange,
                    size: 30,
                  ),
                  title: const Text(
                    "DecoratedBoxTransition",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.deepOrange,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyDecoratedBox(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.select_all,
                    color: Colors.deepOrange,
                    size: 30,
                  ),
                  title: const Text(
                    "FadeTransition",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepOrange,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyFadeTransition(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.select_all,
                    color: Colors.deepOrange,
                    size: 30,
                  ),
                  title: const Text(
                    "Hero",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepOrange,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyHero(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.select_all,
                    color: Colors.deepOrange,
                    size: 30,
                  ),
                  title: const Text(
                    "Position Transition",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepOrange,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyPositionTransition(),
                      ),
                    );
                  },
                ),
                Divider(
                  thickness: 3,
                  color: Colors.deepOrange,
                ),
                ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.deepOrange,
                    size: 30,
                  ),
                  title: Text(
                    "Help",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepOrange,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.deepOrange,
                    size: 30,
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepOrange,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.deepOrange,
                    size: 30,
                  ),
                  title: Text(
                    "logout",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepOrange,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

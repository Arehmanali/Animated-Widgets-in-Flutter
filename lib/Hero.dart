import 'package:flutter/material.dart';
import 'detailPage.dart';

class MyHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Transitions"),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: ClipOval(
              child: Hero(
                tag: "avatar-$index",
                child: Image.network("https://picsum.photos/seed/$index/800"),
              ),
            ),
          ),
          title: Text("Item #$index"),
          onTap: () => _openDetail(context, index),
        );
      }),
    );
  }

  _openDetail(context, index) {
    final route = MaterialPageRoute(
      builder: (context) => DetailPage(index: index),
    );
    Navigator.push(context, route);
  }
}





































/*class MyHero extends StatelessWidget {
  const MyHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hero Transition',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          ),
        ),
        title: const Text(
          'Hero Transition',
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const DetailScreen();
          }));
        },
        child: Padding(
          padding: EdgeInsets.only(left: 120),
          child: Row(
            children: [
              Column(
                children: [
                  Hero(
                    tag: 'blackWidow',
                    child: Image.asset(
                      'assets/images/blackWidow.jpeg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Hero(
                    tag: 'drStrange',
                    child: Image.asset(
                      'assets/images/drStrange.jpg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Hero(
                    tag: 'spiderMan',
                    child: Image.asset(
                      'assets/images/spiderMan.jpg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Hero(
                    tag: 'venom',
                    child: Image.asset(
                      'assets/images/venom.jpg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHero()),
          ),
        ),
        title: const Text(
          'Zoomed Image',
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'blackWidow',
            child: Image.asset(
              'assets/images/blackWidow.jpeg',
              width: 400,
              height: 400,
            ),
          ),
        ),
      ),
    );
  }
}
*/

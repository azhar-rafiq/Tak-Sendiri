import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:sleeping_koala/chatbot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tak Sendiri',
      theme: ThemeData(
        fontFamily: 'MavenPro',
        colorScheme: ColorScheme.fromSwatch(
            backgroundColor: Color.fromARGB(255, 58, 58, 126),
            primaryColorDark: Color.fromARGB(255, 55, 47, 139),
            cardColor: Color.fromARGB(255, 118, 107, 230),
            accentColor: Color.fromARGB(255, 119, 76, 175)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tak Sendiri'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Image.asset('images/logo.png',
                color: Color.fromRGBO(255, 255, 255, 0.5),
                colorBlendMode: BlendMode.modulate,
                height: 145,
                width: 145),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Kamu tidak sendiri",
              style: TextStyle(
                  // backgroundColor: Color.fromRGBO(74, 57, 119, 0.494),
                  color: Colors.white,
                  fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, left: 30, right: 30),
            child: Text(
              "Semua perasaan kamu nyata dan kita menerima perasaanmu.",
              style: TextStyle(
                  // backgroundColor: Color.fromRGBO(74, 57, 119, 0.494),
                  color: Colors.white,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      padding: EdgeInsets.only(top: 40, bottom: 40),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          tileMode: TileMode.decal,
                          colors: <Color>[
                            Color.fromARGB(255, 255, 255, 255),
                            Color.fromARGB(255, 200, 201, 232),
                            Color.fromARGB(255, 174, 157, 169),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 50, 22, 100),
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 22),
                    ),
                    onPressed: () {
                      _pushPage(context, chatbot());
                    },
                    child: const Text(
                      '▶️ Mulai Chat',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 92, 51, 124),
        currentIndex: screenIndex,
        onTap: clickBottomNav,
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              Icons.play_circle_filled,
            ),
            title: Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.settings,
            ),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }

  void clickBottomNav(int index) {
    setState(() {
      screenIndex = index;
    });
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrueApp(),
    );
  }
}

class TrueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer app"),
      ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Ttem 1"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Test(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Item 2"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Test2(),
                  ),
                );
              },
            ),
          ],
        ),
      ), //this will just add the Navigation Drawer Icon
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.green,
    );
  }
}

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(),
      backgroundColor: Colors.red,
    );
  }
}

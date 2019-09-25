import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Main(title: 'Flutter Demo Home Page'),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _activeScreen = 0;
  int _counter = 0;

  void _setActiveScreen(int index) {
    print('index $index');
    setState(() {
      _activeScreen = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomePage(
        counter: _counter,
        increment: _incrementCounter,
      ),
      Stats(
        counter: _counter,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: screens[_activeScreen],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_upward), title: Text('Stats')),
        ],
        currentIndex: _activeScreen,
        onTap: _setActiveScreen,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final int counter;
  final Function increment;

  const HomePage({Key key, this.counter, this.increment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$counter',
            style: Theme.of(context).textTheme.display1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text(
                'Inc',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: increment,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
  }
}

class Stats extends StatelessWidget {
  final int counter;

  const Stats({Key key, this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text('$counter'), Text('Stats')],
      )),
    );
  }
}

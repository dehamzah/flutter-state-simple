import 'package:flutter/material.dart';
import 'counter_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() => runApp(MyApp());

final counter = Counter();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(title: 'Flutter Demo Home Page'),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _activeScreen = 0;

  void _setActiveScreen(int index) {
    setState(() {
      _activeScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [HomePage(), Stats()];

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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Observer(
              builder: (_) => Text(
                    '${counter.counter}',
                    style: Theme.of(context).textTheme.display1,
                  )),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text(
                  'Inc',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: counter.increment,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(builder: (BuildContext context) {
            return Text(
              '${counter.counter}',
              style: TextStyle(fontSize: 20),
            );
          }),
          Text('Stats')
        ],
      )),
    );
  }
}

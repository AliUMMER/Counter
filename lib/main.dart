import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
    });
    prefs.setInt('counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Counter')),
      body: Column(
        children: [
          Center(
            child: Text('Counter: $_counter', style: TextStyle(fontSize: 24)),
          ),
          SizedBox(
            height: 450,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    removePreference();
                  },
                  child: Text('Remove'))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }

  void removePreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear the preferences
    setState(() {
      _counter = 0; // Reset the counter to 0 and update UI immediately
    });
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'My Fancy Flutter App';
    return MaterialApp(
      title: title,
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: MyBody(),
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  QuestionWidget(this._question);

  final _question;

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState(_question);
}

class _QuestionWidgetState extends State<QuestionWidget> {
  _QuestionWidgetState(this._question);

  final _question;

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    var newColor = _count > 0 ? Colors.green : Colors.black;
    return Row(
      children: [
        Expanded(
            child: Text(
              _question,
              style: TextStyle(
                  fontSize: 20.0, color: newColor),
            )),
        FlatButton(
          onPressed: _updateCount,
          color: newColor,
          child: Text('$_count'),
        ),
      ],
    );
  }

  void _updateCount() {
    setState(() {
      // TODO log changes
      _count = _count + 1;
      if (_count > 10) _count = 0;
    });
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = Center(
      child: Text('Some title',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          )),
    );

    var questions = Table(
      children: [
        TableRow(children: [
          QuestionWidget('Question 1'),
        ]),
        TableRow(children: [
          QuestionWidget('Question 2'),
        ])
      ],
    );

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [title, questions],
      ),
    );
  }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the fancy button thithithithis many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.android),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

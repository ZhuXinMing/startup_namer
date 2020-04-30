//import 'dart:html';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//void main() => runApp(MyApp6());

void main() {
  ShoppingCart cart = ShoppingCart();
  print(cart.total);
  return runApp(MyApp6());
}

///dart语言特性例子
///
/*
void setData()
{
  final aListOfStrings = ['one', 'two', 'three'];
  final aSetOfStrings = {'one', 'two', 'three'};
  final aMapOfStringsToInts = {
    'one': 1,
    'two': 2,
    'three': 3,
  };
}
*/

/*
String upperCaseIt(String str) {
  return str?.toUpperCase();
}
*/

/*
class Test {
  String title;
  int age;
  String sex;

  Test(this.title, this.age, {this.sex});

  @override
  String toString() {
    print('Test{title: $title, age: $age, sex: $sex}');
    return 'Test{title: $title, age: $age, sex: $sex}';
  }
  void test() {
    print('test');
  }
}
*/

/*
class BigObject {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;

  void allDone() {
    _done = true;
  }

  BigObject fillBigObject(BigObject obj) {
    return obj
      ..anInt = 1
      ..aString = 'String1'
      ..aList = [3.0]
      ..allDone();
  }
}
*/

/*
class MyClass {

  int _aProperty = 0;

  int get aProperty => _aProperty;

  set aProperty(int value) {
    if (value >= 0) {
      _aProperty = value;
    }
  }
}
*/

/*
class MyClass {

  List<int> _values = [];

  void addValue(int value) {
    _values.add(value);
  }

  int get count {
    return _values.length;
  }
}
*/
class InvalidPriceException {}

class ShoppingCart {
  List<double> _prices = [1.2, 3.5];

  // Add a "total" getter here:
  double get total {
    return _prices.fold(0, (e, t) => e + t);
  }

  // Add a "prices" setter here:
  set prices(List<double> value) {
    if (value.any((p) => p < 0)) {
      throw InvalidPriceException();
    }
    _prices = value;
  }
}

/////////////////////////////////----UI--////

//例如1

//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context){
//    return MaterialApp(
//      title: 'Welcome to Flutter1',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcom to Flutter2'),
//        ),
//        body: Center(
//          child: Text('hello world'),
//        ),
//      ),
//    );
//  }
//}

//例如2

//class MyApp2 extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    final wordPair = WordPair.random();
//    return MaterialApp(
//      title: 'Welcome to Flutter1',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcom to Flutter3'),
//        ),
//        body:Center(
//          child:Text(wordPair.asPascalCase),
//        ),
//      ),
//    );
//  }
//}

//例如3

//class MyApp3 extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//
//    return MaterialApp(
//      title: 'Welcome to Flutter1',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcom to Flutter3'),
//        ),
//        body:Center(
//          child:RandomWords(),
//        ),
//      ),
//    );
//  }
//}

//class RandomWords extends StatefulWidget{
//  @override
//  RandomWordsState createState() => RandomWordsState();
//}
//
//class RandomWordsState extends State<RandomWords> {
//  // TODO Add build() method
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    final wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);
//  }
//}
//

//例如4
/*
class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}


//在RandomWordsState类中，将build()方法更新为使用_buildSuggestions()，而不是直接调用单词生成库。
class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Startup Name Generator',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26),
        ),
      ),
      body: _buildSuggestions(),
    );
  }

//  该_buildSuggestions()函数_buildRow()每个单词对调用一次。此功能在中显示每个新对ListTile，
//  这使您可以在下一步中使行更具吸引力。
Widget _buildSuggestions(){
  return ListView.builder(
    padding: const EdgeInsets.all(16.0),
//该itemBuilder回调被称为每个提示词配对一次，每个建议放入一ListTile排。对于偶数行，
// 该函数ListTile为单词配对添加一行。对于奇数行，该函数添加了一个Divider小部件以在视觉上分隔条目。
// 请注意，在较小的设备上可能很难看到分频器。
      itemBuilder: (context,i){

//    在中的每一行之前添加一个高一个像素的分隔器小部件ListView。
      if (i.isOdd) return Divider();
//    该表达式i ~/ 2除以i2，然后返回整数结果。例如：1、2、3、4、5变为0、1、1、2、2。
//    这将计算ListView减去减号控件的实际单词配对数。
      final index = i ~/ 2;
      if (index >= _suggestions.length){
//        如果您已达到可用单词配对的末尾，请再生成10个单词对并将其添加到建议列表中。
        _suggestions.addAll(generateWordPairs().take(10)); /*4*/
      }
      return _buildRow(_suggestions[index]);
  });
}

Widget _buildRow(WordPair pair){
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}
}

class MyApp4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}
*/

////// 例如 5
/*
class MyApp5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ) ,
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage  extends StatefulWidget{
  SampleAppPage({Key key}) :super(key: key);
  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage>{

  String textToShow = "I Like Flutter";

  void _updateText(){
    setState(() {
      textToShow = "Flutter is Awesome!";
    });
  }
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(child: Text(textToShow)),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}
*/

/// 例如6
///

class MyApp6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SampleAppPageState();
  }
}

class _SampleAppPageState extends State<SampleAppPage> {
  String textToShow = "I Like Flutter";
  int _pressedCount = 0;

  void _add() {
    setState(() {
      _pressedCount += 1;
      textToShow = "Flutter is Awesome!";
      var result = fibonacci(20);
      print(result);
      var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
      voyager..describe();
      var voyager3 = Spacecraft.initMethod('Voyager III');
      voyager3.describe();
    });
  }

  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SampleApp2'),
      ),
      body: Center(child: Text(textToShow + _pressedCount.toString())),
      floatingActionButton: CupertinoButton(
        child: Text('点击'),
        onPressed: _add,
        padding: EdgeInsets.only(left: 10.0, right: 10),
        color: Colors.blue,
      ),
    );
  }
}

class Spacecraft {
  String name;
  DateTime launchDate;

  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.initMethod(String name) : this(name, null);

  int get launchYear => launchDate?.year;

  void describe() {
    print('Spacecraft:$name');
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched:$launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft {
  num altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
}

class Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

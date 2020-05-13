import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';

//void main() => runApp(MyApp6());

void main() {
//  ShoppingCart cart = ShoppingCart();
//  print(cart.total);
  return runApp(MyApp7());
}

/////////////////////////////////----UI--////

//例如1:无状态小部件
//a.这个示例创建了一个Material应用程序。Material是一种可视设计语言，在移动和web上都是标准的。Flutter提供了一套丰富的Material widgets（材料小部件）。
//b.该应用程序扩展了StatelessWidget，使应用程序本身成为一个小部件。在Flutter中，几乎所有东西都是小部件，包括对齐、填充和布局。
//c.来自Material library库的Scaffold widget小部件提供了一个默认的应用程序栏、标题和一个body属性，该属性用于保存主屏幕的小部件树。小部件子树可能非常复杂。
//d.小部件的主要工作是提供一个build()方法，该方法描述如何根据其他较低级别的小部件显示小部件。
//e.本例的主体由一个包含文本子小部件的Center小部件组成。Center小部件将其小部件子树对齐到屏幕的中心。
//
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context){
//    return MaterialApp(
//      title: 'Welcome to Flutter1',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcome to Flutter2'),
//        ),
//        body: Center(
//          child: Text('hello world'),
//        ),
//      ),
//    );
//  }
//}

//例如2:无状态小部件:使用外部包
//使用一个名为english_words的开源包，它包含几千个最常用的英语单词和一些实用函数。
//您可以在pub.dev上找到english_words包，以及许多其他开放源码包。
//pubspec.yaml文件在pubspec中管理Flutter应用程序的assets资产和依赖项。在pubspec.yaml，将english_words(3.1.5或更高)添加到依赖项列表中:

/*
class MyApp2 extends StatelessWidget{

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter3'),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
*/

//例如3:添加一个有状态的小部件
//有状态的小部件维护可能在小部件的生命周期内更改的状态。实现一个有状态的小部件至少需要两个类:
//1)创建一个状态类实例的StatefulWidget类
//2)一个State类。状态小部件类本身是不可变的，但是状态类在小部件的生命周期内持续存在。

//添加一个有状态小部件RandomWords，它将创建其状态类RandomWordsState。
//然后，您将在现有的MyApp无状态小部件中使用RandomWords作为子元素。

/*
class MyApp3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Welcome to Flutter1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter2'),
        ),
        body:Center(
          child:RandomWords(),
        ),
      ),
    );
  }
}

//它将创建其状态类RandomWordsState
class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}


class RandomWordsState extends State<RandomWords> {
  // TODO Add build() method
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}
*/

//例如4 Create an infinite scrolling ListView 创建一个无限滚动的列表视图

/*
//它将创建其状态类RandomWordsState
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

///例如 5  How do I update widgets?
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
        title: Text("App"),
      ),
      body: Center(child: Text(textToShow),),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        child: Icon(Icons.update),
      ),
    );
  }
}
*/

/// 例如6：How do I lay out my widgets? Where is my Storyboard?
///
/*
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

  void _addAction() {
    setState(() {
      _pressedCount += 1;
      textToShow = "pressedCount";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SampleApp2'),
      ),
      body: Center(
          child: Text(textToShow + _pressedCount.toString())
      ),


      floatingActionButton:CupertinoButton(

        child: Text('点击'),
        onPressed:_addAction,
        padding: EdgeInsets.only(left: 20.0, right: 20),
        color:Colors.blue,
      ),
    );
  }
}
*/

/// 例7：如何从布局中添加或删除组件?

class MyApp7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage7(),
    );
  }
}

class SampleAppPage7 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SampleAppPageState7();
  }
}

class _SampleAppPageState7 extends State {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return CupertinoButton(
        child: Text('Toggle Two'),
        onPressed: () {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}

//      var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
//      voyager..describe();
//      var voyager3 = Spacecraft.initMethod('Voyager III');
//      voyager3.describe();
//
//class _SampleAppPageState extends State<SampleAppPage> {
//  String textToShow = "I Like Flutter";
//  int _pressedCount = 0;
//
//  void _add() {
//    setState(() {
//      _pressedCount += 1;
//      textToShow = "Flutter is Awesome!";
//      var result = fibonacci(20);
//      print(result);
//    });
//  }
//
//  int fibonacci(int n) {
//    if (n == 0 || n == 1) return n;
//    return fibonacci(n - 1) + fibonacci(n - 2);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('SampleApp2'),
//      ),
//      body: Center(child: Text(textToShow + _pressedCount.toString())),
//      floatingActionButton: CupertinoButton(
//        child: Text('点击'),
//        onPressed: _add,
//        padding: EdgeInsets.only(left: 10.0, right: 10),
//        color: Colors.blue,
//      ),
//    );
//  }
//}
//*/

// 例如7：flutter跳原生页面

/*
class MyApp7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: '113'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

/*<与原生交互信号通道 >*/
const methodChannel = const MethodChannel('flutter_to_native');

class _MyHomePageState extends State<MyHomePage> {

  //封装 Flutter 向 原生中 发送消息 的方法
  //method 为方法标识
  //arguments 为参数

  // 单个参数
  static Future<dynamic> tokNative(String method,{Map arguments}) async{

      if(arguments == null)
      {
          return await methodChannel.invokeMethod(method);
      }else
        {
          return await methodChannel.invokeMethod(method,arguments);
        }
  }

  // 调用多个参数
  static Future<dynamic> goNativeWithValue(String methodName,
      [Map<String, dynamic> map]) async {
    if (null == map) {
      //无参数
      dynamic future =
      await methodChannel.invokeMethod(methodName); //methodName方法名
      return future;
    } else {
      //带有参数
      dynamic future = await methodChannel.invokeMethod(methodName, map);
      return future;
    }
  }

var params = {
  'token':'1234567',
  'expressDate': '00:00:00',
};
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new ListTile(
              title: new Text('flutter与原生交互,push'),
              trailing: FlatButton(onPressed:() {

                  goNativeWithValue('flutter_goToNative_Test',params)
                ..then((result){
                  print('$result');
                });
                  print('push操作');
              }, child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              )),
            ),

            new ListTile(
              title: new Text('flutter与原生交互,present'),
              trailing: FlatButton(onPressed: (){
                tokNative('flutter_goToNative_Test_Present')
                  ..then((result){
                    print('$result');
                  });
                    print('present操作');
                  }, child: Icon(
                  Icons.arrow_forward_ios,
                  size:20,
                  )),
            )
            ],
        ),
      ),
    );
  }
}
*/

/*
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
*/

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

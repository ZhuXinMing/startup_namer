import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ListViewDemoController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewDemoController"),
      ),
      body: HomeContent3(),
    );
  }
}

class HomeContent0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        ListTile(
          title: Text(
              "你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
          subtitle: Text(
              "教程前14讲是Dart基础，第15讲开始讲的是Flutter。你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
        ),
        ListTile(
          title: Text("你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
          subtitle: Text(
              "教程前14讲是Dart基础，第15讲开始讲的是Flutter。你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
          isThreeLine: true, //不起作用
        ),
        ListTile(
          title: Text("你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
          subtitle: Text(
              "教程前14讲是Dart基础，第15讲开始讲的是Flutter。你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
        ),
        ListTile(
          title: Text("你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
          subtitle: Text(
              "教程前14讲是Dart基础，第15讲开始讲的是Flutter。你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
        ),
        ListTile(
          title: Text("你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
          subtitle: Text(
              "教程前14讲是Dart基础，第15讲开始讲的是Flutter。你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
        ),
        ListTile(
          title: Text("你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
          subtitle: Text(
              "教程前14讲是Dart基础，第15讲开始讲的是Flutter。你首先必须得会Dart。此教程由IT营大地老师录制，更新于2020年。"),
        ),
      ],
    );
  }
}

//默认构造函数
class HomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(8),
      children: [
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(
            child: Text('Entry A'),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(
            child: Text('Entry B'),
          ),
        ),
        Divider(),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(
            child: Text('Entry C'),
          ),
        ),
      ],
    );
  }
}

//惰性构造函数；
class HomeContent2 extends StatelessWidget {

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      reverse: false,
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Center(
            child: Text('Entry ${entries[index]}'),
          ),
        );
      },
    );
  }
}

//（3）[ListView.separated]构造函数：采用两个[IndexedWidgetBuilder]: ' itemBuilder '根据需要构建cell，'
// separatorBuilder '类似地构建分隔符子项目（比如分割线widget），
// 分隔符子项目出现在cell之间。此构造函数适用于子视图数量固定的列表视图。
class HomeContent3 extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      scrollDirection: Axis.vertical,
      reverse: false,
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Center(
            child: Text('Entry ${entries[index]}'),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 2,),
    );
  }
}

//使用自定义子模型创建可滚动的线性小部件数组。

//这个[ListView]使用一个自定义的[SliverChildBuilderDelegate]来支持子排序。
/*
class HomeContent4 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeContent4State();
  }
}


class HomeContent4State extends State<HomeContent4>
{
  List<String> items = <String>['1', '2', '3', '4', '5'];

  void _reverse(){
      setState(() {
        items = items.reversed.toList();
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ListView.custom(
            itemExtent: 40.0,
            childrenDelegate:SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return KeepAlive(
//                      keepAlive: null, child: null
                  );
                },
              childCount: items.length,
              findChildIndexCallback: (Key key){
                  final ValueKey valueKey = key;
                  final String data = valueKey.value;
                  return items.indexOf(data);
              }
            ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(onPressed: ()=>_reverse(), child: Text('Reverse items')),
          ],
        ),
      ),
    );
  }
}
*/

//ListTile 内容
/*
class HomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Card(
          color: Colors.blue,
          child: ListTile(
            title: Text("One-line ListTile"),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text("One-line with leading widget"),
          ),
        ),
        Card(
          child: ListTile(
            trailing: Icon(Icons.more_vert),
            title: Text("One-line with trailing widget"),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text('One-line with both widgets'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('One-line dense ListTile'),
            dense: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Two-line ListTile'),
            subtitle: Text('Here is a second line'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text('Three-line ListTile'),
            subtitle: Text('A sufficiently long subtitle warrants three lines.'
                'A sufficiently long subtitle warrants three lines.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
      ],
    );
  }
}
*/

//Card
/*
class HomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.，'
                  'Music by Julie Gable. Lyrics by Sidney Stein'
                  ".Music by Julie Gable. Lyrics by Sidney Stein."),
            ),
            ButtonBar(
              children: [
                FlatButton(onPressed: () {}, child: const Text('Buy Tickets')),
                FlatButton(
                  onPressed: () {},
                  child: const Text('LISTEN'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: (){
            print('Card tapped.');
          },
          child: Container(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
      ),
    );
  }
}
*/

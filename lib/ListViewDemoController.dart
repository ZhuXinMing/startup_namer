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

class HomeContent2 extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

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

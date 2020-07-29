///
///   @Name    : startup_namer/ date_time_demo
///   @author  : simon
///   @date    : 2020/7/2 11:23 AM
///   @desc    :
///   @version : 1.0
///

import 'package:flutter/material.dart';

class DateTimeDemo extends StatelessWidget {
  final String title;
  DateTimeDemo({
    Key key,
    this.title = 'DateTime页面',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: _DemoPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class _DemoPage extends StatefulWidget {
  @override
//  State<StatefulWidget> createState()=>_DemoState();
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DemoState();
  }
}

class _DemoState extends State<_DemoPage> {

  var dateTime =  _DateTime();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}


class _DateTime{

  var now = new DateTime.now();

}
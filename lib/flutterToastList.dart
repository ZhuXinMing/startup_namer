
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class FlutterToastPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text('FlutterToastDemo'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pop(context);
          },
      ),
      body: FlutterToastPageWidget(),
    );
  }
}

class FlutterToastPageWidget extends StatefulWidget{

  FlutterToastPageWidget({Key key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ToastPageListState();
  }
}

//只是个简单的view展示。不会阻塞页面上其它按钮事件
class ToastPageListState extends State<FlutterToastPageWidget>{

  void showLongToast(){
    Fluttertoast.showToast(
        msg: "This is Long Toast,This is Long Toast,This is Long Toast,This is Long Toast",
        toastLength: Toast.LENGTH_LONG,
    );
  }

  void showShortToast() {
    Fluttertoast.showToast(
        msg: "This is Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1);
  }

  void showTopShortToast() {
    Fluttertoast.showToast(
        msg: "This is Top Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1);
  }
  void showCenterShortToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  void showColoredToast() {
    Fluttertoast.showToast(
        msg: "This is Colored Toast with android duration of 5 Sec",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  void showWebColoredToast() {

    Fluttertoast.showToast(
      msg: "This is Colored Toast with android duration of 5 Sec",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      webBgColor: "#F5F5F5",
      timeInSecForIosWeb: 10,
    );
  }

  void cancelToast() {
    Fluttertoast.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Center(
       child: Column(
         children: <Widget>[
           RaisedButton(
               onPressed:showLongToast,
             child: new Text('Show'),
           ),
           RaisedButton(
             onPressed:showShortToast,
             child: new Text('Show Short Toast'),
           ),
           RaisedButton(
             onPressed:showTopShortToast,
             child: new Text('Show Top Short Toast'),
           ),
           RaisedButton(
             onPressed:showCenterShortToast,
             child: new Text('Show Center Short Toast'),
             padding: EdgeInsets.all(15.0),
           ),
           RaisedButton(
             onPressed:showColoredToast,
             child: new Text('Show Colored Toast'),
           ),
           new Padding(
             padding: const EdgeInsets.all(10.0),
             child: new RaisedButton(
                 child: new Text('Show  Web Colored Toast'),
                 onPressed: showWebColoredToast),
           ),
           new Padding(
             padding: const EdgeInsets.all(10.0),
             child: new RaisedButton(
               child: new Text('Cancel Toasts'),
               onPressed: cancelToast,
             ),
           ),
         ],

       ),
     );
  }
}

import 'package:flutter/material.dart';
import 'TextField.dart';

class FlutterTextFieldDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("表单Demo"),
      ),
     body: FlutterTextFieldDemePage(),
    );
  }
}

class FlutterTextFieldDemePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FlutterTextFieldDemeState();
  }
}

class _FlutterTextFieldDemeState extends State<FlutterTextFieldDemePage>{

  _textFieldDemo(){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return  TextFieldDemoPage();
    }));
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _textFieldDemo,
              child: Text('textFieldDemo'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('select弹出框-SimpleDialog'),
//              onPressed: _showSimpleDialog,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
//              onPressed: _presentModelBottomSheet,
              child: Text('ActionSheet底部弹出框-_modelBottomSheet'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
//              onPressed: _pushToastView,
              child: Text('toast-fluttertoast第三方库'),
            ),
          ],
        ),
      ),
    );
  }
}
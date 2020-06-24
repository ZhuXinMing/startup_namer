import 'package:flutter/material.dart';
import 'flutterToastList.dart';
import 'Compents/MyDialog.dart';
import 'Compents/SelectItemDialog.dart';
import 'Compents/InputSeveralDialog.dart';

class DialogPage extends StatelessWidget {
  final String title;
  int customSelectIndex = -1;
  DialogPage({
    Key key,
    this.title = 'Dialog页面',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: DialogPageWidget(customSelectIndex: customSelectIndex,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class DialogPageWidget extends StatefulWidget {

  int customSelectIndex;
  DialogPageWidget({Key key,this.customSelectIndex}) : super(key: key);

  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPageWidget> {



//AlertDialog
  _showAlertDialog() async {
    var result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('您确定要删除吗？'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                print("取消");
                //pop的时候传值。
                Navigator.pop(context, "取消");
              },
              child: Text("取消"),
            ),
            FlatButton(
              onPressed: () {
                print("确定");
                //pop的时候传值。
                Navigator.pop(context, "确定");
              },
              child: Text("确定"),
            ),
          ],
        );
      },
    );
    print("result= $result");
  }

// SimpleDialog

  _showSimpleDialog() async {
    var result = showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('选择内容'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Option A'),
              onPressed: () {
                Navigator.pop(context, "Option A");
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('Option B'),
              onPressed: () {
                Navigator.pop(context, "Option B");
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('Option C'),
              onPressed: () {
                Navigator.pop(context, "Option C");
              },
            ),
            Divider(),
          ],
        );
      },
    );
    print("result= $result");
  }

  //BottomSheet
  _presentModelBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          //可以设置返回的widget的高度，默认很高，但是也不能太小，太小会导致内容显示不下。
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('微信分享'),
                  onTap: () {
                    Navigator.pop(context, 0);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('QQ分享'),
                  onTap: () {
                    Navigator.pop(context, 1);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('新浪微博分享'),
                  onTap: () {
                    Navigator.pop(context, 2);
                  },
                ),
              ],
            ),
          );
        });
    print("result= $result");
  }

  @override
  initState() {
    super.initState();
  }

  //跳转到flutterToast第三方展示页面
  _pushToastView() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return FlutterToastPage();
    }));
  }

  //显示自定义Dialog
  showCustomDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return MyDialog(
            title: "加工类型",
            content: "我是内容， Navigator.pop(context),Navigator.pop(context)",
          );
        });
  }

  showCustomDialog2() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return  SelectItemDialog(
            title: "加工类型2",
            titleArray: ["全部1", "标记1", "非标2"],
            selectIndex: widget.customSelectIndex,
            onConfirmListener: (selectIndex) {
              widget.customSelectIndex = selectIndex;
              print('selectIndex=$selectIndex');
            },
          );;
        });
  }

  showCustomInputDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return  InputSeveralDialog(title: "11", onConfirmListener: (text){
            print("text:$text");
          });
        });
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
              onPressed: _showAlertDialog,
              child: Text('alert弹出框-AlertDialog'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('select弹出框-SimpleDialog'),
              onPressed: _showSimpleDialog,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: _presentModelBottomSheet,
              child: Text('ActionSheet底部弹出框-_modelBottomSheet'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: _pushToastView,
              child: Text('toast-fluttertoast第三方库'),
            ),
            RaisedButton(
              onPressed: showCustomDialog,
              child: Text('自定义dialog'),
            ),
            RaisedButton(
              onPressed: showCustomDialog2,
              child: Text('自定义dialog2'),
            ),
            RaisedButton(
              onPressed: showCustomInputDialog,
              child: Text('自定义输入dialog3'),
            ),
          ],
        ),
      ),
    );
  }
}

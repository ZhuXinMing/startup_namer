import 'package:flutter/material.dart';
import 'package:startupnamer/Compents/ProduceListDialog.dart';
import 'FlutterToastController.dart';
import 'Compents/MyDialog.dart';
import 'Compents/SelectItemDialog.dart';
import 'Compents/InputSeveralDialog.dart';
import 'Compents/SelectItemDialog.dart';
import 'Compents/ConfirmStockDialog.dart';

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
      body: DialogPageWidget(
        customSelectIndex: customSelectIndex,
      ),
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
  DialogPageWidget({Key key, this.customSelectIndex}) : super(key: key);

  State createState() => _DialogPageState();
}

//RaisedButton例子
class _DialogPageState1 extends State<DialogPageWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text('普'),
            ),
            RaisedButton(
              child: Text('有颜色按钮'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {},
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('有阴影按钮'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 20,
            ),
            //圆形按钮-和头像一样
            RaisedButton(
              onPressed: () {},
              child: Text('有阴影按钮'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 20,
              shape: CircleBorder(
                side: BorderSide(color: Colors.white),
              ),
            ),
            //通过设置RaisedButton的父视图Container的宽度高度，来改变RaiseButton容器的宽度高度。
            Container(
              height: 34,
              width: 150,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  '宽度高度',
                  style: TextStyle(fontSize: 13),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //使用Expanded让变成自适应按钮
            Row(
              children: [
                Expanded(
                  child: Container(
                      height: 34,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          '自适应按钮',
                          style: TextStyle(fontSize: 13),
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        elevation: 20,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 34,
              width: 150,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  '设置圆角',
                  style: TextStyle(fontSize: 13),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
      return FlutterToastController();
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

  //自定义选择标签弹窗
  showCustomDialog2() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SelectItemDialog(
            title: "加工类型2",
            titleArray: ["全部1", "标记1", "非标2"],
            selectIndex: widget.customSelectIndex,
            onConfirmListener: (selectIndex) {
              widget.customSelectIndex = selectIndex;
              print('selectIndex=$selectIndex');
            },
          );
          ;
        });
  }

  //自定义输入弹窗
  showCustomInputDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return InputSeveralDialog(
              title: "11",
              onConfirmListener: (text) {
                print("text:$text");
              });
        });
  }

  showProduceListDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ProduceListDialog(
            entries: ['1', '2', '3', '12', '1', '2', '5', '5'],
          );
        });
  }

  showConfirmStockDialog(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ConfirmStockDialog();
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
              height: 10,
            ),
            RaisedButton(
              child: Text('select弹出框-SimpleDialog'),
              onPressed: _showSimpleDialog,
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: _presentModelBottomSheet,
              child: Text('ActionSheet底部弹出框-_modelBottomSheet'),
            ),
            SizedBox(
              height: 10,
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
              child: Text('自定义选择标签弹窗'),
            ),
            RaisedButton(
              onPressed: showCustomInputDialog,
              child: Text('自定义输入框dialog'),
            ),
            RaisedButton(
              onPressed: showProduceListDialog,
              child: Text('自定义列表dialog'),
            ),
            RaisedButton(
              onPressed: showConfirmStockDialog,
              child: Text('确认缺货输入dialog'),
            ),
          ],
        ),
      ),
    );
  }
}

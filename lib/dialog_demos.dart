import 'package:flutter/material.dart';
import 'package:startupnamer/Compents/produce_list_dialog.dart';
import 'FlutterToastController.dart';
import 'Compents/my_custom_dialog.dart';
import 'Compents/select_item_dialog.dart';
import 'Compents/input_several_dialog.dart';
import 'Compents/select_item_dialog.dart';
import 'Compents/confirm_stock_dialog.dart';
import 'Compents/confirm_entry_product_dialog.dart';

// ignore: must_be_immutable
class DialogDemo extends StatelessWidget {
  final String title;
  int customSelectIndex = -1;
  DialogDemo({
    Key key,
    this.title = 'Dialog页面',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: _DemoPage(
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

// ignore: must_be_immutable
class _DemoPage extends StatefulWidget {
  int customSelectIndex;
  _DemoPage({Key key, this.customSelectIndex}) : super(key: key);

  State createState() => _DemoState();
}



class _DemoState extends State<_DemoPage> {
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

    SelectItemDialog.show(context: context, title: '11', titleArray:['1','2','3'], onConfirmListener: (selectIndex){
      print('selectIndex=$selectIndex');
    });
  }

  //自定义输入弹窗
  showCustomInputDialog() {

    InputSeveralDialog.show(context: context, title: '1', onConfirmListener: (String text){
      print("text:$text");
    });
  }
  //商品列表
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
  //确认缺货
  showConfirmStockDialog(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ConfirmStockDialog();
        });

  }
  //确定录入
  showConfirmEntryProductDialog(){

    ConfirmEntryProductDialog.show(context: context,
    onConfirmListener: (actualThrowNum){
      print('num = $actualThrowNum');
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
            RaisedButton(
              onPressed: showConfirmEntryProductDialog,
              child: Text('商品录入确认dialog'),
            ),
          ],
        ),
      ),
    );
  }
}

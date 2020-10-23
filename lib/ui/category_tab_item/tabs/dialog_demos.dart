import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'FlutterToastController.dart';
import '../../../general/dialog/my_custom_dialog.dart';
import '../../../general/dialog/input_several_dialog.dart';
import '../../../general/dialog/select_item_dialog.dart';
import '../../../general/dialog/product_list_dialog.dart';
import '../../../general/dialog/confirm_verification_dialog.dart';
import '../../../general/dialog/confirm_entry_product_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startupnamer/general/dialog/alert_controller_dialog.dart';

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
      body: _DemoPage(
        customSelectIndex: customSelectIndex,
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

  _presentCustomAlertDialog(){

    UIAlertControllerDialog.showTextFieldAlert(
        context: context,
        title: Text('请输入所需数量'),
        content: Text('请输入所需数量,请输入所需数量'),
        textField: ZXCustomTextField(
          prefixText: '商品数量',
          maxNum: 100,
          minNum: 0.01,
        ),
        onConfirmListener: (string){

        }
    );
  }

  _presentTextFieldAlertDialog() {

    AlertDialog dialog = AlertDialog(
      title: Text('请输入所需数量'),
      titleTextStyle:TextStyle(
          color:Colors.black ,
          fontSize: ScreenUtil().setWidth(22),
          fontWeight: FontWeight.w500
      ) ,
      titlePadding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(110),
          ScreenUtil().setWidth(24),
          ScreenUtil().setWidth(24), 0
      ),
      actions: <Widget>[
        RaisedButton(onPressed: () {}, child: Text('Button 1')),
        RaisedButton(onPressed: () {}, child: Text('Button 2')),
      ],
      actionsPadding: EdgeInsets.all(ScreenUtil().setWidth(24)),
      backgroundColor: Colors.brown,
    );

    showDialog(
      context: context,
      builder: (context) {
        return  dialog;
      },
    );


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
  void _presentProductListDialog(){

    List list =  ['1', '2', '3', '12', '1', '2', '5', '5'];
    List<GoodListModel> goods = list.map((e) {
      GoodListModel model = GoodListModel();
      model.spuSpec = 'e.spuSpec';
      model.spuId = 'e.spuId';
      model.spuName = 'e.spuName';
      return model;
    }).toList();
    ProduceListDialog.show(context: context, entries: goods);
  }

  //确认验证码弹窗
  showConfirmVerificationDialog(){

    ConfirmVerificationDialog.show(
        context: context,
        title: "确认缺货",
        content: '内容内容内容内容内容内容内容内容内容内容内容内容',
        leftButtonTitle: '取消',
        rightButtonTitle: '确认报缺',
//        leftButtonTitle: '确认报缺',
//        rightButtonTitle: '取消',
        cancelConfirmIsLeft: true,
        leftOnConfirmListener: (){
            print('左边按钮事件');
        },
        rightOnConfirmListener: (){
          print('右边按钮事件');
    });
  }

  //确定录入
  showConfirmEntryProductDialog(){

    Map item = const {
      "spuName": "萝卜",
      "photo":
      "https://pics6.baidu.com/feed/9358d109b3de9c825b28c0133091350c18d843f7.jpeg?"
          "token=8d115bd85ec187149ddedc643b4cd4e1",
      "waitThrowNum": 3,
      "remainNum": 3,
      "baseUnitName": "袋"
    };

    ConfirmEntryProductDialog.show(context: context,
    item: item,
    onConfirmListener: (actualThrowNum){
      print('num = $actualThrowNum');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _showAlertDialog,
                child: Text('AlertDialog-alert弹出框'),
              ),
              RaisedButton(
                onPressed:_presentTextFieldAlertDialog,
                child: Text('AlertDialog改造-alert输入弹出框'),
              ),
              RaisedButton(
                onPressed:_presentCustomAlertDialog,
                child: Text('自定义alert输入弹出框'),
              ),
              RaisedButton(
                child: Text('SimpleDialog-select弹出框'),
                onPressed: _showSimpleDialog,
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: _pushToastView,
                child: Text('fluttertoast第三方库-toast'),
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
                onPressed: _presentProductListDialog,
                child: Text('自定义列表dialog'),
              ),
              RaisedButton(
                onPressed: showConfirmVerificationDialog,
                child: Text('确认缺货输入dialog'),
              ),
              RaisedButton(
                onPressed: showConfirmEntryProductDialog,
                child: Text('商品录入确认dialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

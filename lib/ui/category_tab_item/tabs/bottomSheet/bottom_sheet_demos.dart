///
///   @Name    : startup_namer/ bottom_sheet_demos
///   @author  : simon
///   @date    : 2020/7/1 3:41 PM
///   @desc    :
///   @version : 1.0
///

import 'package:flutter/material.dart';
import 'package:startupnamer/General/bottomSheet/one_column_picker.dart';
import 'package:startupnamer/General/bottomSheet/shift_quantity_selection_bottomSheet.dart';
import 'package:startupnamer/General/bottomSheet/product_selection_bottomSheet.dart';


class BottomSheetDemo extends StatefulWidget {

  final String title;
  BottomSheetDemo({
    Key key,
    this.title = 'BottomSheet页面',
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DemoState();
  }
}

class _DemoState extends State<BottomSheetDemo> with AutomaticKeepAliveClientMixin {

  int _count = 0;

  void _add() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                '测试加号值=$_count',
              style: TextStyle(
                backgroundColor: Colors.brown,
                fontSize: 20
              ),
            ),
            SizedBox(height: 10,),
            RaisedButton(
              onPressed: _presentModelBottomSheetHeight,
              child: Text('设置BottomSheet的child高度'),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: _presentModelBottomSheet,
              child: Text('ActionSheet底部弹出框-_modelBottomSheet'),
            ),
            RaisedButton(
              child: Text('一列'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _presentOneColumnPicker,
            ),
            RaisedButton(
              onPressed: _presentShiftSelectionSheet,
              child: Text('移位量选择弹窗'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 20,
            ),
            RaisedButton(
              onPressed: _presentProductSelectionSheet,
              child: Text('商品选择弹窗'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 20,
            ),
          ],
        ),
      ),
    );
  }

  //商品选择弹窗
  void _presentProductSelectionSheet() {

   List<Map> entries = [
      {
        "spuId": "123456",
        "spuName": "萝卜,商品名称商品名称商品名称商品名称商品名称",
        "spuSpec": '3斤',
        "isSelected": true
      },
      {
        "spuId": "123456",
        "spuName": "土豆,商品名称商品名称商品名称商品名称商品名称",
        "spuSpec": '10斤',
        "isSelected": true
      }
    ];
   List<SelectGoodListModel> goods = entries.map((e) {
     SelectGoodListModel model = SelectGoodListModel();
     model.spuSpec = e['spuSpec'];
     model.spuId = e['spuId'];
     model.spuName = e["spuName"];
     model.isSelected = e['isSelected'];
     return model;
   }).toList();

   ProductSelectionBottomSheet.show(
        context: context,
        title: '商品选择',
        entries: goods,
        onConfirmListener: (List items) {
          print(items);
        });
  }

  //商品数量修改弹窗
  _presentShiftSelectionSheet() {
    List<Map> entries = [
      {
        "spuId": "123456",
        "spuName": "萝卜,商品名称商品名称商品名称商品名称商品名称",
        "stockNumber": 3.0,
        "changedNumber": 3.0
      }
    ];
    List<ShiftNumberGoodListModel> models = entries.map((e) {
      ShiftNumberGoodListModel model = ShiftNumberGoodListModel();
      model.sourceNumber = e['stockNumber'];
      model.changedNumber = e['changedNumber'];
      model.spuId = e['spuId'];
      model.spuName = e["spuName"];
      return model;
    }).toList();
    ShiftQuantitySelectionBottomSheet.show(
        context: context,
        title: '移位量选择',
        entries: models,
        onConfirmListener: (List items) {
          print(items);
        });
  }

  //一列picker
  _presentOneColumnPicker() {
    OneColumnPicker.show(
        context: context,
        title: '标题',
        titleArray: ['1', '2', '3'],
        onConfirmListener: (int index) {
          print("index = $index");
        });
  }

  _presentModelBottomSheetHeight() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('自定义bottomSheet高度，设置背景色'),
              RaisedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        );
      },
      //设置Container的背景色一样
      backgroundColor: Colors.orange,
      //设置形状
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
    );
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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

///
///   @Name    : startup_namer/ bottom_sheet_demos
///   @author  : simon
///   @date    : 2020/7/1 3:41 PM
///   @desc    :
///   @version : 1.0
///

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:startupnamer/Compents/one_column_picker.dart';
import 'package:startupnamer/Compents/shift_quantity_selection_bottomSheet.dart';

class BottomSheetDemo extends StatelessWidget {
  final String title;
  BottomSheetDemo({
    Key key,
    this.title = 'BottomSheet页面',
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
            onPressed: _presentSelectionSheet,
            child: Text('移位量选择弹窗'),
            color: Colors.blue,
            textColor: Colors.white,
            elevation: 20,
          ),
        ],
      ),
    );
  }

  //移位量选择弹窗
  _presentSelectionSheet() {

    ShiftQuantitySelectionBottomSheet.showPickerView(context: context,onConfirmListener: (List items){

      print(items);
    });
  }

  //一列picker
  _presentOneColumnPicker() {

    OneColumnPicker.show(context: context, onConfirmListener: (int index){
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
}

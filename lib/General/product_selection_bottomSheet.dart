///
///   @Name    : startup_namer/ product_selection_bottomSheet
///   @author  : simon
///   @date    : 2020/7/3 3:57 PM
///   @desc    :
///   @version : 1.0
///

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math' as math;

typedef OnConfirmListener = Function(List entries);

/*
  //商品选择弹窗
  void _presentProductSelectionSheet() {

   List<Map> entries = [
      {
        "spuId": "123343435",
        "spuName": "萝卜,商品名称商品名称商品名称商品名称商品名称",
        "remainNum": 3,
        "num": 1,
        "isSelected": true
      },
      {
        "spuId": "3434343435",
        "spuName": "土豆,商品名称商品名称商品名称商品名称商品名称",
        "remainNum": 10,
        "num": 1,
        "isSelected": true
      }
    ];
    ProductSelectionBottomSheet.show(
        context: context,
        title: '商品选择',
        entries: entries,
        onConfirmListener: (List items) {
          print(items);
        });
  }
 */


// ignore: must_be_immutable
class ProductSelectionBottomSheet extends StatelessWidget {
  //标题
  @required
  final String title;
  //数据源数组
  List<Map> entries;
  //确定按钮事件回调
  @required
  final OnConfirmListener onConfirmListener;


  ProductSelectionBottomSheet(
      {Key key, String title, List<Map> entries, this.onConfirmListener})
      : this.title = title ?? "",
        this.entries = entries ?? List<Map>(),
        super(key: key);

  static void show(
      {@required BuildContext context,
      String title,
      List<Map> entries,
      OnConfirmListener onConfirmListener}) {

    showModalBottomSheet(
        context: context,
        //设置形状
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return ProductSelectionBottomSheet(
            title: title,
            entries: entries,
            onConfirmListener: onConfirmListener,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _BottomSheetPage(
        title: title, entries: entries, onConfirmListener: onConfirmListener);
  }
}

class _BottomSheetPage extends StatefulWidget {
  @required
  final String title;
  List<Map> entries;
  @required
  final OnConfirmListener onConfirmListener;

  bool allSelected = true;

  _BottomSheetPage({this.title, this.entries, this.onConfirmListener});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomSheetState();
  }
}

class _BottomSheetState extends State<_BottomSheetPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.allSelected =  widget.entries.every((element) => element['isSelected']);
//    widget.entries.forEach((element) {
//      element['isSelected'] = widget.allSelected;
//    });
  }


  double bottomSheetHeight = 412;

  //关闭按钮大小
  double closeIconSize = 30;

  //行高
  double rowHeight = 48;

  //行内间距
  double rowPaddingLeft = 20;
  double rowPaddingRight = 34;

  //icon大小
  double selectIconSize = 28;

  //icon内间距
  double selectIconButtonPadding = 8;

  //按钮大小
  double btnHeight = 64;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setWidth(bottomSheetHeight),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(top: 10.0),
          height: ScreenUtil().setWidth(closeIconSize + 20 + 10),
//            color: Colors.amber,
          child: Stack(children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(22),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
//                  splashRadius: 20,
                  highlightColor: Colors.transparent,
                  iconSize: ScreenUtil().setWidth(closeIconSize),
                  icon: Image.asset(
                    "assets/images/close_gray@2x.png",
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )
          ]),
        ),
        Expanded(
            child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: ScreenUtil().setWidth(rowHeight),
              padding: EdgeInsets.fromLTRB(
                  ScreenUtil()
                      .setWidth(rowPaddingLeft - selectIconButtonPadding),
                  0,
                  ScreenUtil().setWidth(rowPaddingRight),
                  0),
              decoration: BoxDecoration(
//                    color: Colors.white,
//                    color: Colors.blue,
                  ),
              child: Row(
                children: [
                  IconButton(
//                      splashRadius:
//                          selectIconSize / 2 + selectIconButtonPadding,
                      highlightColor: Colors.transparent,
                      iconSize: ScreenUtil().setWidth(selectIconSize),
                      icon: _BottomSheetState.checkbox(
                          widget.entries[index]['isSelected']),
                      onPressed: () {
                        setState(() {
                          widget.entries[index]['isSelected'] =
                              !widget.entries[index]['isSelected'];
                          widget.allSelected = widget.entries.every((element) => element['isSelected']);
                        });
                      }),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: Text(
                      "(${widget.entries[index]['spuId']})${widget.entries[index]['spuName']}",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: ScreenUtil().setSp(20),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 2,
            );
          },
          itemCount: widget.entries != null ? widget.entries.length : 0,
        )),
        Divider(
          height: 2,
        ),
        Container(
          height: ScreenUtil().setWidth(btnHeight + 8 + 8),
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(24 - selectIconButtonPadding),
              ScreenUtil().setWidth(8),
              ScreenUtil().setWidth(12),
              ScreenUtil().setWidth(8)),
          child: Row(
            children: [
              IconButton(
//                splashRadius: selectIconSize / 2 + selectIconButtonPadding,
                highlightColor: Colors.transparent,
                iconSize: ScreenUtil().setWidth(selectIconSize),
                icon: _BottomSheetState.checkbox(
                    widget.entries.every((element) => element['isSelected'])),
                onPressed: () {
                  setState(() {
                    widget.allSelected = !widget.allSelected;
                    widget.entries.forEach((element) {
                      element['isSelected'] = widget.allSelected;
                    });
                  });
                },
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(0, 0, ScreenUtil().setWidth(14), 0),
                child: Text(
                  '全选',
                  style: TextStyle(
                    color: Color(0xff262B3C),
                    fontSize: ScreenUtil().setSp(24),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      if (widget.onConfirmListener != null) {
                        widget.onConfirmListener(widget.entries);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffEF5D44),
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(5)),
                      ),
                      child: Text(
                        '确定',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  ///选择框
  static Widget checkbox(bool check) {
    return Container(
      width: ScreenUtil().setWidth(28),
      height: ScreenUtil().setWidth(28),
      decoration: BoxDecoration(
          color: check ? Color(0xffEF5D44) : null,
          border: check
              ? null
              : Border.all(
                  color: Color(0xff999999), width: ScreenUtil().setWidth(1.5)),
          shape: BoxShape.circle),
      alignment: Alignment.center,
      child: check
          ? Icon(
              Icons.check,
              color: Colors.white,
              size: ScreenUtil().setWidth(20),
            )
          : null,
    );
  }
}

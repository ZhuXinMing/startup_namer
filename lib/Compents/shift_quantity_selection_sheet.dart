///
///   @Name    : startup_namer/ shift_quantity_selection_sheet
///   @author  : simon
///   @date    : 2020/7/2 5:58 PM
///   @desc    :
///   @version : 1.0
// 移位量选择
//  逻辑没写；

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math' as math;

typedef OnConfirmListener = Function(List entries);

// ignore: must_be_immutable
class ShiftQuantitySelectionSheet extends StatelessWidget {
  @required
  final String title;
  List<Map> entries;
  @required
  final OnConfirmListener onConfirmListener;

  ShiftQuantitySelectionSheet(
      {this.title, this.entries, this.onConfirmListener});

  static void showPickerView(
      {@required BuildContext context,
      String title = '移位量选择',
      List<Map> entries,
      OnConfirmListener onConfirmListener}) {
    entries = [
      {
        "spuId": "123343435",
        "spuName": "萝卜,商品名称商品名称商品名称商品名称商品名称",
        "remainNum": 3,
        "num": 1
      }
    ];

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
          return ShiftQuantitySelectionSheet(
            title: title,
            entries: entries,
            onConfirmListener: onConfirmListener,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShiftQuantitySelectionSheetPage(
        title: title, entries: entries, onConfirmListener: onConfirmListener);
  }
}

class ShiftQuantitySelectionSheetPage extends StatefulWidget {
  @required
  final String title;
  List<Map> entries;
  @required
  final OnConfirmListener onConfirmListener;

  ShiftQuantitySelectionSheetPage(
      {this.title, this.entries, this.onConfirmListener});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShiftQuantitySelectionSheetState();
  }
}

class ShiftQuantitySelectionSheetState
    extends State<ShiftQuantitySelectionSheetPage> {
//  var mList = List();

  @override
  void initState() {
    // TODO: implement initState
//    mList = widget.entries;
    super.initState();
  }

  void showCenterShortToast() {
    Fluttertoast.showToast(
        msg: "已达该商品待投量",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  void showMinusCenterShortToast() {
    Fluttertoast.showToast(
        msg: "已达最小量",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  void _reduceAction(int index) {
    setState(() {
      int a = widget.entries[index]['num'];
      if (a == 1) {
        showMinusCenterShortToast();
      } else {
        widget.entries[index]['num'] = (a - 1);
      }
      print('----');
    });
  }

  void _increaseAction(int index) {
    setState(() {
      int r = widget.entries[index]['remainNum'];
      int a = widget.entries[index]['num'];
      if (a >= r) {
        showCenterShortToast();
      } else {
        widget.entries[index]['num'] = (a + 1);
      }
      print('+++++++');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setWidth(412),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0),
            height: ScreenUtil().setWidth(30 + 20 + 10),
//            color: Colors.amber,
            child: Stack(
              children: [
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
                      iconSize: 30,
                      icon: Image.asset(
                        "assets/images/close_gray@2x.png",
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: widget.entries != null ? widget.entries.length : 0,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 2,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: ScreenUtil().setWidth(30 + 10 * 2),
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), 0,
                      ScreenUtil().setWidth(20.0 - 6), 0),
                  decoration: BoxDecoration(
//                    color: Colors.white,
//                    color: Colors.blue,
                      ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(305),
                        child: Text(
                          "(${widget.entries[index]['spuId']})${widget.entries[index]['spuName']}",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: ScreenUtil().setSp(20),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        width: ScreenUtil().setWidth(32.0 + 6 + 48 + 32.0 + 6),
                        height: ScreenUtil().setWidth(30.0 + 6 + 6),
//                        color: Colors.amber,
                        child: Row(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Container(
//                                color: Colors.cyan,
                                height: ScreenUtil().setWidth(30.0 + 6 * 2),
                                width: ScreenUtil().setWidth(32 + 6),
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: ScreenUtil().setWidth(32),
                                  height: ScreenUtil().setWidth(30),
                                  child: Image.asset(
                                    "assets/images/left.png",
                                  ),
                                ),
                              ),
                              onTap: () {
                                _reduceAction(index);
                              },
                            ),
                            Container(
                              height: ScreenUtil().setWidth(30.0),
                              width: ScreenUtil().setWidth(48),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
//                                    color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/mid.png",
                                      ),
                                      fit: BoxFit.fill)),
                              child: Text(
                                widget.entries[index]['num'].toString(),
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  child: Container(
//                                    color: Colors.cyan,
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      width: ScreenUtil().setWidth(32),
                                      height: ScreenUtil().setWidth(30),
                                      child: Image.asset(
                                        "assets/images/right.png",
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    _increaseAction(index);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 2,
          ),
          Container(
            height: ScreenUtil().setWidth(80),
            padding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(12),
                ScreenUtil().setWidth(8),
                ScreenUtil().setWidth(12),
                ScreenUtil().setWidth(8)),
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
    );
  }
}

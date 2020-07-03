//  Created by simon on 2020/6/29.

// 确认录入商品

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:fluttertoast/fluttertoast.dart';

typedef OnConfirmListener = Function(String actualThrowNum);

class ConfirmEntryProductDialog extends Dialog {
  final Map item;
  final OnConfirmListener onConfirmListener;

  const ConfirmEntryProductDialog(
      {Key key,
      this.item,
      this.onConfirmListener})
      : super(key: key);

  static void show(
      {@required BuildContext context,
      Map item = const {
        "spuName": "萝卜",
        "photo":
            "https://pics6.baidu.com/feed/9358d109b3de9c825b28c0133091350c18d843f7.jpeg?"
                "token=8d115bd85ec187149ddedc643b4cd4e1",
        "waitThrowNum": 3,
        "remainNum": 3,
        "baseUnitName": "袋"
      },
      OnConfirmListener onConfirmListener}) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ConfirmEntryProductDialog(
            item: item,
            onConfirmListener: onConfirmListener,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      color: Colors.amber,
      child: Center(
        child: ConfirmEntryProductDialogPage(
          item: item,
          onConfirmListener: onConfirmListener,
        ),
      ),
    );
  }
}

class ConfirmEntryProductDialogPage extends StatefulWidget {
  final OnConfirmListener onConfirmListener;
  final Map item;

  const ConfirmEntryProductDialogPage(
      {Key key, this.item, this.onConfirmListener})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ConfirmEntryProductDialogState();
  }
}

class ConfirmEntryProductDialogState
    extends State<ConfirmEntryProductDialogPage> {
  final _controller = TextEditingController();

  double width = 384.0;
  double height = 258.0;

  double picSize = 80;
  double contentPaddingLeft = 24;
  double contentPaddingRight = 24;

  //加，减
  double reduceIconWidth = 32;
  double reduceIconHeight = 30;
  //加，减 扩展大小
  double reduceIconExtend = 6;
  //按钮width，height
  double btnWidth = 156;
  double btnHeight = 52;

  @override
  void initState() {
    _controller.text = widget.item['waitThrowNum'].toString();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
      ),
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setWidth(78),
            child: Text(
              '商品录入确认',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(22),
                fontWeight: FontWeight.w500,
              ),
            ),
            alignment: Alignment.center,
          ),
          Container(
            height: ScreenUtil().setWidth(picSize),
            padding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(contentPaddingLeft),
                0,
                ScreenUtil().setWidth(contentPaddingRight-6),
                0),
            child: Row(
              children: [
                Image.network(
                  widget.item['photo'],
                  height: ScreenUtil().setWidth(picSize),
                  width: ScreenUtil().setWidth(picSize),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(8),
                ),
                Expanded(
                  child: Stack(
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(6)),
                            child: Text(
                              widget.item['spuName'],
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(18),
                                color: Color(0xFF333333),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setWidth(1),
                          ),
                          Text.rich(
                            TextSpan(
                              text: "待投数量：",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(18),
                                color: Color(0xFF999999),
                              ),
                              children: [
                                TextSpan(
                                  text: widget.item['waitThrowNum'].toString(),
                                  style: TextStyle(color: Color(0xffEF5D44)),
                                ),
                                TextSpan(
                                  text: widget.item['baseUnitName'],
                                  style: TextStyle(color: Color(0xFF999999)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setWidth(1),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: "容器剩余：",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(18),
                                  color: Color(0xFF999999),
                                ),
                                children: [
                                  TextSpan(
                                    text: widget.item['remainNum'].toString(),
                                    style: TextStyle(color: Color(0xffEF5D44)),
                                  ),
                                  TextSpan(
                                    text: widget.item['baseUnitName'],
                                    style: TextStyle(color: Color(0xFF999999)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: ScreenUtil().setWidth(reduceIconExtend + reduceIconWidth +48 + reduceIconWidth + reduceIconExtend),
                          height: ScreenUtil().setWidth(reduceIconHeight + reduceIconExtend),
//                          color: Colors.amber,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                child: Container(
                                    width: ScreenUtil().setWidth(reduceIconWidth + reduceIconExtend),
                                    height: ScreenUtil().setWidth(reduceIconHeight + reduceIconExtend),
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      width: ScreenUtil().setWidth(reduceIconWidth),
                                      height: ScreenUtil().setWidth(reduceIconHeight),
                                      child: Image.asset(
                                        "assets/images/left@2x.png",
                                      ),
                                    )),
                                onTap: () {
                                  int a = int.parse(_controller.text);
                                  if (a == 1) {
                                    showMinusCenterShortToast();
                                  } else {
                                    _controller.text = (a - 1).toString();
                                  }
                                  print('----');
                                },
                              ),
                              Container(
                                height: ScreenUtil().setWidth(30.0),
                                width: ScreenUtil().setWidth(48.6),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
//                                    color: Colors.blue,
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/mid@2x.png",
                                        ),
                                        fit: BoxFit.fill)),
                                child: TextField(
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(15),
                                      color: Color(0xFF333333),
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    controller: _controller,
                                    decoration: InputDecoration.collapsed(
//                                      hintText: "1",
//                                    hintStyle: TextStyle(
//                                      fontSize: ScreenUtil().setSp(12),
//                                      color: Color(0xFF333333),
//                                    ),
                                        )),
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    child: SizedBox(
                                      width: ScreenUtil().setWidth(reduceIconWidth),
                                      height: ScreenUtil().setWidth(reduceIconHeight),
                                      child: Image.asset(
                                        "assets/images/right@2x.png",
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    int r = widget.item['remainNum'];
                                    int w = widget.item['waitThrowNum'];
                                    int min = math.min(r, w);
                                    int a = int.parse(_controller.text);
                                    if (a >= min) {
                                      showCenterShortToast();
                                    } else {
                                      _controller.text = (a + 1).toString();
                                    }
                                    print('+++++++');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: ScreenUtil().setWidth(btnWidth),
                height: ScreenUtil().setWidth(btnHeight),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
//                    widget.leftOnConfirmListener();
                  },
                  child: Text(
                    '取消',
                    style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                  ),
                  color: Colors.white,
                  elevation: 0,
                  highlightElevation: 0,
                  disabledElevation: 0,
                  textColor: Color(0xFF333333),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(5)),
                    side: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(btnWidth),
                height: ScreenUtil().setWidth(btnHeight),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.onConfirmListener(_controller.text);
                  },
                  child: Text(
                    '确定',
                    style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                  ),
                  color: Color(0xffEF5D44),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(5)),
                    side: BorderSide(color: Color(0xffEF5D44)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

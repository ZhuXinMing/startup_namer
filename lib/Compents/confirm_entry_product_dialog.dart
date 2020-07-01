//  Created by simon on 2020/6/29.

// 确认录入商品

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:fluttertoast/fluttertoast.dart';

typedef OnConfirmListener = Function(String num);

class ConfirmEntryProductDialog extends Dialog {
  final Map item;
  final OnConfirmListener onConfirmListener;

  const ConfirmEntryProductDialog(
      {Key key,
      this.item = const {
        "spuName": "萝卜",
        "photo":
            "https://pics6.baidu.com/feed/9358d109b3de9c825b28c0133091350c18d843f7.jpeg?"
                "token=8d115bd85ec187149ddedc643b4cd4e1",
        "waitThrowNum": 3,
        "remainNum": 3,
      },
      this.onConfirmListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      color: Colors.amber,
      child: Center(
        child: ConfirmEntryProductDialogPage(item: item,onConfirmListener: onConfirmListener,),
      ),
    );
  }
}

class ConfirmEntryProductDialogPage extends StatefulWidget {
  final OnConfirmListener onConfirmListener;
  final Map item;

  const ConfirmEntryProductDialogPage({Key key,this.item, this.onConfirmListener})
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

  double width = 256.0;
  double height = 172.0;

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
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(3)),
      ),
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setWidth(52),
            child: Text(
              '商品录入确认',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(14),
                fontWeight: FontWeight.w500,
              ),
            ),
            alignment: Alignment.center,
          ),
          Container(
            height: ScreenUtil().setWidth(53),
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
            child: Row(
              children: [
                Image.network(
                  widget.item['photo'],
                  height: ScreenUtil().setWidth(53),
                  width: ScreenUtil().setWidth(53),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(5),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(16)),
                            child: Text(
                              widget.item['spuName'],
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
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
                                fontSize: ScreenUtil().setSp(12),
                                color: Color(0xFF999999),
                              ),
                              children: [
                                TextSpan(
                                  text: widget.item['waitThrowNum'].toString(),
                                  style: TextStyle(color: Color(0xffEF5D44)),
                                ),
                                TextSpan(
                                  text: '袋',
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
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Color(0xFF999999),
                                ),
                                children: [
                                  TextSpan(
                                    text:  widget.item['remainNum'].toString(),
                                    style: TextStyle(color: Color(0xffEF5D44)),
                                  ),
                                  TextSpan(
                                    text: '袋',
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
                          width: ScreenUtil().setWidth(31.0 + 31.6 + 31.0),
                          height: ScreenUtil().setWidth(20.0 + 10),
//                          color: Colors.amber,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                child: Container(
                                    height: ScreenUtil().setWidth(20.0 + 10),
                                    width: ScreenUtil().setWidth(31),
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      width: ScreenUtil().setWidth(21),
                                      height: ScreenUtil().setWidth(20),
                                      child: Image.asset(
                                        "images/2x/left.png",
                                      ),
                                    )),
                                onTap: () {
                                  int a  = int.parse(_controller.text);
                                  if(a == 1){
                                    showMinusCenterShortToast();
                                  }
                                  else{
                                    _controller.text = (a-1).toString();
                                  }
                                  print('----');
                                },
                              ),
                              Container(
                                height: ScreenUtil().setWidth(20.0),
                                width: ScreenUtil().setWidth(31.6),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
//                                    color: Colors.blue,
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "images/2x/mid.png",
                                        ),
                                        fit: BoxFit.fill)),
                                child: TextField(
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(12),
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
                                      width: ScreenUtil().setWidth(21),
                                      height: ScreenUtil().setWidth(20),
                                      child: Image.asset(
                                        "images/2x/right.png",
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    int r = widget.item['remainNum'];
                                    int w = widget.item['waitThrowNum'];
                                    int min = math.min(r, w);
                                    int a  = int.parse(_controller.text);
                                    if(a >= min){
                                      showCenterShortToast();
                                    }
                                    else{
                                      _controller.text = (a+1).toString();
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
                SizedBox(
                  width: ScreenUtil().setWidth(6),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: ScreenUtil().setWidth(34),
                width: ScreenUtil().setWidth(104),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
//                    widget.leftOnConfirmListener();
                  },
                  child: Text(
                    '取消',
                    style: TextStyle(fontSize: ScreenUtil().setSp(13)),
                  ),
                  color: Colors.white,
                  elevation: 0,
                  highlightElevation: 0,
                  disabledElevation: 0,
                  textColor: Color(0xFF333333),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(3)),
                    side: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                ),
              ),
              Container(
                height: ScreenUtil().setWidth(34),
                width: ScreenUtil().setWidth(104),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.onConfirmListener(_controller.text);
                  },
                  child: Text(
                    '确定',
                    style: TextStyle(fontSize: ScreenUtil().setSp(13)),
                  ),
                  color: Color(0xffEF5D44),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(3)),
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
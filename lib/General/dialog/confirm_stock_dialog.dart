//  Created by simon on 2020/6/28.

import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef RightOnConfirmListener = Function();
typedef LeftOnConfirmListener = Function();

/*
  //确认缺货
  void showConfirmStockDialog() {
    ConfirmStockDialog.show(
        context: context,
        title: "确认缺货",
        content: '请联系分拣经理，确认是否报缺。报缺后，待分拣的该商品将变为缺货状态。',
        rightButtonTitle: '确认报缺',
        leftOnConfirmListener: () {
          print('取消');
        },
        rightOnConfirmListener: () {
          requestReportDeficiencyGoods();
        });
  }
 */

class ConfirmStockDialog extends Dialog {
  //标题
  @required
  final String title;
  //内容,不传的话内容UI不会展示；
  final String content;
  //验证码，如果不传默认会是随机位数；
  final String verificationCode;
  //左边按钮文本
  @required
  final String leftButtonTitle;
  //右边按钮文本
  @required
  final String rightButtonTitle;
  //左边按钮事件回调
  @required
  final LeftOnConfirmListener leftOnConfirmListener;
  //右边按钮事件回调
  @required
  final RightOnConfirmListener rightOnConfirmListener;

  const ConfirmStockDialog(
      {Key key,
        String title,
        this.content,
        this.verificationCode,
        String leftButtonTitle,
        String rightButtonTitle,
        this.leftOnConfirmListener,
        this.rightOnConfirmListener})
      : this.title = title ?? '',
        this.leftButtonTitle = leftButtonTitle ?? '取消',
        this.rightButtonTitle = rightButtonTitle ?? '确认',
        super(key: key);

  static void show({
    @required BuildContext context,
    @required String title,
    String content,
    String verificationCode,
    String leftButtonTitle = '取消',
    String rightButtonTitle = '确认',
    @required LeftOnConfirmListener leftOnConfirmListener,
    @required RightOnConfirmListener rightOnConfirmListener,
  }) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ConfirmStockDialog(
            title: title,
            content: content,
            verificationCode: verificationCode,
            leftButtonTitle: leftButtonTitle,
            rightButtonTitle: rightButtonTitle,
            leftOnConfirmListener: leftOnConfirmListener,
            rightOnConfirmListener: rightOnConfirmListener,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
          child: _DialogPage(
            title: title,
            content: content,
            verificationCode: verificationCode,
            leftButtonTitle: leftButtonTitle,
            rightButtonTitle: rightButtonTitle,
            leftOnConfirmListener: leftOnConfirmListener,
            rightOnConfirmListener: rightOnConfirmListener,
          )),
    );
  }
}

class _DialogPage extends StatefulWidget {
  final String title;
  final String content;

  final String verificationCode;
  final String leftButtonTitle;
  final String rightButtonTitle;
  final RightOnConfirmListener rightOnConfirmListener;
  final LeftOnConfirmListener leftOnConfirmListener;

  const _DialogPage(
      {this.title,
        this.content,
        this.verificationCode,
        this.leftButtonTitle,
        this.rightButtonTitle,
        this.leftOnConfirmListener,
        this.rightOnConfirmListener});

  @override
  State<StatefulWidget> createState() => _DialogState();
}

class _DialogState extends State<_DialogPage> {
  TextEditingController _textEditingController = new TextEditingController();
  String _verificationCode;

  double _width;
  double _height;

  double _contentPadding = 24;
  //按钮width，height
  double _btnWidth = 156;
  double _btnHeight = 52;

  _randomBit(int len) {
    String scopeF = '123456789'; //首位
    String scopeC = '0123456789'; //中间
    String result = '';
    for (int i = 0; i < len; i++) {
      if (i == 0) {
        result = scopeF[Random().nextInt(scopeF.length)];
      } else {
        result = result + scopeC[Random().nextInt(scopeC.length)];
      }
    }
    return result;
  }

  void _showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg ?? '',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _width = 384;
    _height = widget.content != null ? 350.0 : 280.0;
    _verificationCode = widget.verificationCode ?? _randomBit(5);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(_width),
      height: ScreenUtil().setWidth(_height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
      ),
      padding: EdgeInsets.all(ScreenUtil().setWidth(_contentPadding)),
      child: Column(
        children: [
          Align(
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(22),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(24),
          ),
          Offstage(
            offstage: widget.content != null ? false : true,
            child: Container(
              height: ScreenUtil().setWidth(50 + 20),
              child: Align(
                child: Text(
                  '${widget.content}',
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: ScreenUtil().setSp(18),
                  ),
                  maxLines: 2,
                ),
              ),
            ),
          ),
          Align(
            child: Text(
              '验证码：$_verificationCode',
              style: TextStyle(
                color: Color(0xffEF5D44),
                fontSize: ScreenUtil().setSp(22),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(10),
          ),
          Container(
            height: ScreenUtil().setWidth(62),
            width: ScreenUtil().setWidth(_width - (_contentPadding * 2)),
            decoration: BoxDecoration(
              color: Color(0xFFF2F1F6),
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
              border: Border.all(color: Colors.white, width: 1),
            ),
            padding:
            EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Row(
              children: [
                Text(
                  "验证码",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(22),
                    color: Color(0xFF333333),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(22),
                      color: Color(0xFF333333),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _textEditingController,
                    onChanged: (value) {},
                    decoration: InputDecoration.collapsed(
                        hintText: "请点击输入",
                        hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(22),
                          color: Color(0xFF999999),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: ScreenUtil().setWidth(_btnWidth),
                height: ScreenUtil().setWidth(_btnHeight),
                child: RaisedButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                    widget.leftOnConfirmListener();
                  },
                  child: Text(
                    widget.leftButtonTitle,
                    style: TextStyle(fontSize: ScreenUtil().setSp(20),fontWeight: FontWeight.normal),
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
                width: ScreenUtil().setWidth(_btnWidth),
                height: ScreenUtil().setWidth(_btnHeight),
                child: RaisedButton(
                  onPressed: () {
                    if (_verificationCode
                        .compareTo(_textEditingController.text) !=
                        0)
                    {
                      _showToast('请输入有效的验证码');
                    }
                    else {
                      Navigator.pop(context);
                      widget.rightOnConfirmListener();
                    }
                  },
                  child: Text(
                    widget.rightButtonTitle,
                    style: TextStyle(fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.normal
                    ),
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
          )
        ],
      ),
    );
  }
}

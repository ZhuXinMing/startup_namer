//  Created by simon on 2020/6/28.

// 确认缺货,是否需要回调验证码？

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

typedef RightOnConfirmListener = Function();
typedef LeftOnConfirmListener = Function();

class ConfirmStockDialog extends Dialog {
  @required
  final String title;
  final String content;
  @required
  final String verificationCode;
  @required
  final String leftButtonTitle;
  @required
  final String rightButtonTitle;
  @required
  final LeftOnConfirmListener leftOnConfirmListener;
  @required
  final RightOnConfirmListener rightOnConfirmListener;

  const ConfirmStockDialog(
      {Key key,
      this.title,
      this.content,
      this.verificationCode,
      this.leftButtonTitle,
      this.rightButtonTitle,
      this.leftOnConfirmListener,
      this.rightOnConfirmListener})
      : super(key: key);

  //如果为空，会传null给ConfirmStokDialog类的属性
  static void show({
    @required BuildContext context,
    String title = '确认缺货',
    String content,
    String verificationCode = '23621',
    String leftButtonTitle = '取消',
    String rightButtonTitle = '确认报缺',
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
  double width;
  double height;

  double contentPadding = 24;
  //按钮width，height
  double btnWidth = 156;
  double btnHeight = 52;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    width = 384;
    height = widget.content != null ? 350.0 : 280.0;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
      ),
      padding: EdgeInsets.all(ScreenUtil().setWidth(contentPadding)),
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
              height: ScreenUtil().setWidth(50+20),
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
              '验证码：${widget.verificationCode}',
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
            width: ScreenUtil().setWidth(width-2*contentPadding),
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
              child:SizedBox(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: ScreenUtil().setWidth(btnWidth),
                height: ScreenUtil().setWidth(btnHeight),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.leftOnConfirmListener();
                  },
                  child: Text(
                    widget.leftButtonTitle,
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
                    widget.rightOnConfirmListener();
                  },
                  child: Text(
                    widget.rightButtonTitle,
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
          )
        ],
      ),
    );
  }
}

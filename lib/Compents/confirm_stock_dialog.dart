//  Created by simon on 2020/6/28.

//确认缺货

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

typedef RightOnConfirmListener = Function();
typedef LeftOnConfirmListener = Function();

class ConfirmStockDialog extends Dialog {

  final String title;
  final String content;
  final String verificationCode;
  final String leftButtonTitle;
  final String rightButtonTitle;
  final LeftOnConfirmListener leftOnConfirmListener;
  final RightOnConfirmListener rightOnConfirmListener;

  const ConfirmStockDialog(
      {Key key,
      this.title = '确认缺货',
      this.content,
      this.verificationCode = '23621',
      this.leftButtonTitle = '取消',
      this.rightButtonTitle = '确认报缺',
      this.leftOnConfirmListener,
      this.rightOnConfirmListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
          child: ConfirmStockDialogPage(
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

class ConfirmStockDialogPage extends StatefulWidget {

  final String title;
  final String content;

  final String verificationCode;
  final String leftButtonTitle;
  final String rightButtonTitle;
  final RightOnConfirmListener rightOnConfirmListener;
  final LeftOnConfirmListener leftOnConfirmListener;

  const ConfirmStockDialogPage(
      {this.title,
        this.content,
        this.verificationCode,
        this.leftButtonTitle,
        this.rightButtonTitle,
        this.leftOnConfirmListener,
        this.rightOnConfirmListener});

  @override
  State<StatefulWidget> createState()=>ConfirmStockDialogState();
}

class ConfirmStockDialogState extends State<ConfirmStockDialogPage> {
  double width;
  double height;
  TextEditingController _textEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    width = 256;
    height = widget.content != null ? 233.0 : 186.0;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(3)),
      ),
      padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
      child: Column(
        children: [
          Align(
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(14),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(16),
          ),
          Offstage(
            offstage: widget.content != null ? false : true,
            child: Container(
              height: 33.0 + 13,
              child: Align(
                child: Text(
                  '${widget.content}',
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: ScreenUtil().setSp(12),
                  ),
                ),
              ),
            ),
          ),
          Align(
            child: Text(
              '验证码：${widget.verificationCode}',
              style: TextStyle(
                color: Color(0xffEF5D44),
                fontSize: ScreenUtil().setSp(14),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(6),
          ),
          Container(
            height: ScreenUtil().setWidth(41),
            width: ScreenUtil().setWidth(224),
            decoration: BoxDecoration(
              color: Color(0xFFF2F1F6),
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(3)),
              border: Border.all(color: Colors.white, width: 1),
            ),
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
            child: Row(
              children: [
                Text(
                  "验证码",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: Color(0xFF333333),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(13),
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _textEditingController,
                    onChanged: (value) {},
                    decoration: InputDecoration.collapsed(
                        hintText: "请点击输入",
                        hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Color(0xFF999999),
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: ScreenUtil().setWidth(34),
                width: ScreenUtil().setWidth(104),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.leftOnConfirmListener();
                  },
                  child: Text(
                    widget.leftButtonTitle,
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
                    widget.rightOnConfirmListener();
                  },
                  child: Text(
                    widget.rightButtonTitle,
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
          )
        ],
      ),
    );
  }
}

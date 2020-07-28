///
///   @Name    : startup_namer/ textField_alert_dialog
///   @author  : simon
///   @date    : 2020/7/23 4:55 PM
///   @desc    :
///   @version : 1.0

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

typedef OnConfirmListener = Function(String text);

class TextFieldAlertDialog extends Dialog {
  @required
  final String title;
  @required
  final OnConfirmListener onConfirmListener;
  final TextStyle titleTextStyle;
  //textField边界距离两边的水平填充
  final double textFieldGapPadding;
  final BorderRadius textFieldBorderRadius;
  final String textFieldPrefixText;
  final TextStyle textFieldPrefixStyle;
  final String textFieldHintText;
  final TextStyle textFieldHintStyle;
  final EdgeInsetsGeometry actionsPadding;

  TextFieldAlertDialog({
    Key key,
    String title,
    this.onConfirmListener,
    this.titleTextStyle,
    this.textFieldGapPadding,
    this.textFieldBorderRadius,
    this.textFieldPrefixText,
    this.textFieldPrefixStyle,
    this.textFieldHintText,
    this.textFieldHintStyle,
    this.actionsPadding = EdgeInsets.zero,
  })  : this.title = title ?? '',
        super(key: key);

  static show({
    @required BuildContext context,
    @required String title,
    @required OnConfirmListener onConfirmListener,
    double textFieldGapPadding,
    TextStyle titleTextStyle,
    BorderRadius textFieldBorderRadius,
    final String textFieldPrefixText,
    final TextStyle textFieldPrefixStyle,
    final String textFieldHintText,
    final TextStyle textFieldHintStyle,
  }) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return TextFieldAlertDialog(
            title: title,
            onConfirmListener: onConfirmListener,
            titleTextStyle: titleTextStyle,
            textFieldGapPadding: textFieldGapPadding,
            textFieldBorderRadius: textFieldBorderRadius,
            textFieldPrefixText: textFieldPrefixText,
            textFieldPrefixStyle: textFieldPrefixStyle,
            textFieldHintText: textFieldHintText,
            textFieldHintStyle: textFieldHintStyle,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: _DialogPage(
          title: this.title,
          onConfirmListener: onConfirmListener,
          titleTextStyle: titleTextStyle,
          textFieldGapPadding: textFieldGapPadding,
          textFieldBorderRadius: textFieldBorderRadius,
          textFieldPrefixText: textFieldPrefixText,
          textFieldPrefixStyle: textFieldPrefixStyle,
          textFieldHintText: textFieldHintText,
          textFieldHintStyle: textFieldHintStyle,
        ),
      ),
    );
  }
}

class _DialogPage extends StatefulWidget {
  final String title;
  final OnConfirmListener onConfirmListener;

  final TextStyle titleTextStyle;
  final double textFieldGapPadding;
  final BorderRadius textFieldBorderRadius;
  final String textFieldPrefixText;
  final TextStyle textFieldPrefixStyle;
  final String textFieldHintText;
  final TextStyle textFieldHintStyle;

  _DialogPage({
    this.title = "",
    this.onConfirmListener,
    this.titleTextStyle,
    this.textFieldGapPadding,
    this.textFieldBorderRadius = const BorderRadius.all(Radius.circular(5.0)),
    this.textFieldPrefixText,
    this.textFieldPrefixStyle,
    this.textFieldHintText,
    this.textFieldHintStyle,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DialogPageState();
  }
}

class _DialogPageState extends State<_DialogPage> {
  static double width = 384.0;
  static double height = 240.0 + 13.0;

  TextEditingController _textEditingController = new TextEditingController();

  final EdgeInsetsGeometry contentPadding =
      EdgeInsets.all(ScreenUtil().setWidth(24));
  final EdgeInsetsGeometry actionPadding = EdgeInsets.fromLTRB(
      ScreenUtil().setWidth(24),
      0,
      ScreenUtil().setWidth(24),
      ScreenUtil().setWidth(24));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(24),
                ScreenUtil().setWidth(24), ScreenUtil().setWidth(24), 0),
            child: Text(
              widget.title,
              style: widget.titleTextStyle != null
                  ? widget.titleTextStyle
                  : TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setWidth(22),
                      fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: contentPadding,
              child: Container(
                height: ScreenUtil().setWidth(62),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F1F6),
                  borderRadius: widget.textFieldBorderRadius ??
                      BorderRadius.circular(ScreenUtil().setWidth(5)),
//                 border: Border.all(color: Colors.white, width: 0.64),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil()
                        .setWidth(widget.textFieldGapPadding ?? 16)),
                child: Row(
                  children: [
                    Text(
                      widget.textFieldPrefixText ?? "商品数量",
                      style: widget.textFieldPrefixStyle ??
                          TextStyle(
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
                        onChanged: (value) {
//                              _username.text = value;
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: widget.textFieldHintText ?? "请点击输入",
                            hintStyle: widget.textFieldHintStyle ??
                                TextStyle(
                                  fontSize: ScreenUtil().setSp(22),
                                  color: Color(0xFF999999),
                                )),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            margin: actionPadding,
            color: Colors.amber,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.all(0),
              buttonHeight: ScreenUtil().setWidth(52),
              buttonMinWidth: ScreenUtil().setWidth(156),
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '取消',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.normal),
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
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.onConfirmListener(_textEditingController.text);
                  },
                  child: Text(
                    '确定',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.normal),
                  ),
                  color: Color(0xffEF5D44),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(5)),
                    side: BorderSide(color: Color(0xffEF5D44)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

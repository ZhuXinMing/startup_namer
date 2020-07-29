import 'package:flutter/material.dart';
///
///   @Name    : startup_namer/ textField_alert_dialog
///   @author  : simon
///   @date    : 2020/7/23 4:55 PM
///   @desc    :
///   @version : 1.0

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:startupnamer/widgets/text_number_limit_formatter.dart';

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

  final double maxNum;
  final double minNum;


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
    this.maxNum,
    this.minNum
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
    final double maxNum,
    final double minNum
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
            maxNum: maxNum,
            minNum: minNum,
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
          maxNum: maxNum,
          minNum: minNum,
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
  final double maxNum;
  final double minNum;

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
    this.maxNum,
    this.minNum
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DialogPageState();
  }
}

class _DialogPageState extends State<_DialogPage> {
  static double width = 384.0;
  static double height = 240.0;

  TextEditingController _textEditingController = new TextEditingController();

  final EdgeInsetsGeometry contentPadding =
  EdgeInsets.all(ScreenUtil().setWidth(24));

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
//        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(24),
                ScreenUtil().setWidth(24),
                ScreenUtil().setWidth(24),
                0),
            child: Text(
              widget.title,
              style: widget.titleTextStyle != null
                  ? widget.titleTextStyle
                  : TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setWidth(22),
                  fontWeight: FontWeight.w500),
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
                          color: Color(0xFF333333),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [TextNumberLimitFormatter(5,2)],
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
            margin: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(24),
                0,
                ScreenUtil().setWidth(24),
                0),
//            color: Colors.amber,
            height:ScreenUtil().setWidth(52) ,
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
                  onPressed: () {_onButtonAction();},
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

  _onButtonAction(){
    String text = _textEditingController.text;
    if(text.isEmpty){
      return;
    }
    double num = double.parse(text);
    if(widget.maxNum != null && widget.maxNum<num){
      showCenterShortToast(msg:"已达该商品库存量");
      return;
    }
    if(widget.minNum != null && widget.minNum>num){
      showCenterShortToast(msg:"已达最小量");
      return;
    }
    Navigator.pop(context);
    widget.onConfirmListener(_textEditingController.text);
    return;
  }

  void showCenterShortToast({String msg}) {
    Fluttertoast.showToast(
        msg:msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

}

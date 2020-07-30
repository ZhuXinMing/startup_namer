import 'dart:ui';

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
  final Widget title;
  // 如果没有title标题，则不会提供填充，否则，此填充被使用。EdgeInsets.fromLTRB(24.0, 24.0, 24.0, content == null ? 20.0 : 0.0)
  final EdgeInsetsGeometry titlePadding;
  final TextStyle titleTextStyle;

  //内容
  final Widget content;
  //内容周围的填充。默认EdgeInsets.all(ScreenUtil().setWidth(24));
  final EdgeInsetsGeometry contentPadding;
  //此[AlertDialog]的[content]中的Text的样式。If null, [DialogTheme.contentTextStyle] 被使用,
  // if that's null, 默认值是[ThemeData.textTheme.subtitle1].
  final TextStyle contentTextStyle;

  //确定事件回调
  @required
  final OnConfirmListener onConfirmListener;

  //在对话框底部显示的(可选的)操作集。
  final List<Widget> actions;

  //事件按钮集合的padding
  final EdgeInsetsGeometry actionsPadding;

  //弹窗内容背景颜色
  final Color backgroundColor;

  //弹窗距离屏幕的padding;EdgeInsets.symmetric(horizontal: 30)
  final EdgeInsets insetPadding;

  //设置弹窗边框，默认圆角5；
  final ShapeBorder shape;

  List<ZXCustomTextField>textFields = List();

  TextFieldAlertDialog(
      {Key key,
      this.title,
      this.titlePadding,
      this.titleTextStyle,
      this.onConfirmListener,
      this.content,
      this.contentPadding,
      this.contentTextStyle,
      this.actions,
      this.actionsPadding,
      this.backgroundColor,
      this.insetPadding = const EdgeInsets.symmetric(horizontal: 32.0),
      this.shape = const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0))),
      })
      : super(key: key);

  static showTextFieldAlert({
    @required BuildContext context,
    @required Widget title,
    final EdgeInsetsGeometry titlePadding,
    final TextStyle titleTextStyle,
    final Widget content,
    final EdgeInsetsGeometry contentPadding,
    final TextStyle contentTextStyle,
    final List<Widget> actions,
    EdgeInsetsGeometry actionsPadding,
    final Color backgroundColor,
    final EdgeInsets insetPadding =
        const EdgeInsets.symmetric(horizontal: 32.0),
    @required OnConfirmListener onConfirmListener,
    final ShapeBorder shape = const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0))),
    final ZXCustomTextField textField,
  }) {

    TextFieldAlertDialog dialog = TextFieldAlertDialog(
      title: title,
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle,
      content: content,
      contentPadding: contentPadding,
      contentTextStyle: contentTextStyle,
      onConfirmListener: onConfirmListener,
      actions: actions,
      actionsPadding: actionsPadding,
      backgroundColor: backgroundColor,
      insetPadding: insetPadding,
      shape: shape,
    );
    dialog.addTextFieldWithConfigurationHandler(textField,null);

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  void addTextFieldWithConfigurationHandler(ZXCustomTextField textField1, void f( ZXCustomTextField textField)){

    if(textField1 != null){
      textFields.add(textField1);
    }else{
      ZXCustomTextField field = ZXCustomTextField();
      textFields.add(field);
      f(field);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: _DialogPage(
            title: this.title,
            titlePadding: titlePadding,
            titleTextStyle: titleTextStyle,
            content: content,
            contentPadding: contentPadding,
            contentTextStyle: contentTextStyle,
            onConfirmListener: onConfirmListener,
            actions: actions,
            actionsPadding: actionsPadding,
            backgroundColor: backgroundColor,
            insetPadding: insetPadding,
          textFields: textFields,
        ),
      ),
    );
  }
}

class _DialogPage extends StatefulWidget {
  final Widget title;
  final EdgeInsetsGeometry titlePadding;
  final TextStyle titleTextStyle;
  final Widget content;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle contentTextStyle;

  final List<Widget> actions;
  final EdgeInsetsGeometry actionsPadding;
  final OnConfirmListener onConfirmListener;
  final Color backgroundColor;
  final EdgeInsets insetPadding;
  final ShapeBorder shape;

  final List<ZXCustomTextField>textFields;

  _DialogPage(
      {this.title,
      this.titleTextStyle,
      this.titlePadding,
      this.content,
      this.contentPadding,
      this.contentTextStyle,
      this.actions,
      this.actionsPadding,
      this.onConfirmListener,
      this.backgroundColor,
      this.insetPadding,
      this.shape,
        this.textFields
      });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DialogPageState();
  }
}

class _DialogPageState extends State<_DialogPage> {
  final EdgeInsetsGeometry contentPadding =
      EdgeInsets.all(ScreenUtil().setWidth(24));

  final EdgeInsetsGeometry textFieldPadding = EdgeInsets.fromLTRB(
      ScreenUtil().setWidth(24),
      0,
      ScreenUtil().setWidth(24),
      ScreenUtil().setWidth(24));

  static EdgeInsetsGeometry actionsPadding = EdgeInsets.fromLTRB(
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
    final DialogTheme dialogTheme = DialogTheme.of(context);
    final ThemeData theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    print('size = $size');
    //标题默认样式
    TextStyle defaultTitleTextStyle = TextStyle(
        color: Colors.black,
        fontSize: ScreenUtil().setWidth(22),
        fontWeight: FontWeight.w500);

    Widget titleWidget;
    if (widget.title != null) {
      titleWidget = Padding(
        padding: widget.titlePadding ??
            EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(24),
                ScreenUtil().setWidth(24),
                ScreenUtil().setWidth(24),
                widget.content == null ? ScreenUtil().setWidth(24) : 0.0),
        child: DefaultTextStyle(
            style: widget.titleTextStyle ?? defaultTitleTextStyle,
            child: widget.title),
      );
    }
    Widget contentWidget;
    if (widget.content != null) {
      contentWidget = Padding(
          padding: widget.contentPadding ?? contentPadding,
          child: DefaultTextStyle(
              style: widget.contentTextStyle ??
                  dialogTheme.contentTextStyle ??
                  theme.textTheme.subtitle1,
              child: widget.content));
    }

    Widget textFieldsWidget;
    if(widget.textFields != null && widget.textFields.length >0){
      List textFieldsPadding = widget.textFields.map((e) =>
          Padding(
            padding: widget.contentPadding ?? textFieldPadding,
            child: e,
          )
      ).toList();

      textFieldsWidget = Column(
        children: textFieldsPadding,
      );
    }

    Widget actionsWidget;
    if (widget.actions != null) {
      actionsWidget = Padding(
        padding: widget.actionsPadding ?? actionsPadding,
        child: ButtonBar(
//          默认EdgeInsets.symmetric(horizontal: 8)
          buttonPadding: EdgeInsets.symmetric(horizontal: 0),
          //默认是[MainAxisAlignment.end]
          alignment: widget.actions.length > 1
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
//          overflowDirection:actionsOverflowDirection,
//          overflowButtonSpacing: actionsOverflowButtonSpacing,
          children: widget.actions,
        ),
      );
    } else {
      List<Widget> _buttons = <Widget>[
        UIAlertAction(
          style: UIAlertActionStyle.UIAlertActionStyleCancel,
          handler: (action){
            Navigator.pop(context);
          },
        ),
        UIAlertAction(
            style: UIAlertActionStyle.UIAlertActionStyleDefault,
            handler: (action) {
              _onButtonAction();
            }),
      ];
      actionsWidget = Container(
        margin: widget.actionsPadding ?? actionsPadding,
//            color: Colors.amber,
        height: ScreenUtil().setWidth(52),
        child: ButtonBar(
          alignment: _buttons.length > 1
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          buttonPadding: EdgeInsets.symmetric(horizontal: 0),
          buttonHeight: ScreenUtil().setWidth(52),
          buttonMinWidth: ScreenUtil().setWidth(156),
          children: _buttons,
        ),
      );
    }

    //不要设置容器内容高度，使用MainAxisSize.min
    Widget dialogChild = Column(
      mainAxisSize: MainAxisSize.min,
//        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        titleWidget ?? SizedBox(),
        contentWidget ?? SizedBox(),
        textFieldsWidget ?? SizedBox(),
        actionsWidget
      ],
    );

    return Dialog(
        backgroundColor: widget.backgroundColor ?? Colors.white,
        insetPadding: widget.insetPadding,
        child: dialogChild,
        shape: widget.shape);

    Widget dialogChild2 = Container(
      width: size.width -
          EdgeInsets.symmetric(horizontal: 30).left -
          EdgeInsets.symmetric(horizontal: 30).right,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
//        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          titleWidget ?? SizedBox(),
          contentWidget ?? SizedBox(),
          actionsWidget
        ],
      ),
    );
    return Material(
      child: dialogChild2,
    );
  }

  _onButtonAction() {
    if (widget.content is ZXCustomTextField) {
      ZXCustomTextField textField = widget.content as ZXCustomTextField;

      String text = textField.controller.text;
      if (text.isEmpty) {
        return;
      }
      double num = double.parse(text);
      if (textField.maxNum != null && textField.maxNum < num) {
        showCenterShortToast(msg: "已达该商品库存量");
        return;
      }
      if (textField.minNum != null && textField.minNum > num) {
        showCenterShortToast(msg: "已达最小量");
        return;
      }
      Navigator.pop(context);
      widget.onConfirmListener(textField.controller.text);
    } else {
      Navigator.pop(context);
    }
  }

  void showCenterShortToast({String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }
}

/*
按钮事件

 */

enum UIAlertActionStyle {
  UIAlertActionStyleDefault,
  UIAlertActionStyleCancel,
}

class UIAlertAction extends StatelessWidget {
  final String title;
  final UIAlertActionStyle style;
  final bool enabled;
  final Function(UIAlertAction action) handler;

  const UIAlertAction(
      {this.title,
      this.style = UIAlertActionStyle.UIAlertActionStyleDefault,
      this.enabled = true,
      this.handler});

  String _getButtonTitle(UIAlertActionStyle style) {
    if (style == UIAlertActionStyle.UIAlertActionStyleCancel) {
      return '取消';
    }
    return '确定';
  }

  @override
  Widget build(BuildContext context) {
    Widget cancleButton;

    cancleButton = RaisedButton(
      onPressed: () {
        handler(this);
        if (style == UIAlertActionStyle.UIAlertActionStyleCancel) {
        }
      },
      child: Text(
        title ?? _getButtonTitle(style),
        style: TextStyle(
            fontSize: ScreenUtil().setSp(20), fontWeight: FontWeight.normal),
      ),
      color: Colors.white,
      elevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      textColor: Color(0xFF333333),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
        side: BorderSide(color: Color(0xffCCCCCC), width: 1),
      ),
    );

    Widget defaultButton;

    defaultButton = RaisedButton(
      onPressed: () {
        handler(this);
      },
      child: Text(
        title ?? _getButtonTitle(style),
        style: TextStyle(
            fontSize: ScreenUtil().setSp(20), fontWeight: FontWeight.normal),
      ),
      color: Color(0xffEF5D44),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
        side: BorderSide(color: Color(0xffEF5D44)),
      ),
    );

    Widget alertAction() {
      if (style == UIAlertActionStyle.UIAlertActionStyleCancel) {
        return cancleButton;
      }
      return defaultButton;
    }

    return Material(
      child: alertAction(),
    );
  }
}

/*
自定义TextField
 */

class ZXCustomTextField extends StatefulWidget {
  //自定义textField边界距离两边的水平填充
  final double gapPadding;
  //自定义textField边框
  final BorderRadius borderRadius;
  //自定义textField前置文本
  final String prefixText;
  final TextStyle prefixStyle;
  //自定义textField占位符字符串
  final String hintText;
  final TextStyle hintStyle;

  final double maxNum;
  final double minNum;
  final TextEditingController controller;

   ZXCustomTextField({
    Key key,
    this.gapPadding,
    this.borderRadius,
    this.prefixText,
    this.prefixStyle,
    this.hintText,
    this.hintStyle,
    this.maxNum,
    this.minNum,
    TextEditingController controller,
  })  : this.controller = controller ?? TextEditingController(),
        super(key: key) {
    print('');
  }

  @override
  _ZXCustomTextFieldState createState() => _ZXCustomTextFieldState();
}

class _ZXCustomTextFieldState extends State<ZXCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(62),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF2F1F6),
        borderRadius: widget.borderRadius ??
            BorderRadius.circular(ScreenUtil().setWidth(5)),
//                 border: Border.all(color: Colors.white, width: 0.64),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(widget.gapPadding ?? 16)),
      child: Row(
        children: [
          Text(
            widget.prefixText ?? "",
            style: widget.prefixStyle ??
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
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [TextNumberLimitFormatter(5, 2)],
              controller: widget.controller,
              onChanged: (value) {
//                              _username.text = value;
              },
              decoration: InputDecoration.collapsed(
                  hintText: widget.hintText ?? "请点击输入",
                  hintStyle: widget.hintStyle ??
                      TextStyle(
                        fontSize: ScreenUtil().setSp(22),
                        color: Color(0xFF999999),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

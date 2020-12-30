///
///   @Name    : startup_namer/ alert_controller_dialog
///   @author  : simon
///   @date    : 2020/7/23 4:55 PM
///   @desc    :
///   @version : 1.0

// 2020.10.16修改;
//2020.10.20 修改回调事件的判断；
//2020.10.23 优化功能，修复bug；
// 10.26 使用row和column排列按钮，支持3个按钮；

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef OnConfirmListener = Function(String text);

class UIAlertControllerDialog extends Dialog {
  @required
  final Widget title;

  // 如果没有title标题，则不会提供填充，否则，此填充被使用。EdgeInsets.fromLTRB(24.0, 24.0, 24.0, content == null ? 20.0 : 0.0)
  final EdgeInsetsGeometry titlePadding;

  //内容
  final Widget content;

  //内容周围的填充。默认EdgeInsets.all(ScreenUtil().setWidth(24));
  final EdgeInsetsGeometry contentPadding;

  //此[AlertDialog]的[content]中的Text的样式。If null, [DialogTheme.contentTextStyle] 被使用,
  // if that's null, 默认值是[ThemeData.textTheme.subtitle1].
  final TextStyle contentTextStyle;

  //在对话框底部显示的(可选的)操作集。
  final List<Widget> actions;

  //事件按钮容器的margin
  final EdgeInsetsGeometry actionsContainerMargin;

  //弹窗内容背景颜色
  final Color backgroundColor;

  //弹窗距离屏幕的padding;EdgeInsets.symmetric(horizontal: 30)
  final EdgeInsets insetPadding;

  //设置弹窗边框，默认圆角5；
  final ShapeBorder shape;

  List<ZXCustomTextField> textFields = List();

  UIAlertControllerDialog({
    Key key,
    this.title,
    this.titlePadding,
    this.content,
    this.contentPadding,
    this.contentTextStyle,
    List<Widget> actions,
    this.actionsContainerMargin,
    this.backgroundColor,
    EdgeInsets insetPadding,
    ShapeBorder shape,
  })  : this.actions = actions ?? [],
        this.insetPadding =
            insetPadding ?? const EdgeInsets.symmetric(horizontal: 32.0),
        this.shape = shape ??
            const RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        super(key: key);




  // 警告弹窗;支持'取消'，'确定' 按钮，和按钮事件的回调；
  /*
            UIAlertControllerDialog.showGeneralAlert(context: context, title: '上报成功',doButtonTitle: '确认',doHandler: (UIAlertAction action){
            AppRouter().backUntil(context, Routes.inventoryTakingController);
          });
   */
  static showGeneralAlert({
    @required final BuildContext context,
    @required final String title,
    final TextStyle titleTextStyle,
    final EdgeInsetsGeometry titlePadding,
    final Widget content,
    final EdgeInsetsGeometry contentPadding,
    final TextStyle contentTextStyle,
    final String cancelButtonTitle,
    final Function(UIAlertAction action) cancelHandler,
    @required final String doButtonTitle,
    final Function(UIAlertAction action) doHandler,
  }) {

    TextStyle defaultTitleTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: ScreenUtil().setSp(24),
      color: Colors.black,
    );

    Widget titleWidget = Text(
      title,
      textAlign: TextAlign.center,
      style: titleTextStyle ?? defaultTitleTextStyle,
    );

    List<Widget> actions = [];
    if ((cancelButtonTitle != null && cancelButtonTitle.isNotEmpty) ||
        cancelHandler != null)  {
      UIAlertAction action1 = UIAlertAction(
          style: UIAlertActionStyle.UIAlertActionStyleCancel,
          title: cancelButtonTitle,
          handler: cancelHandler);
      actions.add(action1);
    }
    if ((doButtonTitle != null && doButtonTitle.isNotEmpty) ||
        doHandler != null) {
      UIAlertAction action2 = UIAlertAction(
          style: UIAlertActionStyle.UIAlertActionStyleDefault,
          title: doButtonTitle,
          handler: doHandler);
      actions.add(action2);
    }
    UIAlertControllerDialog dialog = UIAlertControllerDialog(
      title: titleWidget,
      titlePadding: titlePadding ??
          EdgeInsets.symmetric(
            vertical: ScreenUtil().setWidth(33),
            horizontal: ScreenUtil().setWidth(55),
          ),
      content: content,
      contentPadding: contentPadding,
      contentTextStyle: contentTextStyle,
      actions: actions,
    );
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  //弹窗：输入框TextField
  /*
  UIAlertControllerDialog.showTextFieldAlert(
          context: context,
          title: '请输入所需数量',
          cancelButtonTitle:'取消',
          doButtonTitle: '确定',
          doHandler:
              (UIAlertControllerDialog controller, UIAlertAction action) {
            ZXCustomTextField textField = controller.textFields[0];
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

            setState(() {
              widget.entries[index].changedNumber =
                  double.parse(textField.controller.text);
            });
          },
          textField: ZXCustomTextField(
            maxNum: widget.entries[index].sourceNumber,
            minNum: 0.01,
          ));
   */

  static showTextFieldAlert({
    @required BuildContext context,
    @required final String title,
    final TextStyle titleTextStyle,
    final EdgeInsetsGeometry titlePadding,
    final Widget content,
    final EdgeInsetsGeometry contentPadding,
    final TextStyle contentTextStyle,
    EdgeInsetsGeometry actionsContainerMargin,
    final Color backgroundColor,
    final EdgeInsets insetPadding,
    final ShapeBorder shape,
    final String cancelButtonTitle,
    final Function(UIAlertAction action) cancelHandler,
    @required final String doButtonTitle,
    final Function(UIAlertControllerDialog controller, UIAlertAction action)
    doHandler,
    final ZXCustomTextField textField,
  }) {

    TextStyle defaultTitleTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: ScreenUtil().setSp(24),
      color: Colors.black,
    );
    Widget titleWidget = Text(
      title,
      textAlign: TextAlign.center,
      style: titleTextStyle ?? defaultTitleTextStyle,
    );

    UIAlertControllerDialog dialog = UIAlertControllerDialog(
      title: titleWidget,
      titlePadding: titlePadding,
      content: content,
      contentPadding: contentPadding,
      contentTextStyle: contentTextStyle,
      actionsContainerMargin: actionsContainerMargin,
      backgroundColor: backgroundColor,
      insetPadding: insetPadding,
      shape: shape,
    );

    if ((cancelButtonTitle != null && cancelButtonTitle.isNotEmpty) ||
        cancelHandler != null) {
      UIAlertAction action1 = UIAlertAction(
          style: UIAlertActionStyle.UIAlertActionStyleCancel,
          title: cancelButtonTitle,
          handler: cancelHandler);
      dialog.addAction(action1);
    }
    if ((doButtonTitle != null && doButtonTitle.isNotEmpty) ||
        doHandler != null) {
      UIAlertAction action2 = UIAlertAction(
          style: UIAlertActionStyle.UIAlertActionStyleDefault,
          title: doButtonTitle,
          defaultActionDismiss: false,
          handler: (UIAlertAction action) {
            doHandler(dialog, action);
          });
      dialog.addAction(action2);
    }

    dialog.addTextFieldWithConfigurationHandler(
        textField1: textField,
        configurationHandler: (ZXCustomTextField textField) {});

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  ////实例方法-添加textField
  void addTextFieldWithConfigurationHandler(
      {ZXCustomTextField textField1,
        void configurationHandler(ZXCustomTextField textField)}) {
    if (textField1 != null) {
      textFields.add(textField1);
      if (configurationHandler != null) {
        configurationHandler(textField1);
      }
    } else {
      ZXCustomTextField field = ZXCustomTextField();
      textFields.add(field);
      if (configurationHandler != null) {
        configurationHandler(field);
      }
    }
  }

  //实例方法-添加action按钮
  void addAction(UIAlertAction action) {
    actions.add(action);
  }

  //实例方法-
  void showCenterShortToast({String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: _DialogPage(
          title: this.title,
          titlePadding: titlePadding,
          content: content,
          contentPadding: contentPadding,
          contentTextStyle: contentTextStyle,
          actions: actions,
          actionsContainerMargin: actionsContainerMargin,
          backgroundColor: backgroundColor,
          insetPadding: insetPadding,
          textFields: textFields,
          shape: shape,
        ),
      ),
    );
  }
}

class _DialogPage extends StatefulWidget {
  final Widget title;
  final EdgeInsetsGeometry titlePadding;
  final Widget content;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle contentTextStyle;

  final List<Widget> actions;
  final EdgeInsetsGeometry actionsContainerMargin;

  final Color backgroundColor;
  final EdgeInsets insetPadding;
  final ShapeBorder shape;

  final List<ZXCustomTextField> textFields;

  _DialogPage(
      {this.title,
        this.titlePadding,
        this.content,
        this.contentPadding,
        this.contentTextStyle,
        this.actions,
        this.actionsContainerMargin,
        this.backgroundColor,
        this.insetPadding,
        this.shape,
        this.textFields});

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

  static EdgeInsetsGeometry actionsContainerMargin = EdgeInsets.fromLTRB(
      ScreenUtil().setWidth(24),
      0,
      ScreenUtil().setWidth(24),
      ScreenUtil().setWidth(24));

  static RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(
      borderRadius:
      BorderRadius.all(Radius.circular(ScreenUtil().setWidth(5))));

  //按钮高度
  static double _buttonHeight = ScreenUtil().setWidth(52);

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
        fontSize: ScreenUtil().setSp(22),
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
        child:
        DefaultTextStyle(style: defaultTitleTextStyle, child: widget.title),
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
    if (widget.textFields != null && widget.textFields.length > 0) {
      List textFieldsPadding = widget.textFields
          .map((e) => Padding(
        padding: widget.contentPadding ?? textFieldPadding,
        child: e,
      ))
          .toList();

      textFieldsWidget = Column(
        children: textFieldsPadding,
      );
    }

    Widget _buttonBarRow(double minWidth){
      return Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                minWidth: minWidth,
                height: _buttonHeight,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: widget.actions
                .map((e) => Container(
              height: _buttonHeight,
              child: e,
            )).toList(),
          )
      );
    }

    Widget _buttonBarColumn(double minWidth){

      List actionList =  widget.actions
          .map((e){
        EdgeInsets margin;
        if(widget.actions.indexOf(e) == 0){
          margin = EdgeInsets.zero;
        }else{
          margin = EdgeInsets.only(top: ScreenUtil().setWidth(12));
        }
        return Container(
          margin: margin,
          height: _buttonHeight,
          child: e,
        );
      }).toList();

      return Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                minWidth: minWidth,
                height: _buttonHeight,
              )),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children:actionList
          )
      );
    }

    Widget actionsWidget;
    if (widget.actions != null && widget.actions.length > 0) {

//      List actionList = widget.actions
//          .map((e) => Container(
//        height: _buttonHeight,
//        child: e,
//      )).toList();
//
//      actionsWidget = Container(
//        color: Colors.green,
//        margin: widget.actionsContainerMargin ?? actionsContainerMargin,
//        child: LayoutBuilder(
//          builder: (context, constraints) {
//            return ButtonBar(
////          默认EdgeInsets.symmetric(horizontal: 8)
//              buttonPadding: EdgeInsets.zero,
//              buttonMinWidth: widget.actions.length == 2
//                  ? (constraints.maxWidth - ScreenUtil().setWidth(24)) / 2
//                  : constraints.maxWidth,
//              buttonHeight: _buttonHeight,
//              //默认是[MainAxisAlignment.end]
//              alignment: widget.actions.length > 1
//                  ? MainAxisAlignment.spaceBetween
//                  : MainAxisAlignment.center,
//              children: actionList,
//            );
//          },
//        ),
//      );

      actionsWidget = Container(
//        color: Colors.green,
        margin: widget.actionsContainerMargin ?? actionsContainerMargin,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return widget.actions.length == 2 ? _buttonBarRow((constraints.maxWidth - ScreenUtil().setWidth(24)) / 2)
                :_buttonBarColumn(constraints.maxWidth);
          },
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
        actionsWidget ?? SizedBox()
      ],
    );

    return Dialog(
        backgroundColor: widget.backgroundColor ?? Colors.white,
        insetPadding: widget.insetPadding,
        child: dialogChild,
        shape: widget.shape ?? _defaultDialogShape);

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

  //默认点击关闭弹窗
  final bool defaultActionDismiss;

  const UIAlertAction(
      {this.title,
        this.style = UIAlertActionStyle.UIAlertActionStyleDefault,
        this.enabled = true,
        this.handler,
        this.defaultActionDismiss = true});

  String _getButtonTitle(UIAlertActionStyle style) {
    if (style == UIAlertActionStyle.UIAlertActionStyleCancel) {
      return '取消';
    }
    return '确定';
  }

  @override
  Widget build(BuildContext context) {
    Widget cancelButton;

    cancelButton = RaisedButton(
      onPressed: () {
        if (defaultActionDismiss == true) {
          Navigator.pop(context);
        }
        if (handler != null) {
          handler(this);
        }
        if (style == UIAlertActionStyle.UIAlertActionStyleCancel) {}
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
        if (defaultActionDismiss == true) {
          Navigator.pop(context);
        }
        if (handler != null) {
          handler(this);
        }
      },
      child: Text(
        title ?? _getButtonTitle(style),
        style: TextStyle(
            fontSize: ScreenUtil().setSp(20), fontWeight: FontWeight.normal),
      ),
      color: Color(0xffEF5D44),
      textColor: Colors.white,
      elevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
        side: BorderSide(color: Color(0xffEF5D44)),
      ),
    );

    Widget alertActionItem() {
      if (style == UIAlertActionStyle.UIAlertActionStyleCancel) {
        return cancelButton;
      }
      return defaultButton;
    }

    return Material(
      child: alertActionItem(),
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
//              inputFormatters: [TextNumberLimitFormatter(5, 2)],
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

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:startupnamer/utils/utils.dart';
import 'package:startupnamer/widgets/index.dart';

import 'package:startupnamer/res/colors.dart';

/*Example:
                        Container(
                        width: ScreenUtil().setWidth(400),
                        height: ScreenUtil().setWidth(70),
                        child: RoundFormField(
                          titleText: Strings.reported_location,
                          fontSizeText: 24.0,
                          isCanInput: false,
                          frontColor: Colours.color_F2F1F6,
                          isShowClean: true,
                          isShowRightImage: true,
                          rightImage:Image.asset( Utils.getImgPath('icon_triangle_down')),
                          textEditingController: _reportedLocationController,
                          checkCallback: (value) {
                            setState(() {});
                          },
                          onTap: (){
                            print('页面点击了');
                          },
                        ),
                      ),*/

/// 自定义的圆框表单字段组件。
class CHSFormField extends StatefulWidget {
  /// 字段内的提示文字。
  final String hintText;

  final double fontSizeText;

  /// 标题
  final String titleText;

  ///所填文字
  final String frontText;

  ///边框颜色
  final Color fieldBorderColor;

  ///输入框颜色
  final Color frontColor;

  /// 右部图片
  final Image rightImage;

  ///右部文字
  final String rightText;

  ///右部文字
  final Color rightTextColor;

  /// 是否显示取消按钮
  bool isShowClean;

  ///左部提醒标识
  bool isShowAttation;

  ///是否可以输入
  bool isCanInput;

  ///是否显示右部图片
  bool isShowRightImage;

  /// 文本字段的控制器。
  final TextEditingController textEditingController;

  /// 文本字段修改时的回调函数。
  final Function checkCallback;

  final GestureTapCallback onTap;

  ///监听焦点
  final void Function(bool focus) onFocusListener;

  ///限制只能输入小数
  final bool limitDecimal;

  CHSFormField({
    this.titleText,
    this.hintText,
    this.frontText,
    this.fontSizeText,
    this.isShowClean = false,
    this.textEditingController,
    this.checkCallback,
    this.fieldBorderColor,
    this.isShowRightImage = false,
    this.rightImage,
    this.frontColor,
    this.rightText,
    this.rightTextColor,
    this.isShowAttation = false,
    this.isCanInput = true,
    this.onTap,
    this.onFocusListener,
    this.limitDecimal = false,
  }) : assert(textEditingController != null);

  @override
  _RoundFormFieldState createState() => _RoundFormFieldState();
}

/// 与自定义的圆框表单字段组件关联的状态子类。
class _RoundFormFieldState extends State<CHSFormField> {
  TextEditingController _name = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (widget.onFocusListener != null) {
        widget.onFocusListener(_focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: widget.frontColor ?? ResColor.color_white,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
              height: 40,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16.0),
              margin: const EdgeInsets.only(left: 16.0),
              child: Text(
                widget.titleText,
                style: TextStyle(
                  color: ResColor.color_333,
                  fontSize: ScreenUtil().setSp(widget.fontSizeText ?? 32.0),
                ),
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil().setWidth(8.0)),
              height: 30,
              width: MediaQuery.of(context).size.width * 2 / 3,
              alignment: Alignment.center,
              child: TextField(
                inputFormatters: widget.limitDecimal
                    ? [
                        //只允许输入小数
                        WhitelistingTextInputFormatter(RegExp("[0-9.]")),
                      ]
                    : null,
                keyboardType: widget.limitDecimal
                    ? TextInputType.numberWithOptions(decimal: true)
                    : null,
                focusNode: _focusNode,
                controller: widget.textEditingController,

                // 控制器属性，控制正在编辑的文本。
                cursorColor: const Color(0xFFFF6B47),
                // 光标宽度属性，光标的厚度，默认是2.0。
                cursorWidth: 2.0,
                // 样式属性，用于正在编辑的文本的样式。
                style: TextStyle(
                  color: Color(0xFF4A4A4A),
                  fontSize: ScreenUtil().setSp(widget.fontSizeText ?? 32.0),
                ),
                // 装饰（`decoration`）属性，在文本字段周围显示的装饰。
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5),
                  // 边框属性，装饰的容器周围绘制的形状。
                  border: InputBorder.none,
                  // 填充颜色属性，填充装饰容器的颜色。
                  fillColor: widget.frontColor ?? const Color(0xFFFFFFFF),
                  // 是密集属性，输入子项是否是密集形式的一部分（即使用较少的垂直空间）。
                  isDense: true,
                  // 填充属性，如果为`true`，则装饰的容器将填充fillColor颜色。
                  filled: true,
                  // 提示样式属性，用于提示文本（`hintText`）的样式。
                  hintStyle: TextStyle(
                    color: ResColor.color_ccc,
                    fontSize: ScreenUtil().setSp(widget.fontSizeText ?? 32.0),
                  ),
                  // 提示文本属性，提示字段接受哪种输入的文本。
                  hintText: widget.hintText,
                  suffixIcon: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        widget.isShowClean
                            ? IconButton(
                                icon: widget.isShowRightImage
                                    ? widget.rightImage
                                    : Image.asset(
                                        Utils.getImgPath('login_delete'),
                                        width: ScreenUtil().setHeight(32),
                                        height: ScreenUtil().setHeight(32),
                                      ),
                                onPressed:
                                    widget.isShowRightImage ? null : onCancel,
                              )
                            : widget.rightText != null
                                ? Text(widget.rightText,
                                    style: TextStyle(
                                        color: widget.rightTextColor ??
                                            const Color(0xFF333333),
                                        fontSize: ScreenUtil().setSp(
                                            widget.fontSizeText ?? 32.0)))
                                : Text(''),
                      ],
                    ),
                  ),
                ),
                // 在改变属性，当正在编辑的文本发生更改时调用。
                onChanged: (value) {
                  // 每次修改字段文本时都会调用一次。
                  widget.checkCallback(value);
                },
                onTap: () {
                  ///禁用输入  取消焦点
                  widget.isCanInput
                      ? null
                      : FocusScope.of(context).requestFocus(new FocusNode());

                  widget.isCanInput || widget.onTap == null
                      ? null
                      : widget.onTap();
                },
                enableInteractiveSelection: false,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  onCancel() {
    // 保证在组件build的第一帧时才去触发取消清空内
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.textEditingController.clear());
    setState(() {
      widget.isShowClean = false;
    });
  }
}

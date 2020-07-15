///
///   @Name    : merchant_driver/ label_badge
///   @author  : simon
///   @date    : 2020/7/13 5:53 PM
///   @desc    :
///   @version : 1.0
///

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';


class LabelBadge extends StatefulWidget {
  //高度
  final double height;
  //数量
  final int num;
  //背景色
  final Color backgroundColor;
  //文本样式
  TextStyle titleStyle;
  //边框
  final BoxBorder border;

  LabelBadge({
    Key key,
    double height,
    int num,
    Color backgroundColor,
    TextStyle titleStyle,
    this.border,
}):this.titleStyle = titleStyle ?? TextStyle(color: Colors.white,fontSize: ScreenUtil().setWidth(28)),
  this.height = height ?? ScreenUtil().setWidth(40),
  this.num = num ?? 0,
  this.backgroundColor = backgroundColor ??  Color(0xffFF861B),
        super(key: key);


  @override
  _LabelBadgeState createState() => _LabelBadgeState();
}

class _LabelBadgeState extends State<LabelBadge> {
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: widget.num == 0 ? true :false,
      child: Container(
        height: widget.height,
        constraints: BoxConstraints(minWidth: widget.height),
        alignment: Alignment.center,
        child: Text(
          widget.num > 99 ? "99+": widget.num.toString(),
          style: widget.titleStyle
        ),
        decoration: BoxDecoration(
          color:widget.backgroundColor,
          border: widget.border,
          borderRadius: BorderRadius.all(
            Radius.circular(widget.height/2),
          ),
        ),
        padding: widget.num < 10 ? EdgeInsets.zero :EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(widget.height/2+2)),
      ),
    );
  }
}

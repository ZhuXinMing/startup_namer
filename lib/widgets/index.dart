import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../res/colors.dart';
import '../widgets/load_container.dart';

class UI {
  ///项目icon资源
  static Widget icon(String name, {double width, double height, Color color}) {
    return Image.asset(
      'assets/icons/$name.png',
      fit: BoxFit.contain,
      width: width,
      height: height,
      color: color,
    );
  }

  ///项目image资源
  static Widget image(String name, {double width, double height, Color color}) {
    return Image.asset(
      'assets/images/$name.png',
      fit: BoxFit.contain,
      width: width,
      height: height,
      color: color,
    );
  }

  ///flat风格的按钮封装
  static Widget flatBtn(String text, {VoidCallback onPressed}) {
    return FlatButton(
        color: ResColor.BASE_COLOR,
        disabledColor: Color.fromRGBO(239, 93, 68, 0.4),
        onPressed: onPressed,
        child: Text(
          text,
          style:
              TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(24)),
        ));
  }

  ///outline风格的按钮封装
  static Widget outlineBtn(String text, {VoidCallback onPressed}) {
    return OutlineButton(
        highlightedBorderColor: Color(0xffe5e5e5),
        borderSide: BorderSide(
            color: Color(0xffe5e5e5), width: ScreenUtil().setWidth(1.5)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xff333333),
          ),
        ));
  }
  ///选择框
  static Widget checkbox(bool check) {
    return Container(
      width: ScreenUtil().setWidth(28),
      height: ScreenUtil().setWidth(28),
      decoration: BoxDecoration(
          color: check ? ResColor.BASE_COLOR : null,
          border: check
              ? null
              : Border.all(
                  color: Color(0xff999999), width: ScreenUtil().setWidth(1.5)),
          shape: BoxShape.circle),
      alignment: Alignment.center,
      child: check
          ? Icon(
              Icons.check,
              color: Colors.white,
              size: ScreenUtil().setWidth(20),
            )
          : null,
    );
  }

  ///无数据
  static Widget noData() => NoDataWidget();

  ///Text overflow属性 省略号、零宽空格解决长字母、数字串整体显示省略号问题
  static String breakWord(String word) {
    if (word == null || word.isEmpty) {
      return word;
    }
    String breakWord = ' ';
    word.runes.forEach((element) {
      breakWord += String.fromCharCode(element);
      breakWord += '\u200B';
    });
    return breakWord;
  }
}

mixin StateObserver<T> {
  void onNotifyData({T data});
}

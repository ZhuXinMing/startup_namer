///
///   @Name    : startup_namer/ LogUtil
///   @author  : simon
///   @date    : 2020/7/15 3:12 PM
///   @desc    :
///   @version : 1.0

import 'package:flutter/cupertino.dart';

//简介：解决Flutter日志过长导致输出不完整问题；大部分展示好的，但是一部分依然有bug？
/*
///是否在生产环境
	///const bool isDebug = !const bool.fromEnvironment("dart.vm.product");

	//参数可选 isDebug默认true limitLength默认800
	LogUtil.init(title: "来自LogUtil", isDebug: isDebug,limitLength:800);

	var log = "我是日志";
	//仅在Debug时打印
	LogUtil.d(log);
	LogUtil.d("我是日志");

	//在所有环境中打印
	LogUtil.v(log);
	LogUtil.v("我是日志");
 */



class LogUtil {
  static var _separator = "=";
  static var _split =
      "$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator";
  static var _title = "Yl-Log";
  static var _isDebug = true;
  static int _limitLength = 800;
  static String _startLine = "$_split$_title$_split";
  static String _endLine = "$_split$_separator$_separator$_separator$_split";

  //参数可选 isDebug默认true limitLength默认800
  static void init({String title, @required bool isDebug,int limitLength}) {
    _title = title;
    _isDebug = isDebug;
    _limitLength = limitLength??=_limitLength;
    _startLine = "$_split$_title$_split";
    var endLineStr = StringBuffer();
    var cnCharReg = RegExp("[\u4e00-\u9fa5]");
    for (int i = 0; i < _startLine.length; i++) {
      if (cnCharReg.stringMatch(_startLine[i]) != null) {
        endLineStr.write(_separator);
      }
      endLineStr.write(_separator);
    }
    _endLine = endLineStr.toString();
  }

  //仅Debug模式可见
  static void d(dynamic obj) {
    if (_isDebug) {
      _log(obj.toString());
    }
  }

  static void v(dynamic obj) {
    _log(obj.toString());
  }

  static void _log(String msg) {
    print("$_startLine");
    _logEmpyLine();
    if(msg.length<_limitLength){
      print(msg);
    }else{
      segmentationLog(msg);
    }
    _logEmpyLine();
    print("$_endLine");
  }

  static void segmentationLog(String msg) {
    var outStr = StringBuffer();
    for (var index = 0; index < msg.length; index++) {
      outStr.write(msg[index]);
      if (index % _limitLength == 0 && index!=0) {
        print(outStr);
        outStr.clear();
        var lastIndex = index+1;
        if(msg.length-lastIndex<_limitLength){
          var remainderStr = msg.substring(lastIndex,msg.length);
          print(remainderStr);
          break;
        }
      }
    }
  }

  static void _logEmpyLine(){
    print("");
  }
}

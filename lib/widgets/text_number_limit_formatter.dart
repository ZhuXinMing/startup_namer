///
///   @Name    : startup_namer/ text_number_limit_formatter
///   @author  : simon
///   @date    : 2020/7/28 9:25 PM
///   @desc    :
///   @version : 1.0

import 'package:flutter/services.dart';

///数字输入的精确控制
class TextNumberLimitFormatter extends TextInputFormatter {
  //小数点后
  int _declen;
  //小数点前
  int _intlen;

  TextNumberLimitFormatter(this._intlen,this._declen);

  RegExp exp = new RegExp("[0-9.]");
  static const String POINTER = ".";
  static const String ZERO = "0";

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    ///输入完全删除
    if (newValue.text.isEmpty) {
      return TextEditingValue();
    }

    //只允许输入数字和小数点
    if (!exp.hasMatch(newValue.text)) {
      return oldValue;
    }

    ///包含小数点的情况
    if (newValue.text.contains(POINTER)) {
      //精度为0，即不含小数
      if(_declen==0)
        return oldValue;

      ///包含多个小数
      if (newValue.text.indexOf(POINTER) !=
          newValue.text.lastIndexOf(POINTER)) {
        return oldValue;
      }
      String input = newValue.text;
      int index = input.indexOf(POINTER);

      ///小数点前位数
      int lengthBeforePointer = input.substring(0, index).length;

      ///整数部分大于约定长度
      if (lengthBeforePointer > _intlen) {
        return oldValue;
      }
      ///小数点后位数
      int lengthAfterPointer = input.substring(index, input.length).length - 1;
      print('小数后位数'+lengthAfterPointer.toString());
      ///小数位大于精度
      if (lengthAfterPointer > _declen) {
        return oldValue;
      }

    } else if (
    //以点开头
    newValue.text.startsWith(POINTER)
        ||
        //如果第1位为0，并且长度大于1，排除00,01-09所有非法输入
        (newValue.text.startsWith(ZERO) && newValue.text.length>1)
        ||
        //如果整数长度超过约定长度
        newValue.text.length>_intlen
    ) {
      return oldValue;
    }
    return newValue;
  }
}
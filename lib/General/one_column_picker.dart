///
///   @Name    : startup_namer/ one_column_picker
///   @author  : simon
///   @date    : 2020/7/2 4:21 PM
///   @desc    :
///   @version : 1.0
///

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef OnConfirmListener = Function(int selectIndex);

// ignore: must_be_immutable
class OneColumnPicker extends StatelessWidget {

  @required final String title;
  @required final List titleArray;
  final double itemExtent;
  final String onButtonTitle;
  final OnConfirmListener onConfirmListener;

  var _selectIndex = 0;

  OneColumnPicker(
      {this.title,
      this.titleArray,
      this.itemExtent = 48.0,
      this.onButtonTitle = '确认',
      this.onConfirmListener});

  static void show(
      {@required BuildContext context,
      String title = '集货区选择',
      List titleArray = const ['0', '1', '2', '3'],
      String onButtonTitle = '查询',
      OnConfirmListener onConfirmListener}) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        builder: (BuildContext context) {
          return OneColumnPicker(
            title: title,
            titleArray: titleArray,
            onButtonTitle: onButtonTitle,
            onConfirmListener: onConfirmListener,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setWidth(412),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: ScreenUtil().setWidth(30 + 20 + 20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(22),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      iconSize: ScreenUtil().setWidth(30),
                      icon: Image.asset(
                        "assets/images/close_gray@2x.png",
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: CupertinoPicker.builder(
              itemExtent: ScreenUtil().setWidth(itemExtent),
              childCount: titleArray.length,
              onSelectedItemChanged: (int index) {
                _selectIndex = index;
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    titleArray[index],
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: ScreenUtil().setSp(28),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 2,
          ),
          Container(
            height: ScreenUtil().setWidth(80),
            padding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(12),
                ScreenUtil().setWidth(8),
                ScreenUtil().setWidth(12),
                ScreenUtil().setWidth(8)),
            child: InkWell(
                onTap: () {
                  print(_selectIndex);
                  Navigator.pop(context);
                  if (onConfirmListener != null) {
                    onConfirmListener(_selectIndex);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xffEF5D44),
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(5)),
                  ),
                  child: Text(
                    onButtonTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(24),
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

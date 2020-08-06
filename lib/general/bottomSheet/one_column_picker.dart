///
///   @Name    : startup_namer/ one_column_picker
///   @author  : simon
///   @date    : 2020/7/2 4:21 PM
///   @desc    :
///   @version : 1.0
///
/// 8.6 调整iconButtonPadding大小，增加用户体验；

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnConfirmListener = Function(int selectIndex);

/*
_presentOneColumnPicker() {

  OneColumnPicker.show(context: context, title: '标题', titleArray: ['1','2','3'], onConfirmListener: (int index){
    print("index = $index");
  });
}
*/

// ignore: must_be_immutable
class OneColumnPicker extends StatelessWidget {
  //标题
  @required
  final String title;
  //数据源文本数组
  @required
  final List<String> titleArray;
  //行高度
  final double itemExtent;
  //确定按钮文本
  final String onButtonTitle;
  //确认事件
  @required
  final OnConfirmListener onConfirmListener;

  var _selectIndex = 0;

  OneColumnPicker(
      {Key key,
      String title,
      List<String> titleArray,
      this.itemExtent = 64.0,
      String onButtonTitle,
      this.onConfirmListener})
      : this.title = title ?? "",
        this.titleArray = titleArray ?? [],
        this.onButtonTitle = onButtonTitle ?? '确认',
        super(key: key);

  static void show(
      {@required BuildContext context,
      @required String title,
      @required List<String> titleArray,
      String onButtonTitle,
      @required OnConfirmListener onConfirmListener}) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return OneColumnPicker(
            title: title,
            titleArray: titleArray,
            onButtonTitle: onButtonTitle,
            onConfirmListener: onConfirmListener,
          );
        });
  }

  //关闭按钮大小
  double closeIconSize = 30.0;
  //icon内间距,增大了12个像素，按钮大小 = IconSize + 2 * ButtonPadding，
  double iconButtonPadding = 8.0 + 12;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setWidth(412),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
//            color: Colors.amber,
            height: ScreenUtil().setWidth(20.0 + 30.0 + 20.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(22),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        0,
                        ScreenUtil().setWidth(20.0 - iconButtonPadding),
                        ScreenUtil().setWidth(20.0 - iconButtonPadding),
                        0),
//                    height:ScreenUtil().setWidth(closeIconSize + 2*iconButtonPadding),
//                    width:ScreenUtil().setWidth(closeIconSize + 2*iconButtonPadding),
//                    color: Colors.brown,
                    child: IconButton(
                        iconSize: ScreenUtil().setWidth(closeIconSize),
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                ScreenUtil().setWidth(iconButtonPadding),
                            vertical: ScreenUtil().setWidth(iconButtonPadding)),
                        constraints: BoxConstraints(),
                        icon: Image.asset(
                          "assets/images/close_gray@2x.png",
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
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

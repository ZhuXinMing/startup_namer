import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
///   @Name    : startup_namer/ one_column_picker
///   @author  : simon
///   @date    : 2020/7/2 4:21 PM
///   @desc    :
///   @version : 1.0
///
/// 8.13 支持设置初始选中索引属性；

import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnConfirmListener = Function(int selectIndex);

/*
  _tapDeliveryDateList() {
    if (this._sendDateList == null || this._sendDateList.length == 0) {
      ToastUtil.show(msg: '无日期/批次');
      return;
    }
    List<String> _titles = this
        ._sendDateList
        .map((e) => '${e.sendDate} ${e.expressBatchName}')
        .toList();
    OneColumnPicker.show(
        context: context,
        title: '日期/批次选择',
        initialItemIndex: this._sendDateSelectIndex,
        titleArray: _titles,
        onConfirmListener: (index) {
          this._editingController1.text = _titles[index];
          this._sendDateSelectIndex = index;
        });
  }
*/

// ignore: must_be_immutable
class OneColumnPicker extends StatefulWidget {
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

  //初始选中item索引,如果null，则默认0；
  final int initialItemIndex;

  OneColumnPicker({
    Key key,
    String title,
    List<String> titleArray,
    this.itemExtent = 64.0,
    String onButtonTitle,
    this.onConfirmListener,
    int initialItemIndex,
  })  : this.title = title ?? "",
        this.titleArray = titleArray ?? [],
        this.onButtonTitle = onButtonTitle ?? '确认',
        this.initialItemIndex = initialItemIndex ?? 0,
        super(key: key);

  static void show(
      {@required BuildContext context,
        @required String title,
        @required List<String> titleArray,
        String onButtonTitle,
        int initialItemIndex,
        @required OnConfirmListener onConfirmListener}) {
//    showCupertinoModalPopup(
//        context: context,
//        builder: (BuildContext context) {
//          return OneColumnPicker(
//            title: title,
//            titleArray: titleArray,
//            onButtonTitle: onButtonTitle,
//            onConfirmListener: onConfirmListener,
//            selectIndex: selectIndex,
//          );
//        });
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
            initialItemIndex: initialItemIndex,
          );
        });
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<OneColumnPicker> {
  FixedExtentScrollController _controller;
  //关闭按钮大小
  static double closeIconSize = 30.0;
  //icon内间距,增大了5个像素，按钮大小 = IconSize + 2 * ButtonPadding，
  static double iconButtonPadding = 8.0 + 5.0;

  var _selectIndex;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (mounted) {
      if (widget.initialItemIndex != null) {
        _controller =
            FixedExtentScrollController(initialItem: widget.initialItemIndex);
        _selectIndex = widget.initialItemIndex;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Container(
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
                      widget.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(22),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(
                          right:
                          ScreenUtil().setWidth(20.0 - iconButtonPadding)),
                      height: ScreenUtil()
                          .setWidth(closeIconSize + 2 * iconButtonPadding),
                      width: ScreenUtil()
                          .setWidth(closeIconSize + 2 * iconButtonPadding),
//                    color: Colors.brown,
                      child: IconButton(
                          iconSize: ScreenUtil().setWidth(closeIconSize),
                          padding: EdgeInsets.all(
                              ScreenUtil().setWidth(iconButtonPadding)),
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
              height: ScreenUtil().setWidth(10),
            ),
            Expanded(
              child: CupertinoPicker.builder(
                scrollController: _controller,
                itemExtent: ScreenUtil().setWidth(widget.itemExtent),
                childCount: widget.titleArray.length,
                onSelectedItemChanged: (int index) {
                  _selectIndex = index;
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.titleArray[index],
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
                    if (widget.onConfirmListener != null) {
                      widget.onConfirmListener(_selectIndex);
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
                      widget.onButtonTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(24),
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

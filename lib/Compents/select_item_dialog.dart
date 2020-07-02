//  Created by simon on 2020/6/18.


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 确认的回调
typedef OnConfirmListener = Function(int selectIndex);

class SelectItemDialog extends Dialog {
  final String title;
  final List<String> titleArray;
  final int selectIndex;
  final OnConfirmListener onConfirmListener;

  SelectItemDialog({this.title = "加工类型",
    this.titleArray = const ["全部", "标记", "非标"],
    this.selectIndex = 0,
    this.onConfirmListener});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
          child: SelectItemDialogPage(title: title,
              titleArray: titleArray,
              selectIndex: selectIndex,
              onConfirmListener: onConfirmListener)
      ),
    );
  }
}


// ignore: must_be_immutable
class SelectItemDialogPage extends StatefulWidget {
  final String title;
  final List<String> titleArray;
  int selectIndex;
  final OnConfirmListener onConfirmListener;

  SelectItemDialogPage({this.title, this.titleArray, this.selectIndex,
    this.onConfirmListener});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectItemDialogState();
  }
}

class SelectItemDialogState extends State<SelectItemDialogPage> {

   double width = 460;
   double height = 381;
   double topContentHeight = 71;
   double bottomBtnHeight = 70;

  List<Widget> _getListData() {
    List<Widget> list = List();

    for (var i = 0; i < widget.titleArray.length; i++) {
      InkWell btn = InkWell(
        onTap: () {
          setState(() {
            widget.selectIndex = i;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.selectIndex == i ? Color(0xffFF714A).withOpacity(0.19): Color(0xffF2F1F6),
            borderRadius: BorderRadius.circular(3.4),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.titleArray[i],
            style: TextStyle(
              color:widget.selectIndex == i ? Color(0xffFF714A): Color(0xff333333),
              fontSize: ScreenUtil().setSp(28),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
      list.add(btn);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double bottomContentHeight = height - topContentHeight - 10;

    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(height),
      decoration: BoxDecoration(
        color: const Color(0xff3F4251),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.loose,
              children: <Widget>[
                Align(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Color(0xffFEC791),
                      fontSize: ScreenUtil().setSp(28),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Container(
                      width: ScreenUtil().setWidth(52),
                      height: ScreenUtil().setWidth(topContentHeight),
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/icon_close.png",
                        width: ScreenUtil().setWidth(20),
                        height: ScreenUtil().setWidth(20),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(10), 0,
                ScreenUtil().setWidth(10), ScreenUtil().setWidth(10)),
            child: Container(
              color: Colors.white,
              height: ScreenUtil().setWidth(height - topContentHeight - 10),
              width: ScreenUtil().setWidth(width - 10 * 2),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: this._getListData(),
                      mainAxisSpacing: ScreenUtil().setWidth(10),
                      crossAxisSpacing: ScreenUtil().setWidth(10),
                      padding: EdgeInsets.fromLTRB(
                          ScreenUtil().setWidth(20),
                          ScreenUtil().setWidth(30),
                          ScreenUtil().setWidth(20),
                          0),
                      childAspectRatio: 195.0 / 70.0,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(30),
                  ),
                  Container(
                    height: ScreenUtil().setWidth(bottomBtnHeight + 20),
                    padding: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(20),
                        0,
                        ScreenUtil().setWidth(20),
                        ScreenUtil().setWidth(20)),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          widget.onConfirmListener(widget.selectIndex);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffFF714A),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "确定",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(28),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



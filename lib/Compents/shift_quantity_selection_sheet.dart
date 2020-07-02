///
///   @Name    : startup_namer/ shift_quantity_selection_sheet
///   @author  : simon
///   @date    : 2020/7/2 5:58 PM
///   @desc    :
///   @version : 1.0
//
//  逻辑没写；

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

typedef OnConfirmListener = Function(List entries);


class ShiftQuantitySelectionSheet extends StatelessWidget {

  @required final String title;
  @required final List entries;
  @required final OnConfirmListener onConfirmListener;

  ShiftQuantitySelectionSheet({
    this.title = '移位量选择',
    this.entries,
    this.onConfirmListener
  });

  static void showPickerView({
    @required BuildContext context,
    String title = '移位量选择',
    List entries = const['1', '2', '3', '4'],
    OnConfirmListener onConfirmListener
  }) {
    showModalBottomSheet(
        context: context,
        //设置形状
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return ShiftQuantitySelectionSheet(
            title: title,
            entries: entries,
            onConfirmListener: onConfirmListener,);
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setWidth(274),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: ScreenUtil().setWidth(46),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      iconSize: 20,
                      icon: Image.asset(
                        "assets/images/close_gray.png",
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
//          SizedBox(
//            height: 10,
//          ),
          Expanded(
            child: ListView.separated(
              itemCount: entries != null ? entries.length : 0,
              separatorBuilder:(BuildContext context, int index){
                return SizedBox(height: 2,);
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: ScreenUtil().setWidth(20 + 6 * 2),
                  padding: EdgeInsets.fromLTRB(13, 0, 7, 0),
                  decoration: BoxDecoration(
//                    color: Colors.white,
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(204),
                        child: Text(
                          "(123456)商品名称商品名称商品名称商品名称商品名称商品名称",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: ScreenUtil().setSp(12),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(child: SizedBox()),

                      Container(
                        width: ScreenUtil().setWidth(21.0 + 6 + 31.6 + 21.0 +
                            6),
                        height: ScreenUtil().setWidth(20.0 + 6 + 6),
                        color: Colors.amber,
                        child: Row(
//                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              child: Container(
                                  height: ScreenUtil().setWidth(20.0 + 6 * 2),
                                  width: ScreenUtil().setWidth(21 + 6),
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    width: ScreenUtil().setWidth(21),
                                    height: ScreenUtil().setWidth(20),
                                    child: Image.asset(
                                      "assets/images/left.png",
                                    ),
                                  )),
                              onTap: () {
//                                int a = int.parse(_controller.text);
//                                if (a == 1) {
//                                  showMinusCenterShortToast();
//                                } else {
//                                  _controller.text = (a - 1).toString();
//                                }
                                print('----');
                              },
                            ),
                            Container(
                              height: ScreenUtil().setWidth(20.0),
                              width: ScreenUtil().setWidth(31.6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
//                                    color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/mid.png",
                                      ),
                                      fit: BoxFit.fill)),
                              child: Text(
                                '1',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: ScreenUtil().setWidth(21),
                                    height: ScreenUtil().setWidth(20),
                                    child: Image.asset(
                                      "assets/images/right.png",
                                    ),
                                  ),
                                ),
                                onTap: () {
//                                  int r = widget.item['remainNum'];
//                                  int w = widget.item['waitThrowNum'];
//                                  int min = math.min(r, w);
//                                  int a = int.parse(_controller.text);
//                                  if (a >= min) {
//                                    showCenterShortToast();
//                                  } else {
//                                    _controller.text = (a + 1).toString();
//                                  }
                                  print('+++++++');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 2,
          ),
          Container(
            height: ScreenUtil().setWidth(53),
            padding: EdgeInsets.fromLTRB(8, 4, 8, 5),
            child: InkWell(
                onTap: () {
//                  print(_selectIndex);
                  Navigator.pop(context);
                  if (onConfirmListener != null) {
//                    onConfirmListener(_selectIndex);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xffEF5D44),
                    borderRadius:
                    BorderRadius.circular(ScreenUtil().setWidth(3)),
                  ),
                  child: Text(
                    '确定',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(16),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

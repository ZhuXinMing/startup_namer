import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProduceListDialog extends Dialog {

  final List entries;
  ProduceListDialog({this.entries});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: ProduceListDialogPage(
          entries: entries,
        ),
      ),
    );
  }
}

class ProduceListDialogPage extends StatefulWidget {
  final List entries;
  ProduceListDialogPage({this.entries=const []});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProduceListDialogState();
  }
}


class ProduceListDialogState extends State<ProduceListDialogPage> {
  double width = 256;
  double height = 255.0 + 14.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(3)),
      ),
      padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
      child: Column(
        children: [
          Align(
            child: Text(
              "商品库存",
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(14),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(16-6.5),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.entries != null?widget.entries.length:0,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: ScreenUtil().setWidth(29),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(157),
                        child: Text(
                          "(123456)商品名称商品名称商品名称",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: ScreenUtil().setSp(12),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "x${widget.entries!=null?widget.entries[index]:index}袋",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: ScreenUtil().setSp(12),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(16-6.5),
          ),
          Container(
            height: ScreenUtil().setWidth(34),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
//                              widget.onConfirmListener(widget.selectIndex);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xffEF5D44),
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(3)),
                  ),
                  child: Text(
                    "确定",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(13),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}


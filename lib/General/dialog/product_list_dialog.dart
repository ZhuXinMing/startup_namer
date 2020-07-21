//  Created by simon on 2020/6/27.

//  商品库存列表


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

/*
  void _presentProductListDialog(){

    List<GoodListModel> goods = _goodsArray.map((e) {
      GoodListModel model = GoodListModel();
      model.spuSpec = e.spuSpec;
      model.spuId = e.spuId;
      model.spuName = e.spuName;
      return model;
    }).toList();
    ProduceListDialog.show(context: context, entries: goods);
  }
 */

class ProduceListDialog extends Dialog {

  @required final List<GoodListModel> entries;

  ProduceListDialog({this.entries});

  //如果为空，会传null给ConfirmStokDialog类的属性
  static void show({
    @required BuildContext context,
    @required List entries,
  }) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ProduceListDialog(entries: entries);
        });
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: _DialogPage(
          entries: entries,
        ),
      ),
    );
  }
}

class _DialogPage extends StatefulWidget {
  final List<GoodListModel> entries;
  _DialogPage({this.entries = const []});

  @override
  State<StatefulWidget> createState() => _DialogState();
}

class _DialogState extends State<_DialogPage> {

  double width = 384;
  double height = 383;

  double contentPadding = 24;
  //按钮width，height
  double btnWidth = 336;
  double btnHeight = 52;
  //行高
  double rowHeight = 25.0+10*2;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
      ),
      padding: EdgeInsets.all(ScreenUtil().setWidth(contentPadding)),
      child: Column(
        children: [
          Align(
            child: Text(
              "商品库存",
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(22),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(24 - 10),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.entries != null ? widget.entries.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: ScreenUtil().setWidth(rowHeight),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(236),
                        child: Text(
                          widget.entries !=null ?'(${widget.entries.elementAt(0).spuId})${widget.entries.elementAt(0).spuName}' :'',
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: ScreenUtil().setSp(18),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.entries !=null ? "x${widget.entries.elementAt(0).spuSpec}" :'',
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: ScreenUtil().setSp(18),
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
            height: ScreenUtil().setWidth(24 - 10),
          ),
          Container(
            height: ScreenUtil().setWidth(btnHeight),
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
                    BorderRadius.circular(ScreenUtil().setWidth(5)),
                  ),
                  child: Text(
                    "确定",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class GoodListModel{
  //id号
  String spuId;
  //名称
  String spuName;
  //数量
  int stockNumber;
  //标准单位
  String baseUnitName;
  //stockNumber和baseUnitName的组合字符串
  String spuSpec;
}

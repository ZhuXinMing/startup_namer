///
///   @Name    : startup_namer/ product_selection_bottomSheet
///   @author  : simon
///   @date    : 2020/7/3 3:57 PM
///   @desc    :
///   @version : 1.0
///
///  8.7 优化修改按钮点击区域，待优化全选按钮大小；

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnConfirmListener = Function(List<SelectGoodListModel> entries);

/*
  //商品选择弹窗
  void _presentProductSelectionSheet() {

    if(_goodsArray  ==null || _goodsArray.length ==0){
      return;
    }
    List<SelectGoodListModel> goods = _goodsArray.map((e) {
      SelectGoodListModel model = SelectGoodListModel();
      model.spuSpec = e.spuSpec;
      model.spuId = e.spuId;
      model.spuName = e.spuName;
      model.isSelected = e.isSelected;
      return model;
    }).toList();

    ProductSelectionBottomSheet.show(
        context: context,
        title: '商品选择',
        entries: goods,
        onConfirmListener: (List<SelectGoodListModel> items) {
           if(items.every((element) => !element.isSelected)){
             ToastUtil.show(msg: '请选择商品');
             return;
           }
           setState(() {
                this._goodsArray.forEach((element) {
                  int index = this._goodsArray.indexOf(element);
                  element.isSelected = items[index].isSelected;
                });
                this._selectGoodsArray = this._goodsArray.where((element) =>
                   element.isSelected
                ).toList();
                _editingController2.text =(this._goodsArray.length == this._selectGoodsArray.length) ?'全部':'部分';
           });
        });
  }
 */

class ProductSelectionBottomSheet extends StatelessWidget {
  //标题
  @required
  final String title;
  @required
  //数据源数组
  final List<SelectGoodListModel> entries;
  //确定按钮事件回调
  @required
  final OnConfirmListener onConfirmListener;

  ProductSelectionBottomSheet(
      {Key key,
        String title,
        List<SelectGoodListModel> entries,
        this.onConfirmListener})
      : this.title = title ?? "",
        this.entries = entries,
        super(key: key);

  static void show(
      {@required BuildContext context,
        @required String title,
        @required List<SelectGoodListModel> entries,
        @required OnConfirmListener onConfirmListener}) {
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
          return ProductSelectionBottomSheet(
            title: title,
            entries: entries,
            onConfirmListener: onConfirmListener,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _BottomSheetPage(
        title: title, entries: entries, onConfirmListener: onConfirmListener);
  }
}

class _BottomSheetPage extends StatefulWidget {
  @required
  final String title;
  @required
  final List<SelectGoodListModel> entries;
  @required
  final OnConfirmListener onConfirmListener;

  _BottomSheetPage({this.title, this.entries, this.onConfirmListener});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomSheetState();
  }
}

class _BottomSheetState extends State<_BottomSheetPage> {
  bool isAllSelected = true;

  double bottomSheetHeight = 412;

  //关闭按钮大小
  double closeIconSize = 30;

  //行高
  double rowHeight = 48;

  //行内间距
  double rowPaddingLeft = 20;
  double rowPaddingRight = 34;

  //icon大小
  double selectIconSize = 28;

  //icon内间距
  double topIconButtonVPadding = 8.0 + 2.0;
  double topIconButtonHPadding = 8.0 + 10.0;

  double selectIconButtonLeftPadding = 20.0;
  double selectIconButtonRightPadding = 8.0;
  //按钮大小
  double btnHeight = 64;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isAllSelected = widget.entries.every((element) => element.isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(bottomSheetHeight),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
          height: ScreenUtil().setWidth(closeIconSize + 20 + 10),
//            color: Colors.amber,
          child: Stack(children: [
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
                      right: ScreenUtil().setWidth(20 - topIconButtonHPadding)),
//                  color: Colors.blue,
                  child: IconButton(
//                  splashRadius: 20,
                      highlightColor: Colors.transparent,
                      constraints: BoxConstraints(),
                      iconSize: ScreenUtil().setWidth(closeIconSize),
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          ScreenUtil().setWidth(topIconButtonHPadding),
                          vertical:
                          ScreenUtil().setWidth(topIconButtonVPadding)),
                      icon: Image.asset(
                        "assets/images/close_gray@2x.png",
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )),
          ]),
        ),
        Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: ScreenUtil().setWidth(rowHeight),
                  padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(rowPaddingLeft - selectIconButtonLeftPadding),
                      0,
                      ScreenUtil().setWidth(rowPaddingRight),
                      0),
                  decoration: BoxDecoration(
//                   color: Colors.cyan,
                  ),
                  child: Row(
                    children: [
                      Container(
//                    color: Colors.blue,
                        child: IconButton(
//                      splashRadius:
//                          selectIconSize / 2 + selectIconButtonPadding,
                            highlightColor: Colors.transparent,
                            constraints: BoxConstraints(),
                            iconSize: ScreenUtil().setWidth(selectIconSize),
                            padding: EdgeInsets.fromLTRB(
                                ScreenUtil().setWidth(selectIconButtonLeftPadding),
                                ScreenUtil()
                                    .setWidth((rowHeight - selectIconSize) / 2),
                                ScreenUtil().setWidth(selectIconButtonRightPadding),
                                ScreenUtil()
                                    .setWidth((rowHeight - selectIconSize) / 2)),
                            icon: _BottomSheetState.checkbox(
                                widget.entries[index].isSelected),
                            onPressed: () {
                              setState(() {
                                widget.entries[index].isSelected =
                                !widget.entries[index].isSelected;
                                isAllSelected = widget.entries
                                    .every((element) => element.isSelected);
                              });
                            }),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: Text(
                          "(${widget.entries[index].spuId})${widget.entries[index].spuName}",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: ScreenUtil().setSp(20),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 2,
                );
              },
              itemCount: widget.entries != null ? widget.entries.length : 0,
            )),
        Divider(
          height: 2,
        ),
        Container(
          height: ScreenUtil().setWidth(btnHeight + 8 + 8),
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(24 - selectIconButtonLeftPadding),
              ScreenUtil().setWidth(8),
              ScreenUtil().setWidth(12),
              ScreenUtil().setWidth(8)),
          child: Row(
            children: [
              Container(
//               color: Colors.amber,
//               width: ScreenUtil().setWidth(130-4),
                child: FlatButton(
                  highlightColor: Colors.transparent,
//                   materialTapTargetSize:  MaterialTapTargetSize.shrinkWrap,
                  onPressed: (){
                    setState(() {
                      isAllSelected = !isAllSelected;
                      widget.entries.forEach((element) {
                        element.isSelected = isAllSelected;
                      });
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _BottomSheetState.checkbox(
                          widget.entries.every((element) => element.isSelected)
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
                      Text(
                        '全选',
                        style: TextStyle(
                          color: Color(0xff262B3C),
                          fontSize: ScreenUtil().setSp(24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      if (widget.onConfirmListener != null) {
                        widget.onConfirmListener(widget.entries);
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
                        '确定',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  ///选择框
  static Widget checkbox(bool check) {
    return Container(
      width: ScreenUtil().setWidth(28),
      height: ScreenUtil().setWidth(28),
      decoration: BoxDecoration(
          color: check ? Color(0xffEF5D44) : null,
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
}

class SelectGoodListModel {
  String spuId;
  String spuName;
  //数量
  double stockNumber;
  String baseUnitName;
  String spuSpec;
  //是否选中
  bool isSelected;
}

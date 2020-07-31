import 'package:flutter/material.dart';
///
///   @Name    : startup_namer/ shift_quantity_selection_sheet
///   @author  : simon
///   @date    : 2020/7/2 5:58 PM
///   @desc    :
///   @version : 1.0
//    移位量选择
// 2020.7.30 修改

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:startupnamer/general/dialog/alert_controller_dialog.dart';

typedef OnConfirmListener = Function(List<ShiftNumberGoodListModel>models);

typedef ChangeTextFieldTextListener = Function(int index,String text);

/*
//移位量选择
  _presentShiftSelectionSheet() {

    if(_selectGoodsArray  ==null || _selectGoodsArray.length ==0){
      return;
    }
    List<ShiftNumberGoodListModel> models = _selectGoodsArray.map((e) {
      ShiftNumberGoodListModel model = ShiftNumberGoodListModel();
      model.spuId = e.spuId;
      model.spuName = e.spuName;
      model.sourceNumber = e.stockNumber;
      model.changedNumber = e.changedNumber;
      return model;
    }).toList();

    ShiftQuantitySelectionBottomSheet.show(
        context: context,
        title: '移位量选择',
        entries: models,
        onConfirmListener: (List<ShiftNumberGoodListModel>models) {
          print(models);
          setState(() {
            this._selectGoodsArray.forEach((element) {
              int index = this._selectGoodsArray.indexOf(element);
              element.changedNumber = models[index].changedNumber;
            });
            List<String> shiftQuantityStrings = this._selectGoodsArray.map((e){
              String str = '（${e.spuId}）${e.changedNumber}${e.baseUnitName}';
              return str;
            }).toList();
            _editingController3.text = shiftQuantityStrings.join(';');
          });

        });
  }
 */


// ignore: must_be_immutable
class ShiftQuantitySelectionBottomSheet extends StatefulWidget {
  //标题
  @required String title;
  //列表数组集合
  @required List<ShiftNumberGoodListModel> entries;
  //确定按钮事件回调
  @required final OnConfirmListener onConfirmListener;

  final ChangeTextFieldTextListener changeTextFieldTextListener;
  ShiftQuantitySelectionBottomSheet(
      { Key key,
        String title,
        List<ShiftNumberGoodListModel> entries,
        this.onConfirmListener,
        this.changeTextFieldTextListener,
      })
      : this.title = title ?? "",
        this.entries = entries,
        super(key: key);

  static void show(
      { @required BuildContext context,
        @required String title,
        @required List<ShiftNumberGoodListModel> entries,
        OnConfirmListener onConfirmListener,
        ChangeTextFieldTextListener changeTextFieldTextListener,
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
          return ShiftQuantitySelectionBottomSheet(
            title: title,
            entries: entries,
            onConfirmListener: onConfirmListener,
            changeTextFieldTextListener: changeTextFieldTextListener,
          );
        });
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomSheetState();
  }
}

class _BottomSheetState extends State<ShiftQuantitySelectionBottomSheet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double bottomSheetHeight = 412;
  //关闭按钮大小
  double closeIconSize = 30;

  //行高
  double rowHeight = 50;
  //行内间距
  double rowPaddingLeft = 20;
  double rowPaddingRight = 20;
  //加，减
  double reduceIconWidth = 32;
  double reduceIconHeight = 30;
  //加，减 扩展大小
  double reduceIconExtend = 10;
  //按钮大小
  double btnHeight = 64;

  void showCenterShortToast({String msg}) {
    Fluttertoast.showToast(
        msg:msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }


  void _reduceAction(int index) {
    setState(() {
      double a = widget.entries[index].changedNumber;
      if (a <= 1.0) {
        showCenterShortToast(msg:"已达最小量");
      } else {
        widget.entries[index].changedNumber = (a - 1);
      }
    });
  }

  void _increaseAction(int index) {
    setState(() {
      double from = widget.entries[index].sourceNumber;
      double to = widget.entries[index].changedNumber;
      if (to >= from) {
        showCenterShortToast(msg:"已达该商品库存量");
      } else {
        widget.entries[index].changedNumber = (to + 1);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    TextOverflow overflow = defaultTextStyle.overflow;
    print(overflow);//TextOverflow.clip
    return Container(
      height: ScreenUtil().setWidth(bottomSheetHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0),
            height: ScreenUtil().setWidth(20.0 + closeIconSize + 10.0),
//            color: Colors.amber,
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
                  child: IconButton(
                      iconSize: ScreenUtil().setWidth(closeIconSize),
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
          Expanded(
            child: ListView.separated(
              itemCount: widget.entries != null ? widget.entries.length : 0,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 2,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: ScreenUtil().setWidth(rowHeight),
                  padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(rowPaddingLeft),
                      0,
                      ScreenUtil().setWidth(rowPaddingRight - reduceIconExtend),
                      0),
                  decoration: BoxDecoration(
//                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(305-48*0.8),
                        child: Text(
                          "(${widget.entries[index].spuId})${widget.entries[index].spuName}",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: ScreenUtil().setSp(20),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        width: ScreenUtil().setWidth(reduceIconExtend
                            + reduceIconWidth
                            + 48 + 48*0.8
                            + reduceIconWidth
                            + reduceIconExtend),
                        height: ScreenUtil()
                            .setWidth(reduceIconHeight + reduceIconExtend * 2),
//                        color: Colors.amber,
                        child: Row(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Container(
//                                color: Colors.cyan,
                                width: ScreenUtil().setWidth(
                                    reduceIconWidth + reduceIconExtend),
                                height: ScreenUtil().setWidth(
                                    reduceIconHeight + reduceIconExtend * 2),
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: ScreenUtil().setWidth(reduceIconWidth),
                                  height:
                                  ScreenUtil().setWidth(reduceIconHeight),
                                  child: Image.asset(
                                    "assets/images/left@2x.png",
                                  ),
                                ),
                              ),
                              onTap: () {
                                _reduceAction(index);
                              },
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: (){
                                _changeTextFieldNumAction(index);
                              },
                              child: Container(
                                width: ScreenUtil().setWidth(48+48*0.8),
                                height: ScreenUtil().setWidth(reduceIconHeight),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/mid@2x.png",
                                        ),
                                        fit: BoxFit.fill)
                                ),
                                child: Text(
                                  widget.entries[index].changedNumber.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,//默认值
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(20),
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  child: Container(
//                                    color: Colors.cyan,
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      width: ScreenUtil()
                                          .setWidth(reduceIconWidth),
                                      height: ScreenUtil()
                                          .setWidth(reduceIconHeight),
                                      child: Image.asset(
                                        "assets/images/right@2x.png",
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    _increaseAction(index);
                                  }),
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
            height: ScreenUtil().setWidth(btnHeight + 8 + 8),
            padding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(12),
                ScreenUtil().setWidth(8),
                ScreenUtil().setWidth(12),
                ScreenUtil().setWidth(8)),
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  _changeTextFieldNumAction(int index){

    if (widget.changeTextFieldTextListener != null) {

      double number = widget.entries[index].changedNumber;
      widget.changeTextFieldTextListener(index,number.toString());


      UIAlertControllerDialog.showTextFieldAlert(context: context,
          title: Text('请输入所需数量'),
          content:ZXCustomTextField(
            maxNum: widget.entries[index].sourceNumber,
            minNum: 0.01,
          ),
          onConfirmListener: (text){
            widget.entries[index].changedNumber = double.parse(text);
          });
    }
  }
}

class ShiftNumberGoodListModel {
  //id
  String spuId;
  //名称
  String spuName;
  //源数量
  double sourceNumber;
  //修改后的数量,初始值 = 源数量
  double changedNumber;
}
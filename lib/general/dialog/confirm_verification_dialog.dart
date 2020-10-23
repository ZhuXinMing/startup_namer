//  Created by simon on 2020/6/28.
//  简介：关联了业务model；

// 2020.7.31 修改
//8.4 增加model数据，修改content最多行数
//8.8 左右按钮事件bug;
//10.23 修改GridView和Column用同一个index的bug；

/*
//确认验证码弹窗
showConfirmVerificationDialog(){

  ConfirmVerificationDialog.show(
      context: context,
      title: "确认缺货",
      content: '内容内容内容内容内容内容内容内容内容内容内容内容',
      leftButtonTitle: '取消',
      rightButtonTitle: '确认报缺',
//        leftButtonTitle: '确认报缺',
//        rightButtonTitle: '取消',
      cancelConfirmIsLeft: true,
      leftOnConfirmListener: (){
        print('左边按钮事件');
      },
      rightOnConfirmListener: (){
        print('右边按钮事件');
      });
}
*/

import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef RightOnConfirmListener = Function();
typedef LeftOnConfirmListener = Function();

class ConfirmVerificationDialog extends Dialog {
  //标题
  @required
  final String title;

  //内容,不传的话内容UI不会展示；
  final String content;

  //验证码，如果不传默认会是随机位数；
  final String verificationCode;

  //左边按钮文本
  @required
  final String leftButtonTitle;

  //右边按钮文本
  @required
  final String rightButtonTitle;

  //左边按钮事件回调
  @required
  final LeftOnConfirmListener leftOnConfirmListener;

  //右边按钮事件回调
  @required
  final RightOnConfirmListener rightOnConfirmListener;

  //取消按钮是否在左边，或在右边；默认左边；
  final bool cancelConfirmIsLeft;

  //可选，内容详情
  final Widget contentDetailWidget;

  const ConfirmVerificationDialog(
      {Key key,
      String title,
      this.content,
      this.verificationCode,
      String leftButtonTitle,
      String rightButtonTitle,
      this.leftOnConfirmListener,
      this.rightOnConfirmListener,
      bool cancelConfirmIsLeft,
      this.contentDetailWidget})
      : this.title = title ?? '',
        this.leftButtonTitle = leftButtonTitle ?? '取消',
        this.rightButtonTitle = rightButtonTitle ?? '确认',
        this.cancelConfirmIsLeft = cancelConfirmIsLeft ?? true,
        super(key: key);

  static void show({
    @required BuildContext context,
    @required String title,
    String content,
    String verificationCode,
    String leftButtonTitle = '取消',
    String rightButtonTitle = '确认',
    @required LeftOnConfirmListener leftOnConfirmListener,
    @required RightOnConfirmListener rightOnConfirmListener,
    final bool cancelConfirmIsLeft,
    final Widget contentDetailWidget,
  }) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ConfirmVerificationDialog(
            title: title,
            content: content,
            verificationCode: verificationCode,
            leftButtonTitle: leftButtonTitle,
            rightButtonTitle: rightButtonTitle,
            leftOnConfirmListener: leftOnConfirmListener,
            rightOnConfirmListener: rightOnConfirmListener,
            cancelConfirmIsLeft: cancelConfirmIsLeft,
            contentDetailWidget: contentDetailWidget,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
          child: _DialogPage(
        title: title,
        content: content,
        verificationCode: verificationCode,
        leftButtonTitle: leftButtonTitle,
        rightButtonTitle: rightButtonTitle,
        leftOnConfirmListener: leftOnConfirmListener,
        rightOnConfirmListener: rightOnConfirmListener,
        cancelConfirmIsLeft: cancelConfirmIsLeft,
        contentDetailWidget: contentDetailWidget,
      )),
    );
  }
}

class _DialogPage extends StatefulWidget {
  final String title;
  final String content;

  final String verificationCode;
  final String leftButtonTitle;
  final String rightButtonTitle;
  final RightOnConfirmListener rightOnConfirmListener;
  final LeftOnConfirmListener leftOnConfirmListener;
  final bool cancelConfirmIsLeft;
  final Widget contentDetailWidget;

  const _DialogPage(
      {this.title,
      this.content,
      this.verificationCode,
      this.leftButtonTitle,
      this.rightButtonTitle,
      this.leftOnConfirmListener,
      this.rightOnConfirmListener,
      this.cancelConfirmIsLeft,
      this.contentDetailWidget});

  @override
  State<StatefulWidget> createState() => _DialogState();
}

class _DialogState extends State<_DialogPage> {
  TextEditingController _textEditingController = new TextEditingController();

  String _verificationCode;

  //按钮width，height
  double _btnWidth = 156;
  double _btnHeight = 52;

  final EdgeInsetsGeometry contentDetailPadding = EdgeInsets.fromLTRB(
      ScreenUtil().setWidth(24),
      0,
      ScreenUtil().setWidth(24),
      ScreenUtil().setWidth(20));

  final EdgeInsetsGeometry verificationCodePadding = EdgeInsets.fromLTRB(
      ScreenUtil().setWidth(24),
      0,
      ScreenUtil().setWidth(24),
      ScreenUtil().setWidth(10));

  final EdgeInsetsGeometry textFieldPadding = EdgeInsets.fromLTRB(
      ScreenUtil().setWidth(24),
      0,
      ScreenUtil().setWidth(24),
      ScreenUtil().setWidth(24));

  final EdgeInsetsGeometry actionsPadding = EdgeInsets.fromLTRB(
      ScreenUtil().setWidth(24),
      0,
      ScreenUtil().setWidth(24),
      ScreenUtil().setWidth(24));

  _randomBit(int len) {
    String scopeF = '123456789'; //首位
    String scopeC = '0123456789'; //中间
    String result = '';
    for (int i = 0; i < len; i++) {
      if (i == 0) {
        result = scopeF[Random().nextInt(scopeF.length)];
      } else {
        result = result + scopeC[Random().nextInt(scopeC.length)];
      }
    }
    return result;
  }

  void _showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg ?? '',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verificationCode = widget.verificationCode ?? _randomBit(5);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget titleWidget;
    if (widget.title != null) {
      titleWidget = Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(24),
            ScreenUtil().setWidth(24),
            ScreenUtil().setWidth(24),
            widget.content == null ? ScreenUtil().setWidth(24) : 0.0),
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(22),
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    Widget contentWidget;
    if (widget.content != null) {
      contentWidget = Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(24),
            ScreenUtil().setWidth(24),
            ScreenUtil().setWidth(24),
            widget.contentDetailWidget == null
                ? ScreenUtil().setWidth(24)
                : ScreenUtil().setWidth(10)),
        child: Text('${widget.content}',
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: ScreenUtil().setSp(18),
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis),
      );
    }

    Widget contentDetailPaddingWidget;
    if (widget.contentDetailWidget != null) {
      contentDetailPaddingWidget = Padding(
          padding: contentDetailPadding, child: widget.contentDetailWidget);
    }

    Widget verificationCodeWidget;
    if (_verificationCode != null) {
      verificationCodeWidget = Padding(
        padding: verificationCodePadding,
        child: Text(
          '验证码：$_verificationCode',
          style: TextStyle(
            color: Color(0xffEF5D44),
            fontSize: ScreenUtil().setSp(22),
          ),
        ),
      );
    }

    Widget textFieldWidget;
    textFieldWidget = Padding(
      padding: textFieldPadding,
      child: Container(
        height: ScreenUtil().setWidth(62),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF2F1F6),
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
          border: Border.all(color: Colors.white, width: 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
        child: Row(
          children: [
            Text(
              "验证码",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(22),
                color: Color(0xFF333333),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(20),
            ),
            Expanded(
              child: TextField(
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(22),
                  color: Color(0xFF333333),
                ),
                keyboardType: TextInputType.number,
                controller: _textEditingController,
                onChanged: (value) {},
                decoration: InputDecoration.collapsed(
                    hintText: "请点击输入",
                    hintStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(22),
                      color: Color(0xFF999999),
                    )),
              ),
            ),
          ],
        ),
      ),
    );

    Widget actionsWidget;
    actionsWidget = Padding(
      padding: actionsPadding,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: ScreenUtil().setWidth(_btnWidth),
              height: ScreenUtil().setWidth(_btnHeight),
              child: RaisedButton(
                onPressed: () {
                  leftOnConfirmAction();
                },
                child: Text(
                  widget.leftButtonTitle,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.normal),
                ),
                color: Colors.white,
                elevation: 0,
                highlightElevation: 0,
                disabledElevation: 0,
                textColor: Color(0xFF333333),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
                  side: BorderSide(color: Color(0xffCCCCCC), width: 1),
                ),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(_btnWidth),
              height: ScreenUtil().setWidth(_btnHeight),
              child: RaisedButton(
                onPressed: () {
                  rightOnConfirmAction();
                },
                child: Text(
                  widget.rightButtonTitle,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.normal),
                ),
                color: Color(0xffEF5D44),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
                  side: BorderSide(color: Color(0xffEF5D44)),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Widget dialogChild = SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        titleWidget ?? SizedBox(),
        contentWidget ?? SizedBox(),
        contentDetailPaddingWidget ?? SizedBox(),
        verificationCodeWidget ?? SizedBox(),
        textFieldWidget ?? SizedBox(),
        actionsWidget ?? SizedBox(),
      ],
    ));

    return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 32),
        shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        child: dialogChild);
  }

  void leftOnConfirmAction() {
    if (widget.cancelConfirmIsLeft) {
      cancelAction();
    } else {
      if (!onAction()) {
        return;
      }
    }
    if (widget.leftOnConfirmListener != null) {
      widget.leftOnConfirmListener();
    }
  }

  void rightOnConfirmAction() {
    if (widget.cancelConfirmIsLeft) {
      if (!onAction()) {
        return;
      }
    } else {
      cancelAction();
    }
    if (widget.rightOnConfirmListener != null) {
      widget.rightOnConfirmListener();
    }
  }

  void cancelAction() {
    Navigator.pop(context);
  }

  bool onAction() {
    if (_verificationCode.compareTo(_textEditingController.text) != 0) {
      _showToast('请输入有效的验证码');
      return false;
    } else {
      Navigator.pop(context);
    }
    return true;
  }
}

/*
业务-内容详情列表数据
 */

class ContentDetailWidget extends StatelessWidget {
  final List<ReportedStockoutTakeBackListEntity> models;

  ContentDetailWidget(this.models);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: ScreenUtil().setWidth(256),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), color: Color(0xffF5F5F5)),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
        shrinkWrap: true,
        itemCount: this.models?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(10),
                      ScreenUtil().setWidth(7), ScreenUtil().setWidth(10)),
                  child: Text(
                      "(${models[index].goodsId??''})${models[index].goodsName??''}",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: ScreenUtil().setSp(16),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ),
                GridView.builder(
                    padding: EdgeInsets.fromLTRB(0, 0, ScreenUtil().setWidth(7),
                        ScreenUtil().setWidth(10)),
                    shrinkWrap: true,
                    itemCount:
                    models[index]?.goodsCargoSpaceInfoVOS?.length ?? 0,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: ScreenUtil().setWidth(10),
                        crossAxisSpacing: ScreenUtil().setWidth(10),
                        childAspectRatio: 5),
                    itemBuilder: (BuildContext context, int index2) {
                      return Text(
                          "${models[index]?.goodsCargoSpaceInfoVOS[index2].cargoSpaceName ??''}"
                              "：${models[index]?.goodsCargoSpaceInfoVOS[index2].num ?? ''}${models[index]?.goodsCargoSpaceInfoVOS[index2].baseUnitName ?? ''}",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: ScreenUtil().setSp(16),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis);
                    }),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Color(0xffCCCCCC),
            height: 1,
          );
        },
      ),
    );
  }
}

class ReportedStockoutTakeBackListEntity {
  double goodsType;
  double goodsId;
  String goodsName;
  List<ReportedStockoutTakeBackListGoodsCargoSpaceInfoVO>
      goodsCargoSpaceInfoVOS;
}

class ReportedStockoutTakeBackListGoodsCargoSpaceInfoVO {
  double cargoSpaceId;
  String cargoSpaceName;
  double num;
  String baseUnitName;
}

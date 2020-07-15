///
///   @Name    : startup_namer/ reported_stockout_controller
///   @author  : simon
///   @date    : 2020/7/4 5:46 PM
///   @desc    :
///   @version : 1.0
///

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startupnamer/widgets/chs_form_field.dart';
import 'package:startupnamer/res/colors.dart';
import 'package:startupnamer/utils/utils.dart';

class ReportedStockoutController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('报缺'),
        elevation: 0,
      ),
      body: ReportedStockout(),
    );
  }
}

class ReportedStockout extends StatefulWidget {
  @override
  _ReportedStockoutState createState() => _ReportedStockoutState();
}

class _ReportedStockoutState extends State<ReportedStockout> {
  bool buttonUserInteractionEnabled;

  TextEditingController _firstEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonUserInteractionEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadiusDirectional.circular(ScreenUtil().setWidth(5)),
            ),
            margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(12)),
            height: ScreenUtil().setWidth(316),
            width: double.infinity,
            padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
            child: Column(

              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(416),
                  height: ScreenUtil().setWidth(60),
                  child: CHSFormField(
                    titleText: '日期/批次:',
                    fontSizeText:  ScreenUtil().setSp(22),
                    isCanInput: false,
                    frontColor: ResColor.color_F2F1F6,
                    hintText:'请点击选择日期/批次',
                    isShowClean: true,
                    isShowRightImage: true,
                    textEditingController:_firstEditingController,
                    rightImage:Image.asset(Utils.getImgPath('icon_triangle_down')),
                    onTap: (){
                      print('页面点击了');
                    },
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(416),
                  height: ScreenUtil().setWidth(60),
                  margin: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
                  child: CHSFormField(
                    titleText: '集货区:',
                    fontSizeText:  ScreenUtil().setSp(22),
                    isCanInput: false,
                    frontColor: ResColor.color_F2F1F6,
                    hintText:'请点击选择集货区',
                    isShowClean: true,
                    isShowRightImage: true,
                    textEditingController:_firstEditingController,
                    rightImage:Image.asset(Utils.getImgPath('icon_triangle_down')),
                    onTap: (){
                      print('页面点击了');
                    },
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(416),
                  height: ScreenUtil().setWidth(60),
                  margin: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
                  child: CHSFormField(
                    titleText: '集货位:',
                    fontSizeText:  ScreenUtil().setSp(22),
                    isCanInput: false,
                    frontColor: ResColor.color_F2F1F6,
                    hintText:'请点击选择集货位',
                    isShowClean: true,
                    isShowRightImage: true,
                    textEditingController:_firstEditingController,
                    rightImage:Image.asset(Utils.getImgPath('icon_triangle_down')),
                    onTap: (){
                      print('页面点击了');
                    },
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(416),
                  height: ScreenUtil().setWidth(60),
                  margin: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
                  child: CHSFormField(
                    titleText: '商品:',
                    fontSizeText:  ScreenUtil().setSp(22),
                    isCanInput: false,
                    frontColor: ResColor.color_F2F1F6,
                    hintText:'请扫描录入商品码',
                    isShowClean: true,
                    isShowRightImage: true,
                    textEditingController:_firstEditingController,
                    rightImage:Image.asset(Utils.getImgPath('扫码@2x')),
                    onTap: (){
                      print('页面点击了');
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 0),
              width: double.infinity,
              height: ScreenUtil().setWidth(80),
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(12),
                  ScreenUtil().setWidth(8),
                  ScreenUtil().setWidth(12),
                  ScreenUtil().setWidth(8)),
              child: Opacity(
                opacity: buttonUserInteractionEnabled == false ? 0.4 :1 ,
                child: RaisedButton(
                  onPressed:buttonUserInteractionEnabled == false ? null: () {
                    print('11111111');
                  },
                  color: Color(0xffEF5D44),
                  disabledColor:Color(0xffEF5D44),
                  textColor: Colors.white,
                  disabledTextColor:Colors.white,
                  child: Text(
                    '查询',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

///
///   @Name    : startup_namer/ action_list_controller
///   @author  : simon
///   @date    : 2020/7/21 10:54 AM
///   @desc    :
///   @version : 1.0

import 'package:flutter/material.dart';
import 'package:startupnamer/ui/category_tab_item/tabs/list/TextFieldDemoController.dart';
import 'package:startupnamer/ui/category_tab_item/tabs/list/raisedButton_demo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ActionListController extends StatefulWidget {
  @override
  _ActionListControllerState createState() => _ActionListControllerState();
}

class _ActionListControllerState extends State<ActionListController> {

  //关闭按钮大小
  double closeIconSize = 30.0;
  //icon内间距,增大了5个像素，按钮大小 = IconSize + 2 * ButtonPadding，
  double iconButtonPadding = 8.0 + 5.0;


  _pushRaisedButtonDemo(){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return  RaisedButtonDemo();
    }));
  }

  _pushTextFieldDemo(){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return TextFieldDemoController();
    }));
  }

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    final VisualDensity effectiveVisualDensity = theme.visualDensity;
    final BoxConstraints unadjustedConstraints = const BoxConstraints(
      minWidth: 48,
      minHeight: 48,
    );
    final BoxConstraints adjustedConstraints = effectiveVisualDensity.effectiveConstraints(unadjustedConstraints);
    print("${adjustedConstraints.minWidth},${adjustedConstraints.minHeight},${adjustedConstraints.maxWidth},${adjustedConstraints.maxHeight}");

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _pushRaisedButtonDemo,
                child: Text('跳转到各种raisedButton'),
                padding: EdgeInsets.all(0),
              ),
              RaisedButton(
                child: Text('跳转到TextFieldDemo'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed:_pushTextFieldDemo,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    0,
                    ScreenUtil().setWidth(20.0 - iconButtonPadding),
                    ScreenUtil().setWidth(20.0 - iconButtonPadding),
                    0),
                width: ScreenUtil().setWidth(closeIconSize + 2*iconButtonPadding + 40),
//              color: Colors.brown,
                child: IconButton(
                    color: Colors.blue,
                    iconSize: ScreenUtil().setWidth(closeIconSize),
                    padding: EdgeInsets.all(ScreenUtil().setWidth(iconButtonPadding)) ,
                    constraints: BoxConstraints(
                        maxWidth: ScreenUtil().setWidth(closeIconSize + 2*iconButtonPadding),
                        maxHeight: ScreenUtil().setWidth(closeIconSize + 2*iconButtonPadding)
                    ),
                    icon: Image.asset(
                        "assets/images/close_gray@2x.png",
                        fit:BoxFit.contain
                    ),
                    onPressed: () {
                      print('111111111');
                    }),
              ),
              IconButton(
                  color: Colors.blue,
                  iconSize: ScreenUtil().setWidth(closeIconSize),
//                padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
                  constraints: BoxConstraints(
//                    maxWidth: ScreenUtil().setWidth(closeIconSize + 2*iconButtonPadding+100),
//                    maxHeight: ScreenUtil().setWidth(closeIconSize + 2*iconButtonPadding+100)
                  ),
                  icon: Image.asset(
                    "assets/images/close_gray@2x.png",
                  ),
                  onPressed: () {
                    print('111111111');
                  }),
              //圆形按钮-和头像一样
              RaisedButton(
                onPressed: () {},
                child: Text('形状设置为圆'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 20,
                shape: CircleBorder(
                  side: BorderSide(color: Colors.white),
                ),
              ),
              //通过设置RaisedButton的父视图Container的宽度高度，来改变RaiseButton容器的宽度高度。
              Container(
                height: 35,
                width: 200,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    '指定宽度高度',
                    style: TextStyle(fontSize: 13),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //在Row中使用Expanded让变成自适应宽度按钮
              Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 35,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            '指定高度，使用Row+Expanded自适应宽度按钮',
                            style: TextStyle(fontSize: 13),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                          elevation: 20,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 35,
                width: 200,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    '指定宽高+设置圆角',
                    style: TextStyle(fontSize: 13),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              IconButton(
                iconSize: 21,
                icon: Image.asset(
                  "assets/images/left@2x.png",
//                  width: 21,
//                  height:20,
//                  alignment: Alignment.bottomRight,
                ),
                onPressed: () {},
              )
//            Container(
//              height: 30,
//              width:31,
//              child: RaisedButton(
//                onPressed: () {
//
//                },
//                padding: EdgeInsets.all(0),
//                child: Image.asset(
//                  "images/1x/icon_left.png",
//                  width: 21,
//                  height:20,
//                  alignment: Alignment.bottomRight,
//                ),
//              ),
//            ),
            ],
          ),
        ),
      ),
    );
  }
}

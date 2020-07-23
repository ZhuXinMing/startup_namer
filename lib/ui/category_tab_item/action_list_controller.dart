///
///   @Name    : startup_namer/ action_list_controller
///   @author  : simon
///   @date    : 2020/7/21 10:54 AM
///   @desc    :
///   @version : 1.0

import 'package:flutter/material.dart';
import '../category_tab_item/bottom_sheet_demos.dart';
import 'package:startupnamer/ui/category_tab_item/list/TextFieldDemoController.dart';
import 'package:startupnamer/ui/category_tab_item/list/raisedButton_demo.dart';


class ActionListController extends StatefulWidget {
  @override
  _ActionListControllerState createState() => _ActionListControllerState();
}

class _ActionListControllerState extends State<ActionListController> {


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
    return Scaffold(
      body: Center(
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
            RaisedButton(
              onPressed: () {},
              child: Text('有阴影按钮'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 20,
            ),
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
    );
  }
}
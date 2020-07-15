///
///   @Name    : startup_namer/ category_tab_item_controller
///   @author  : simon
///   @date    : 2020/7/11 3:47 PM
///   @desc    :
///   @version : 1.0
///
///
import 'package:flutter/material.dart';
import '../category_tab_item/dialog_demos.dart';
import '../category_tab_item/bottom_sheet_demos.dart';


class CategoryTabItemController extends StatelessWidget{

  final String title;
  CategoryTabItemController({
    Key key,
    this.title = 'RaisedButtonDemo页面',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 虽然上层已经有Scaffold了，但允许存在多次；/如果上层已经有appBar了，则不能有2个appBar；一般上层不设置；
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: _DemoPage(),
    );
  }
}

class _DemoPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DemoState();
  }
}

//RaisedButton例子
class _DemoState extends State<_DemoPage> {


  void _pushDialogController(){

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return DialogDemo(title: '跳转到Dialog传值');
      }));
  }

  void _pushBottomSheetDemoController(){

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return BottomSheetDemo(title: '标题传值');
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
              onPressed:_pushDialogController,
              child: Text('跳转到Dialog'),
            ),
            RaisedButton(
              onPressed: _pushBottomSheetDemoController,
              child: Text('跳转到BottomSheet'),
              padding: EdgeInsets.all(0),
            ),
            RaisedButton(
              child: Text('有颜色按钮'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {},
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
              iconSize:21 ,
              icon: Image.asset(
                "images/1x/icon_left.png",
//                  width: 21,
//                  height:20,
//                  alignment: Alignment.bottomRight,
              ),
              onPressed:  () {

              },)
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

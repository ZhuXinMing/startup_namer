import 'dart:async';

import 'package:flutter/material.dart';

class MyDialog extends Dialog {

  String title;
  String content;
  MyDialog({
    Key key,
    this.title = "",
    this.content = "",
  }) :super(key: key);

  //定时器，每隔3000毫毛=3秒的时候回调 pop，取消定时器
  _showTimer(context){
    var timer;
    timer = Timer.periodic(
        Duration(milliseconds: 3000), (t){

      Navigator.pop(context);
      //取消定时器
      t.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {

    _showTimer(context);

    // TODO: implement build
    return Material(
//        type: MaterialType.transparency,
    color: Colors.transparent,
        //整个子组件居中
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(this.title),
                      ),
                      Align(
                        alignment:Alignment.centerRight,
                        child: InkWell(
                          child: Icon(Icons.close),
                          onTap: (){
                            //关闭取消定时器有bug？
                            Navigator.pop(context);
//                            timer.cancle();
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Divider(height: 1,),
                Container(
                  width: double.infinity,
                  child: Text(
                    this.content,
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

///
///   @Name    : startup_namer/ home_page_tab_item_controller
///   @author  : simon
///   @date    : 2020/7/11 3:36 PM
///   @desc    :
///   @version : 1.0
///

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:startupnamer/General/widgets/label_badge.dart';
import 'package:startupnamer/tabs.dart';
import 'package:startupnamer/utils/utils.dart';


class HomePageTabItemController extends StatefulWidget {

  final Extensition delegate;
  HomePageTabItemController({this.delegate});
  @override
  _HomePageTabItemControllerState createState() => _HomePageTabItemControllerState();
}

class _HomePageTabItemControllerState extends State<HomePageTabItemController> {

  static const List iconNames = ['ic_checkGood','ic_takeout'];
  static const List titles = ['核货中心','配送任务'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo'),elevation: 0,backgroundColor:Color(0xff307DF4)),
      body: Container(
        child:Column(
          children: <Widget>[
            Container(
              height:ScreenUtil().setWidth(560-64*2),
              width: double.infinity,
              color:Color(0xff307DF4),
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(225-64*2)),
              alignment: Alignment.topCenter,
              child: Image.asset(
                Utils.getImgPath('home_logo'),
                width:ScreenUtil().setWidth(327),
                height: ScreenUtil().setWidth(108),
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(20),
                      ScreenUtil().setWidth(20),
                      ScreenUtil().setWidth(20),
                      0),
                  itemCount: 2 ,
                  itemBuilder:(BuildContext context, int index){
                    return GestureDetector(
                      child: Container(
                        margin:EdgeInsets.only(bottom: ScreenUtil().setWidth(20)) ,
                        height: ScreenUtil().setWidth(160),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.circular(ScreenUtil().setWidth(20)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              Utils.getImgPath(iconNames.elementAt(index)),
                              width:ScreenUtil().setWidth(56),
                              height: ScreenUtil().setWidth(56),
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                              child:Text(titles[index],
                                style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: ScreenUtil().setSp(36)
                                ),
                              ) ,
                            ),
                            Expanded(child: SizedBox()),
                            Padding(padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                              child: LabelBadge(
                                height: ScreenUtil().setWidth(40),
                                num: 14,
                              ),
                            ),
                            Image.asset(
                              Utils.getImgPath('ic_next_step'),
                              width:ScreenUtil().setWidth(40),
                              height: ScreenUtil().setWidth(40),
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        print('1111');
                        if(index == 1){
                          setState(() {
                            widget.delegate.changeSelectIndex(1);
                          });
                        }
                      },
                    );
                  },
                )
            ),
          ],
        ) ,
      ),
    );
  }
}




//  Created by simon on 2020/6/15.


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
class LayoutDemo extends StatelessWidget{

  void _btnAction(){
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: DialogNButton(
        title: '蔬菜水果-蔬菜水果仓位',
        onTap: _btnAction,
      ),
    );
  }
}
 */

class DialogNButton extends StatelessWidget {

  final String title;
  final GestureTapCallback onTap;

  DialogNButton({
    @required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Color.fromRGBO(242, 241, 246, 1),
      borderRadius: BorderRadius.circular(3.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: ScreenUtil().setWidth(165),
          height: ScreenUtil().setWidth(40),
          padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
          decoration: BoxDecoration(

          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  this.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Image.asset('assets/images/icon_triangle_down.png'),
            ],
          ),
        ),
      ),
    );
  }
}

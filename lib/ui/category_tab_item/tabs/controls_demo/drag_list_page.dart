import 'package:drag_list/drag_list.dart';
///
///   @Name    : startup_namer/ drage_list_controller
///   @author  : simon
///   @date    : 2020/12/30 11:08 AM
///   @desc    :
///   @version : 1.0
///
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startupnamer/utils/utils.dart';


class TaskDragListPage extends StatefulWidget {

  final String expressTaskId;

  TaskDragListPage({
    Key key,
    this.expressTaskId,
  }) : super(key: key);

  @override
  _TaskDragListPageState createState() => _TaskDragListPageState();
}

class _TaskDragListPageState extends State<TaskDragListPage> {

  final _itemHeight = 72.0;
  final _countries = [
    'Russia',
    'China',
    'United States',
    'Canada',
    'Brazil',
    'Australia',
    'India',
    'Argentina',
    'Kazakhstan',
    'Algeria',
    'DR Congo',
    'Saudi',
    'Mexico',
    'Indonesia',
    'Sudan',
    'Libya',
    'Iran',
    'Mongolia',
    'Peru',
    'Niger',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('编辑排序'),
        actions: <Widget>[
          FlatButton(
            onPressed: (){

            },
            child: Text(
              '完成',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(32),
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          _tableHeaderView(),
          Expanded(
              child: DragList(
                  items: _countries,
                  itemExtent: _itemHeight,
                  handleBuilder:(BuildContext context)=>Center(child: Image.asset(
                    Utils.getImgPath('task_sort'),
                    width:ScreenUtil().setWidth(48),
                    height:ScreenUtil().setWidth(48),
                  )) ,
                  itemBuilder:
                      (BuildContext context, DragItem<String> item, Widget handle) {
                    print('xinXi = ${item.toString()}');
                    return Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(40)),
                      child: Row(
                        children: <Widget>[
                          _leftNumWidget(item.dispIndex),
                          _contentWidget(item),
                          Expanded(child: SizedBox()),
                          _topBtn(item.itemIndex),
                          handle,
                        ],
                      ),
                    );
                  })
          ),
        ],
      ),
    );
  }

  //左边数字
  Widget _leftNumWidget(int index) {
    return Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
      child: Text(
        '${index + 1}.',
        style: TextStyle(
            color: Color(0xffF87A15),
            fontSize: ScreenUtil().setSp(48),
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic),
      ),
    );
  }

  //内容
  Widget _contentWidget(DragItem<String> item) {
    return Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(44)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${item.value}',
            style: TextStyle(
                color: Color(0xff333333),
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(30)),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(8),
          ),
          Text(
            '滨江区阿里中心3号楼1单元607室',
            style: TextStyle(
                color: Color(0xff999999),
                fontWeight: FontWeight.normal,
                fontSize: ScreenUtil().setSp(24)),
          ),
        ],
      ),
    );
  }


  Widget _topBtn(int index) {
    return Padding(
      padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(40)- 24 + ScreenUtil().setWidth(24)
      ),
      child: IconButton(
          padding: EdgeInsets.zero,
          iconSize: ScreenUtil().setWidth(48),
          icon: Image.asset(
            Utils.getImgPath('task_top'),
            width:ScreenUtil().setWidth(48),
            height:ScreenUtil().setWidth(48),
          ),
          onPressed: () {

            setState(() {

            });
          }),
    );
  }

  Widget _tableHeaderView() {
    return Container(
      height:ScreenUtil().setWidth(86),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(40), right: ScreenUtil().setWidth(38)),
      color: Color(0xffF2F1F6),
      child: DefaultTextStyle(
          style: TextStyle(
              color: Color(0xff999999),
              fontSize: ScreenUtil().setSp(26),
              fontWeight: FontWeight.normal),
          child: Row(
            children: <Widget>[
              Text('门店信息'),
              Expanded(child: SizedBox()),
              Text('置顶'),
              SizedBox(width: ScreenUtil().setWidth(36)),
              Text('拖动'),
            ],
          )),
    );
  }
}
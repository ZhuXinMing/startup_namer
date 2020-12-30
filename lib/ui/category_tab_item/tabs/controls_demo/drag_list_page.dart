import 'package:drag_list/drag_list.dart';
///
///   @Name    : startup_namer/ drage_list_controller
///   @author  : simon
///   @date    : 2020/12/30 11:08 AM
///   @desc    :
///   @version : 1.0
///
import 'package:flutter/material.dart';


class DragListPage extends StatefulWidget {

  final String title;
  DragListPage({
    Key key,
    this.title = '拖动排序页面',
  }) : super(key: key);

  @override
  _DragListPageState createState() => _DragListPageState();
}

class _DragListPageState extends State<DragListPage> {

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
        title: Text('${widget.title}'),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: DragList(
            items: _countries,
            itemExtent: _itemHeight,
            padding: EdgeInsets.only(top: 10),
            itemBuilder: (
                BuildContext context, DragItem<String> item, Widget handle){
              print('xinXi = ${item.toString()}');
              return Container(
                color: Colors.transparent,
                height: _itemHeight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child:Container(
                      color: Colors.white,
                      child:  Row(
                        children: <Widget>[
                          Expanded(child: Center(child: Text(item.value),)),
                          Container(
                            width: 40,
                            color: Colors.brown,
                            child: handle,
                          )
                        ],
                      ),
                    ),
                  ),
              );
            }),
      ),
    );
  }
}

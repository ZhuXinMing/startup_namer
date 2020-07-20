import 'package:flutter/cupertino.dart';
///
///   @Name    : startup_namer/ reported_tab_item_controller
///   @author  : simon
///   @date    : 2020/7/13 8:48 PM
///   @desc    :
///   @version : 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'reported_stockout_controller.dart';
import 'package:startupnamer/utils/log_util.dart';

import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReportedTabItemController extends StatefulWidget {
  @override
  _ReportedTabItemControllerState createState() =>
      _ReportedTabItemControllerState();
}

class _ReportedTabItemControllerState extends State<ReportedTabItemController> {

  List _dataMArray=[];

  RefreshController _refreshController = RefreshController(initialRefresh: true);

  //下拉刷新
  void _onRefresh() async{

    _dataMArray.clear();
    await _dioRequestData();
    _refreshController.refreshCompleted();
  }

  //上拉加载更多
  void _onLoading() async{
    await Future.delayed(Duration(milliseconds: 1000));
    if(mounted){
      setState(() {
        _dataMArray.add({'artworkUrl60':'','trackName':'12','releaseNotes':'releaseNotes2'});
      });
    }
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
  }

  //请求数据
  _dioRequestData() async {
    var baseUrl = "https://itunes.apple.com/cn";
    Map<String, dynamic> jsonData = {"id": '1180821282'};
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    Response response = await dio.post('/lookup', data: jsonData, queryParameters: jsonData);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.data);
      print(response.data);
      setState(() {
        this._dataMArray.addAll(jsonResponse['results']) ;
      });
    } else {
      print(response.statusCode);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
        //左侧配置
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
            }),
        //右侧配置
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){

              }),
        ],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('10'),
        onPressed: () {},
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode){
            Widget body;
            if(mode == LoadStatus.idle){
              body = Text('pull up load');
            }else if(mode == LoadStatus.loading){
              body = CupertinoActivityIndicator();
            }else if (mode == LoadStatus.failed){
              body = Text('Load Failed! Click retry!');
            }else if(mode == LoadStatus.canLoading){
              body = Text('release to load more');
            }else{
              body == Text('No more Data');
            }
            return Container(
              height: 55.0,
              child:  Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
            itemCount: this._dataMArray.length,
            itemBuilder:(BuildContext context, int index){
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                    this._dataMArray[index]['artworkUrl60'],
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                  radius: 30,
                ),
                title: Text(this._dataMArray[index]['trackName']),
                subtitle: Text(this._dataMArray[index]['releaseNotes']),
              );
            }
        ) ,
      )
    );
  }
}

/*
class _ReportedTabItemControllerState extends State<ReportedTabItemController> {

  List _dataMArray = [];

  @override
  void initState() {
    super.initState();
    //一进页面就请求数据；
    this._dioPostData();
  }

  _dioPostData() async {
    var baseUrl = "https://itunes.apple.com/cn";
    Map<String, dynamic> jsonData = {"id": '1180821282'};
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    Response response = await dio.post('/lookup', data: jsonData, queryParameters: jsonData);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.data);
      LogUtil.d(response.data);
      setState(() {
        this._dataMArray = jsonResponse['results'];
      });
    } else {
      print(response.statusCode);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo')),
      floatingActionButton: FloatingActionButton(
        child: Text('10'),
        onPressed: () {},
      ),
      body: this._dataMArray.length > 0
          ? ListView.builder(
          itemCount: this._dataMArray.length,
          itemBuilder:(BuildContext context, int index){
               return ListTile(
                 leading: CircleAvatar(
                   child: Image.network(
                     this._dataMArray[index]['artworkUrl60'],
                     fit: BoxFit.cover,
                     width: 60,
                     height: 60,
                   ),
                   radius: 30,
                 ),
                 title: Text(this._dataMArray[index]['trackName']),
                 subtitle: Text(this._dataMArray[index]['releaseNotes']),
               );
            }
          )
          : Text('加载中...'),
    );
  }
}
*/

/*
 Center(
        child: Column(
          children: [
            Container(
              height: ScreenUtil().setWidth(100),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.5)),
                border: Border.all(color: Colors.amber),
              ),
            ),
            RaisedButton(
                child: Text('跳转'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return ReportedStockoutController();
                  }));
                }),
            RaisedButton(
                child: Text('get请求'),
                onPressed: () {
//                  _getData();
                }),
            RaisedButton(
                child: Text('post请求'),
                onPressed: () {
                  _postData();
                }),
          ],
        ),
 */

///
///   @Name    : startup_namer/ tabs
///   @author  : simon
///   @date    : 2020/7/11 3:18 PM
///   @desc    :
///   @version : 1.0
///

import 'package:flutter/material.dart';
import 'package:startupnamer/ui/home_page_tab_item/home_page_tab_item_controller.dart';
import 'package:startupnamer/ui/category_tab_item/category_tab_item_controller.dart';
import 'package:startupnamer/ui/report_tab_item/reported_tab_item_controller.dart';

class Tabs extends StatefulWidget {
  @override
  State createState() => _TabsState();
}

class _TabsState extends State<Tabs> with Extensition{

  int _selectedIndex = 0;
  List<Widget> _widgetOptions;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 22,fontWeight: FontWeight.bold
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgetOptions = <Widget>[
      HomePageTabItemController(delegate: this),
      CategoryTabItemController(),
      ReportedTabItemController(),
      Text('Index 2 :我的',style: optionStyle,)
    ];
  }

  @override
  void changeSelectIndex(int index){
    setState(() {
      _selectedIndex = index;
//      _pageController.jumpToPage(_selectedIndex);
    });
  }



  static const List<Widget> _widgetAppBarTitle = <Widget>[
    Text('首页',style: optionStyle,),
    Text('分类',style: optionStyle,),
    Text('我的',style: optionStyle,)
  ];

  //实现点击之后回调选中哪个；跟踪所选的[BottomNavigationBarItem]的索引，
  // 并调用'setState'根据新的[currentIndex]重建底部导航栏。
  void _onItemTapped(int index){
    setState(() {
      this._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //    ScreenUtil.init(context, width: 1024, height: 768, allowFontScaling: false);

    return Scaffold(
      //选中之后动态改变AppBar的title；最外层不要设置AppBar；
//      appBar: AppBar(title: _widgetAppBarTitle.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('分类')),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('报缺')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('我的')),
        ],
        selectedItemColor: Color(0xff307DF4),
        unselectedItemColor: Color(0xff34373A),
        selectedFontSize: 10,
        unselectedFontSize: 10,
      ),
      //选中之后动态改变body的内容；一般是几个不同的页面；
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

    );
  }
}

//把Extensition扩展类 传给其他类使用
mixin Extensition {
  void changeSelectIndex(int index);
}
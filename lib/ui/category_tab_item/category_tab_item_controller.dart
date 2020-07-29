///
///   @Name    : startup_namer/ category_tab_item_controller
///   @author  : simon
///   @date    : 2020/7/11 3:47 PM
///   @desc    :
///   @version : 1.0
///
///
import 'package:flutter/material.dart';
import 'tabs/dialog_demos.dart';
import 'package:startupnamer/ui/category_tab_item/tabs/action_list_controller.dart';
import 'package:startupnamer/ui/category_tab_item/tabs/bottom_sheet_demos.dart';

//DefaultTabController + TabBar + TabBarView

class CategoryTabItemController extends StatelessWidget {
  final String title;
  CategoryTabItemController({
    Key key,
    this.title = 'Demo页面',
  }) : super(key: key);

  final List<Widget> tabs = <Widget>[Tab(text: 'ActionListController'),Tab(text: '热门'), Tab(text: '推荐')];
  final List<Widget> tabBarViews = <Widget>[
    ActionListController(),
    DialogDemo(title: null),
    BottomSheetDemo(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          // 注意：虽然上层已经有Scaffold了，但允许嵌套多次；但如果上层已经有appBar了，则不能2个appBar同时设置,不然会累加显示；
          appBar: AppBar(
            title: Text(this.title),
            bottom: TabBar(
                tabs: tabs,
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                indicatorColor: Color(0xffEF5D44),
                indicatorWeight: 4,
                indicatorSize: TabBarIndicatorSize.label),
          ),
          body: TabBarView(
            children: tabBarViews,
          ),
        ));
  }
}


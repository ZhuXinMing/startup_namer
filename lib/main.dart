import 'dart:io';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'listData.dart';
import 'Compents/dialog_nButton.dart';
import 'dialog_demos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'TextFieldDemoController.dart';
import 'package:startupnamer/ListViewDemoController.dart';
import 'bottom_sheet_demos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //    ScreenUtil.init(context, width: 1024, height: 768, allowFontScaling: false);
    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: false);
    return LayoutDemo();
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
              return DialogDemo(title: '跳转到Dialog传值');
//              return TextFieldDemoController();
//            return ListViewDemoController();
//                  return BottomSheetDemo();
                }));
              }),
        ],
      ),
    );
  }
}

//富文本；Text.rich
/*
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      //使用Text.rich构建富文本
      child: Text.rich(TextSpan(
        //开头的文本
        text: 'Hello',
        //文本默认样式
        style: TextStyle(
          fontSize: ScreenUtil().setSp(13),
          color: Color(0xFF999999),
        ),
        //后面的子元素依次拼接，所有子元素的style会覆盖最上级TextSpan的style。
        children: <TextSpan>[
          TextSpan(
            text: ' beautiful ',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(16), color: Color(0xffEF5D44)),
          ),
          TextSpan(
            text: ' world ',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFF999999)),
          ),
        ],
      )),
    );
  }
}
 */

// 各种函数比较
/*
// A top-level function
void foo(){

}


void main(){

  var x;

  // Comparing top-level functions. 和顶级函数做比较;
  x = foo;
  assert(foo == x);

  // Comparing static methods. 静态方法比较
  x = A.bar;
  assert(A.bar == x);

  // Comparing instance methods. 实例方法比较
  var v = A();
  var w = A();
  var y = w;
  x = w.baz;

//  这些闭包指向同一个实例w，所以它们相等。
  assert(y.baz == x);

// 这些闭包引用不同的实例，因此它们是不相等的。
  assert(v.baz != w.baz);
}



class A {

  // A static method：静态方法。同iOS的类方法；
  static void bar() {

  }

  // An instance method:类里面的是实例方法；
  void baz(){

  }
}
*/

/*

// Stack组件

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: LayoutDemo(),
      ),
    );
  }
}

//相对于box的边缘定位他的子元素们的小部件。 所有的小部件就是按顺序排列的子view，
//放在同一个父视图Stack上。就是一个UIView->subviews关系。
//以子元素中Size最大的widget为基准对齐。但是按children的顺序依次添加渲染的，
//就是第二个如果比第一个大会覆盖，和iOS的UIView的addSubview同一个原理。
//注意：Align特殊处理，会导致排版混乱。
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Stack(
        alignment: Alignment.topLeft,
        //如何调整Stack中未定位的子元素的大小。
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            color: Colors.red,
          ),
          Container(
            width: 360,
            height: 100,
            color: Colors.green,
          ),
          Container(
            width: 80,
            height: 80,
            color: Colors.blue,
          ),
//          //无限大，比全屏幕还大。
//          Container(
//            color: Colors.orange,
//
//          ),
          Container(
            color: Colors.orange,
            child: Text("文本"),
          ),
          Text(
            "加工类型",
          ),
          Align(
            child: Text(
              "加工类型",
            ),
          ),
        ],
      ),
    );
  }
}
*/

// Navigator的push跳转及传值
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text('跳转'),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return DialogPage(title: '跳转到Dialog传值');
            }));
          }),
    );
  }
}

 */

/////视频教程的demo1
/*
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Scaffold(
         appBar: AppBar(
           title: Text('Flutter Demo'),
         ),
         body: HomeContent(),
      ) ,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}

class HomeContent  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        '你好Flutter',
        textDirection: TextDirection.ltr,

        style: TextStyle(
          fontSize: 40.0,
//          color: Colors.yellow,
          color: Color.fromRGBO(244, 233, 214, 0.5),
        ),
      ),
    );
  }
}
*/

/////视频教程的demo2 ： Container组件, Text文本组件 详解
/*
class MyApp2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter demo'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: Text(
          '各位同学大家好，各位同学大家好，各位同学大家好，各位同学大家好，各位同学大家好，各位同学大家好',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          //字体显示倍率，字体缩放
          textScaleFactor: 1.0,

          style: TextStyle(
            fontSize: 16.0,
            color: Color.fromRGBO(0, 1, 1, 1),
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            //文字装饰
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.white,
            decorationStyle: TextDecorationStyle.dashed,
            letterSpacing: 5.0,
          ),
        ),
        height: 300.0,
        width: 300.0,
        //容器装饰的背景颜色，边框颜色
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(
            color: Colors.blue,
            width: 2.0
          ),
          borderRadius:BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
//        padding: EdgeInsets.all(20),
        padding: EdgeInsets.fromLTRB(10, 30, 5, 0),
        alignment: Alignment.center,
      )
    );
  }
}
*/

/////视频教程的demo3 ： 图片组件Image详解

/*
class MyApp2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter demo'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
          child: Image.network(
            "https://pics6.baidu.com/feed/9358d109b3de9c825b28c0133091350c18d843f7.jpeg?token=8d115bd85ec187149ddedc643b4cd4e1",
//            alignment: Alignment.bottomRight,
            //设置图片背景色，通常和colorBlendModel配合使用，这样可以是图片颜色和背景色混合。基本不用，一般只有用fit
//            color: Colors.blue,
//            colorBlendMode: BlendMode.luminosity,
            //fit属性用来控制图片的拉伸和挤压，这都是根据父容器来的。
            // BoxFit.fill：全图显示，图片会被拉伸，并充满父容器。
            // BoxFit.contain:全图显示，显示原比例，可能会有空隙。
            // BoxFit.cover:显示可能会被拉伸，但不变形，可能裁剪，图片要充满整个容器。
            fit: BoxFit.cover,
//            平铺，不能和fit同时使用。一般不用，
//            repeat: ImageRepeat.repeatY,
          ),
          height: 300.0,
          width: 300.0,
          //容器装饰的背景颜色，边框颜色
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
                color: Colors.blue,
                width: 2.0
            ),
            borderRadius:BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        )
    );
  }
}
*/

/////视频教程的demo4 ： 实现圆角图片：二种方式

/*
class MyApp2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter demo'),
        ),
        body: HomeContent(),
      ),
    );
  }
}
*/

/*
//方式一：在容器装饰的属性中 设置 装饰image
class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
          height: 300.0,
          width: 300.0,

          //容器装饰
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius:BorderRadius.circular(150),
            image: DecorationImage(
              image:NetworkImage(
                  "https://pics6.baidu.com/feed/9358d109b3de9c825b28c0133091350c18d843f7.jpeg?token=8d115bd85ec187149ddedc643b4cd4e1",
              ),
              fit: BoxFit.cover,
            ),
          ),
        )
    );
  }
}*/

//方式二：在容器装饰的属性中 设置 装饰image
/*
class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
              child: ClipOval(
                child: Image.network(
                  "https://pics6.baidu.com/feed/9358d109b3de9c825b28c0133091350c18d843f7.jpeg?token=8d115bd85ec187149ddedc643b4cd4e1",
                  height: 300.0,
                  width: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
        )
    );
  }
}
*/

// 视频教程5-GridView

//例1-GridView静态数据，显示一个正常的collectionView
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {

  List<Widget>_getListData(){
    List<Widget> list = List();

    for(var i = 0; i< 11; i++){
     // 在GridView的子元素children们的Container设置width，height无效。只能用childAspectRatio调整item的大小。
      Container container = Container(
        child: Text('这是第$i条数据',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        color: Colors.blue,
        alignment: Alignment.center
      );
      list.add(container);
    }
    return list;
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(

      crossAxisCount: 3,
      children: this._getListData(),
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 20.0,
      padding:EdgeInsets.all(10) ,
      childAspectRatio:0.7 ,//宽度和高度的比例
    );
  }
}
*/

//例2-GridView.count静态数据，显示一个正常的collectionView-map数据

/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {

  List<Widget>_getListData(){

    var tempList = listData.map((value){
        return Container(
          child: Column(
            children: <Widget>[
              Image.network(value['imageUrl']),
              SizedBox(height: 10,),
              Text(
                  value['title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,

                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(233, 233, 233, 0.9),
              width: 1,
            )
          ),
        );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(

      crossAxisCount: 2,
      children: this._getListData(),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      padding:EdgeInsets.all(10) ,
    );
  }
}
*/

//例3-GridView.duilder动态数据
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  //动态数据
  Widget _getListData(context,index){

    return Container(
      child: Column(
        children: <Widget>[
          Image.network(listData[index]['imageUrl']),
          SizedBox(height: 10,),
          Text(
            listData[index]['title'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,

            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(233, 233, 233, 0.9),
            width: 1,
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(

      itemCount: listData.length,
      itemBuilder: this._getListData,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,),
    );
  }
}
*/

// 视频教程6-Padding
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      //最外层包一个左边10间距
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          //每个子元素在上，左 内边距为10；
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/1.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/2.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/3.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/4.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/5.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/6.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/7.png',
                fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
 */

// 视频教程7-自定义按钮组件

/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconContainer(Icons.search);
  }
}
//自定义按钮组件,开放size，bgColor，icon图标属性
class IconContainer extends StatelessWidget{

  final double size;
  final Color bgColor;
  final IconData icon;
  //构造函数
  IconContainer(this.icon,{this.bgColor = Colors.red,this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 100.0,
        width: 100.0,
        color: this.bgColor,
        child: Center(
            child: Icon(
                this.icon,size: this.size,color: Colors.white,),
        ),
    );
  }
}
*/

// 视频教程8-Row，Cloumn

//Row，Cloumn和Row使用基本相同；
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 250.0,
      width: 250.0,
      color: Colors.pink,
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          IconContainer(Icons.search,bgColor: Colors.blue),
          IconContainer(Icons.home,bgColor: Colors.orange),
          IconContainer(Icons.add)
        ],
      ),
    );
  }
}
//自定义按钮组件,开放size，bgColor，icon图标属性
class IconContainer extends StatelessWidget{

  final double size;
  final Color bgColor;
  final IconData icon;
  //构造函数
  IconContainer(this.icon,{this.bgColor = Colors.red,this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment:Alignment.center ,
      height: 60.0,
      width: 60.0,
      color: this.bgColor,
      child:Icon(
        this.icon,size: this.size,color: Colors.white,),
    );
  }
}
*/

// 视频教程9-Expanded
//展开[Row]、[Column]或[Flex]子元素的小部件;让child填满可用的空间。只有一个Expanded只表示自适应填满可用空间，如果有多个Expanded，则表示占总空间的几份。

/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: LayoutDemo(),
      ),
    );
  }
}

//Expanded: 展开[Row]、[Column]或[Flex]子元素的小部件;让child填满可用的空间。
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        //展开占总可用空间的1成；
        Expanded(
          child: IconContainer(Icons.search, bgColor: Colors.blue),
          flex: 1,
        ),
        //展开占总可用空间的2成；
        Expanded(
          child: IconContainer(Icons.home, bgColor: Colors.orange),
          flex: 2,
        ),
        IconContainer(Icons.add),//固定大小，IconContainer内部设置的60*60
      ],
    );
  }
}

//自定义按钮组件,开放size，bgColor，icon图标属性
class IconContainer extends StatelessWidget {
  final double size;
  final Color bgColor;
  final IconData icon;
  //构造函数
  IconContainer(this.icon, {this.bgColor = Colors.red, this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      width: 60.0,
      color: this.bgColor,
      child: Icon(
        this.icon,
        size: this.size,
        color: Colors.white,
      ),
    );
  }
}
*/

// 视频教程10-综合布局例子，结合了Column，Row，Expanded,Container,SizedBox,Image,ListView
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: LayoutDemo(),
      ),
    );
  }
}

// 最外层为Column垂直布局,2个子元素组+SizedBox； 第一个组 用Row 包裹 Expanded自适应填充主轴空间的Container，设置固定高度。
// 第二组子元素：左右 水平布局，所以用Row包裹。 由于左边占2份宽度空间，右边占1份宽度空间，所以children的每个child用Expanded包裹。
// Row的每个Expanded的指定child是一个Container，可以设置固定高度。右边的Container包裹一个ListView线性布局。
//Expanded: 展开[Row]、[Column]或[Flex]子元素的小部件;让child填满可用的空间。
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[

        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 180.0,
                color: Colors.black,
                child: Text('你好，flutter'),
              ),
              flex: 1,
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(

          children: <Widget>[
            Expanded(
                child: Container(
                  child: Image.network(
                      'https://www.itying.com/images/flutter/2.png',
                      fit: BoxFit.cover),
                  height: 180.0,
                ),
                flex: 2),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Container(
                height: 180,
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: (180-10)/2,
                      child: Image.network(
                          'https://www.itying.com/images/flutter/3.png',
                          fit: BoxFit.cover),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: (180-10)/2,
                      child: Image.network(
                          'https://www.itying.com/images/flutter/4.png',
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
*/

/////////////////////////////////----UI--////

//例如1:无状态小部件
//a.这个示例创建了一个Material应用程序。Material是一种可视设计语言，在移动和web上都是标准的。Flutter提供了一套丰富的Material widgets（材料小部件）。
//b.该应用程序扩展了StatelessWidget，使应用程序本身成为一个小部件。在Flutter中，几乎所有东西都是小部件，包括对齐、填充和布局。
//c.来自Material library库的Scaffold widget小部件提供了一个默认的应用程序栏、标题和一个body属性，该属性用于保存主屏幕的小部件树。小部件子树可能非常复杂。
//d.小部件的主要工作是提供一个build()方法，该方法描述如何根据其他较低级别的小部件显示小部件。
//e.本例的主体由一个包含文本子小部件的Center小部件组成。Center小部件将其小部件子树对齐到屏幕的中心。
//
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context){
//    return MaterialApp(
//      title: 'Welcome to Flutter1',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcome to Flutter2'),
//        ),
//        body: Center(
//          child: Text('hello world'),
//        ),
//      ),
//    );
//  }
//}

//例如2:无状态小部件:使用外部包
//使用一个名为english_words的开源包，它包含几千个最常用的英语单词和一些实用函数。
//您可以在pub.dev上找到english_words包，以及许多其他开放源码包。
//pubspec.yaml文件在pubspec中管理Flutter应用程序的assets资产和依赖项。在pubspec.yaml，将english_words(3.1.5或更高)添加到依赖项列表中:

/*
class MyApp2 extends StatelessWidget{

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter3'),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
*/

//例如3:添加一个有状态的小部件
//有状态的小部件维护可能在小部件的生命周期内更改的状态。实现一个有状态的小部件至少需要两个类:
//1)创建一个状态类实例的StatefulWidget类
//2)一个State类。状态小部件类本身是不可变的，但是状态类在小部件的生命周期内持续存在。

//添加一个有状态小部件RandomWords，它将创建其状态类RandomWordsState。
//然后，您将在现有的MyApp无状态小部件中使用RandomWords作为子元素。

/*
class MyApp3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Welcome to Flutter1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter2'),
        ),
        body:Center(
          child:RandomWords(),
        ),
      ),
    );
  }
}

//它将创建其状态类RandomWordsState
class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}


class RandomWordsState extends State<RandomWords> {
  // TODO Add build() method
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}
*/

//例如4 Create an infinite scrolling ListView 创建一个无限滚动的列表视图

/*
//它将创建其状态类RandomWordsState
class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}


//在RandomWordsState类中，将build()方法更新为使用_buildSuggestions()，而不是直接调用单词生成库。
class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Startup Name Generator',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26),
        ),
      ),
      body: _buildSuggestions(),
    );
  }

//  该_buildSuggestions()函数_buildRow()每个单词对调用一次。此功能在中显示每个新对ListTile，
//  这使您可以在下一步中使行更具吸引力。
Widget _buildSuggestions(){
  return ListView.builder(
    padding: const EdgeInsets.all(16.0),
//该itemBuilder回调被称为每个提示词配对一次，每个建议放入一ListTile排。对于偶数行，
// 该函数ListTile为单词配对添加一行。对于奇数行，该函数添加了一个Divider小部件以在视觉上分隔条目。
// 请注意，在较小的设备上可能很难看到分频器。
      itemBuilder: (context,i){

//    在中的每一行之前添加一个高一个像素的分隔器小部件ListView。
      if (i.isOdd) return Divider();
//    该表达式i ~/ 2除以i2，然后返回整数结果。例如：1、2、3、4、5变为0、1、1、2、2。
//    这将计算ListView减去减号控件的实际单词配对数。
      final index = i ~/ 2;
      if (index >= _suggestions.length){
//        如果您已达到可用单词配对的末尾，请再生成10个单词对并将其添加到建议列表中。
        _suggestions.addAll(generateWordPairs().take(10)); /*4*/
      }
      return _buildRow(_suggestions[index]);
  });
}

Widget _buildRow(WordPair pair){
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}
}

class MyApp4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}
*/

///例如 5  How do I update widgets?
/*
class MyApp5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ) ,
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage  extends StatefulWidget{
  SampleAppPage({Key key}) :super(key: key);
  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage>{
  String textToShow = "I Like Flutter";
  void _updateText(){
    setState(() {
      textToShow = "Flutter is Awesome!";
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Center(child: Text(textToShow),),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        child: Icon(Icons.update),
      ),
    );
  }
}
*/

/// 例如6：How do I lay out my widgets? Where is my Storyboard?
///
/*
class MyApp6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SampleAppPageState();
  }
}
class _SampleAppPageState extends State<SampleAppPage> {

  String textToShow = "I Like Flutter";
  int _pressedCount = 0;

  void _addAction() {
    setState(() {
      _pressedCount += 1;
      textToShow = "pressedCount";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SampleApp2'),
      ),
      body: Center(
          child: Text(textToShow + _pressedCount.toString())
      ),


      floatingActionButton:CupertinoButton(

        child: Text('点击'),
        onPressed:_addAction,
        padding: EdgeInsets.only(left: 20.0, right: 20),
        color:Colors.blue,
      ),
    );
  }
}
*/

/// 例7：如何从布局中添加或删除组件?
/*
class MyApp7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage7(),
    );
  }
}

class SampleAppPage7 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SampleAppPageState7();
  }
}

class _SampleAppPageState7 extends State {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return CupertinoButton(
        child: Text('Toggle Two'),
        onPressed: () {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}
*/

/// 例8：如何为小部件制作动画？

class MyApp8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Fade Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFadeTest(
        title: 'Fade Demo',
      ),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFadeTest();
  }
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        duration: const Duration(microseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

//例如9：How do I draw to the screen?
/*
class SignaturePainter extends CustomPainter {

  SignaturePainter(this.points);

  final List<Offset>points;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint()
        ..color = Colors.black
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5.0;
    for(int i = 0; i < points.length -1; i++){
      if(points[i] != null && points[i + 1] != null){
        canvas.drawLine(points[i], points[i+1], paint);
      }
    }
  }
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class Signature extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignatureState();
  }
}

class SignatureState extends State<Signature>{

  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details){
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: CustomPaint(painter: SignaturePainter(_points), size: Size.infinite),
    );
  }
}

//
//class _SampleAppPageState extends State<SampleAppPage> {
//  String textToShow = "I Like Flutter";
//  int _pressedCount = 0;
//
//  void _add() {
//    setState(() {
//      _pressedCount += 1;
//      textToShow = "Flutter is Awesome!";
//      var result = fibonacci(20);
//      print(result);
//    });
//  }
//
//  int fibonacci(int n) {
//    if (n == 0 || n == 1) return n;
//    return fibonacci(n - 1) + fibonacci(n - 2);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('SampleApp2'),
//      ),
//      body: Center(child: Text(textToShow + _pressedCount.toString())),
//      floatingActionButton: CupertinoButton(
//        child: Text('点击'),
//        onPressed: _add,
//        padding: EdgeInsets.only(left: 10.0, right: 10),
//        color: Colors.blue,
//      ),
//    );
//  }
//}
//
*/

//例如10：How do I build custom widgets? 如何构建自定义小部件?
/*
class MyApp10 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Fade Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomButtom('Hello'),
    );
  }
}

class CustomButtom extends StatelessWidget {

   final String label;
   CustomButtom(this.label);

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(onPressed: (){},child:Text(label));
  }
}

*/

// 例如11：flutter跳原生页面

/*
class MyApp7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: '113'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

/*<与原生交互信号通道 >*/
const methodChannel = const MethodChannel('flutter_to_native');

class _MyHomePageState extends State<MyHomePage> {

  //封装 Flutter 向 原生中 发送消息 的方法
  //method 为方法标识
  //arguments 为参数

  // 单个参数
  static Future<dynamic> tokNative(String method,{Map arguments}) async{

      if(arguments == null)
      {
          return await methodChannel.invokeMethod(method);
      }else
        {
          return await methodChannel.invokeMethod(method,arguments);
        }
  }

  // 调用多个参数
  static Future<dynamic> goNativeWithValue(String methodName,
      [Map<String, dynamic> map]) async {
    if (null == map) {
      //无参数
      dynamic future =
      await methodChannel.invokeMethod(methodName); //methodName方法名
      return future;
    } else {
      //带有参数
      dynamic future = await methodChannel.invokeMethod(methodName, map);
      return future;
    }
  }

var params = {
  'token':'1234567',
  'expressDate': '00:00:00',
};
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new ListTile(
              title: new Text('flutter与原生交互,push'),
              trailing: FlatButton(onPressed:() {

                  goNativeWithValue('flutter_goToNative_Test',params)
                ..then((result){
                  print('$result');
                });
                  print('push操作');
              }, child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              )),
            ),

            new ListTile(
              title: new Text('flutter与原生交互,present'),
              trailing: FlatButton(onPressed: (){
                tokNative('flutter_goToNative_Test_Present')
                  ..then((result){
                    print('$result');
                  });
                    print('present操作');
                  }, child: Icon(
                  Icons.arrow_forward_ios,
                  size:20,
                  )),
            )
            ],
        ),
      ),
    );
  }
}
*/

////////////////////////dart 语言 学习//////////////////////////////////////

///dart语言特性例子

//5.Classes 类，
//下面是一个具有三个属性、两个构造函数和一个方法的类的示例。其中一个属性不能直接设置，所以它是使用getter方法(而不是变量)定义的。
/*
void main() {

  var voyager = Spacecraft('Voyager I', DateTime(1977,9,5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
}

class Spacecraft {
  String name;
  DateTime launchDate;

  Spacecraft(this.name, this.launchDate) {

  }

  Spacecraft.unlaunched(String name) : this(name, null);

  int get launchYear => launchDate?.year;

  void describe() {
    print('Spacecraft:$name');
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched:$launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}
*/

//6.Inheritance：Dart具有单继承。 extends-继承的意思；
/*
class Orbiter extends Spacecraft {
  num altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
}
*/

//7.Mixins 混合---扩展
/*
class Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}
class PilotedCraft extends Spacecraft with Piloted{

}
*/

//8。Interfaces and abstract classes 接口和抽象类
/*
class MockSpaceship implements Spacecraft{

}
*/

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('----------------');
    describe();
    print('----------');
  }
}

//9.Async
/*
const oneSecond = Duration(seconds: 1);
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}

Future<void> printWithDelay(String message) {
  return Future.delayed(oneSecond).then((_){
    print(message);
  });
}

Future<void> createDescriptions(Iterable<String> objects) async {

  for (var object in objects){

    try{
      var file = File('$object.txt');
      if(await file.exists()){
        var modified = await file.lastModified();
        print('File for $object already exists. It was modified on $modified');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch(e){
      print('Cannot create description for $object: $e');
    }
  }
}
*/

// dart -2-Language cheatsheet 菜单

// 1.可选参数 ，可选命名参数；

//1.1 Optional positional parameters 可选参数；

/*
class Spacecraft {

  int sumUp(int a, int b, int c){
    return a + b + c;
  }

  int sumUpToFive(int a,[int b, int c, int d, int e])
  {
    int sum = a;
    if (b != null) sum += b;
    if (c != null) sum += c;
    if (d != null) sum += d;
    if (e != null) sum += e;
    return sum;
  }

  int sumUpToFive2(int a, [int b =2, int c = 3, int d = 4, int e = 5]){
    int sum = a;
    if (b != null) sum += b;
    if (c != null) sum += c;
    if (d != null) sum += d;
    if (e != null) sum += e;
    return sum;
  }
}
*/

//1.2 Optional named parameters 可选的命名参数
/*
void main() {

  var obj = Spacecraft1();
  obj.printName('Zhu', 'XinMing');
  obj.printName('Zhu', 'XinMing', suffix: 'H');
}
class Spacecraft1 {

  void printName(String firstName, String lastName, {String suffix}) {
    print('$firstName $lastName ${suffix ?? ''}');
  }
}

class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
});
  MyDataObject copyWith(int newInt, String newString, double newDouble){

    return MyDataObject(anInt: newInt ?? this.anInt,
                      aString:newString ?? this.aString,
                      aDouble: newDouble ?? this.aDouble);
  }
}
*/

// 2. 构造函数： {}包起来的参数是可选命名参数，[]包起来的参数是可选位置参数；

//2.1 Using this in a constructor 在构造函数中使用this;
//例1
/*
void main() {

  final color = MyColor(red: 80, green: 80, blue: 80);
}

class MyColor {
  int red;
  int green;
  int blue;


  MyColor({this.red,this.green,this.blue});
}
*/

/*
class MyClass {
  final int anInt;
  final String aString;
  final double aDouble;

  MyClass(this.anInt, this.aString, this.aDouble);
}
*/

//例2
/*
class Test {
  String title;
  int age;
  String sex;

  Test(this.title, this.age, {this.sex});

  @override
  String toString() {
    print('Test{title: $title, age: $age, sex: $sex}');
    return 'Test{title: $title, age: $age, sex: $sex}';
  }
  void test() {
    print('test');
  }
}
*/

//2。2 Initializer lists 初始化器列表

//class Point {
//  final String x;
//  final String y;
//
//  Point.fromJson(Map<String, num> json)
//             : x = json['x'],
//               y = json['y'] {
//    print('In Point.fromJson() :($x, $y)');
//  }
//}

// 2。3 命名构造函数

/*
class Point {

  double x, y;
  Point(this.x, this.y);

  // 命名构造函数
  Point.origin() {
    x = 0;
    y = 0;
  }
}

void main() {

  final obj = Point.origin();
}

//例2:
class Color {

  double r,g,b;
  Color.black(){
    r = 0;
    g = 0;
    b = 0;
  }
}
*/

//2。4 Factory constructors 工厂构造
/*
class Square extends Shape {

}

class Circle extends Shape {

}

class Shape {
  Shape();

  factory Shape.fromTypeName(String typeName){

    if (typeName == 'square') return Square();
    if (typeName == 'circle') return Circle();

    print('I don\'t recognize $typeName');

    return null;
  }
}
*/

//2。5  Redirecting constructors 重定向构造函数
/*
class Automobile {
  String make;
  String model;
  int mpg;
  // The main constructor for this class.
  Automobile(this.make, this.model, this.mpg);

  // Delegates to the main constructor.
  Automobile.hybrid(String make, String model) : this(make, model, 60);

  Automobile.fancyHybrid() : this.hybrid('Futurecar', 'Mark 2');
}

class Color {
  double r,g,b;
  Color(this.r, this.g, this.b);
  Color.black() : this(0, 0, 0);


}
*/

//2。6  Const constructors

class ImmutablePoint {
  const ImmutablePoint(this.x, this.y);

  final int x;
  final int y;

  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final name = 'Bob'; // Without a type annotation
  final String nickname = 'Bobby';
}

//  Tour类目  笔记

//1.Built-in types:String

//Dart字符串是UTF-16编码单元的序列。你可以使用单引号或双引号来创建一个字符串:

/*
class Test {

  // 单引号对于字符串文本非常有用
  var s1 = 'Single quotes work well for string literals';
  // 双引号也可以
  var s2 = "Double quotes work just as well";
  // 它可以转义字符串分隔符。
  var s3 = 'It\'s esay to escape the string delimiter.';
  // 使用其他分隔符甚至更简单.
  var s4 = "It's even easier to use the other delimiter.";

  var s = 'string interpolation';

  Test(this.s):assert(s != null);

  void test(){
    //  注意:==操作符测试两个对象是否相等。如果两个字符串包含相同的代码单元序列，则它们是等价的。
    assert('Dart has $s, which is very handy.' == 'Dart has string interpolation,' + 'which is very handy.');

    assert('That deserves all caps. ' + '${s.toUpperCase()} is very handy!' == 'That deserves all caps. ' +
      'STRING INTERPOLATION is very handy! ');

    var s1 = 'String '
    'Concatenation'
    " works even over line breaks.";
    assert(s1 ==
        'String concatenation works even over '
            'line breaks.');

    var s2 = 'The + operator ' + 'works, as well.' ;
    assert(s2 == 'The + operator works, as well.');

    var s3 = '''
    You can create
    multi-line strings like this one.
    ''';

    var s4 = """" This is also a
    multi-line string.""";

    // These work in a const string.
    const aConstNum = 0;
    const aConstBool = true;
    const aConstString = 'a constant string';

    var aNum = 0;
    var aBool = true;
    var aString = 'a string';
    const aConstList = [1, 2, 3];

    const validConstString = '$aConstNum $aConstBool $aConstString';

    bool flag = true;
    if(flag){
      print('真');
    }else{
      print('假');
    }
    var fullName = '';
    assert(fullName.isEmpty);

    var hitPoints = 0;
    assert(hitPoints <= 0);

    var unicorn;
    assert(unicorn == null);



    var list = [1, 2, 3];
  }
}
*/

/// 2.Built-in types:各种集合

// Set
/*
void main() {

  //  用它最主要的功能就是去除数组重复。
  var s = new Set();
  s.add('香蕉');
  s.add('苹果');
  s.add('苹果');
//  flutter: {香蕉, 苹果}
  print(s);

//  创建一个包含这个[Iterable]元素的[List]。
  List list = s.toList();
//  flutter: [香蕉, 苹果]
  print(list);
}
*/

// List
/*
void main() {

  List myList = ['香蕉','苹果','西瓜'];
  // 增加一个数据
  myList.add('桃子');
  // 拼接数组
  myList.addAll(['桃子','葡萄']);

  //indexOf查找数据，查找不到返回-1，查找到返回索引。
  int index =  myList.indexOf('苹果');
  //1
  print(index);

  //删除查找到的第一个对象。
  myList.remove('桃子');
  // flutter: [香蕉, 苹果, 西瓜, 桃子, 葡萄]
  print(myList);
  //删除指定索引的对象
  myList.removeAt(0);
  // flutter: [苹果, 西瓜, 桃子, 葡萄]
  print(myList);

  //修改数据，起始位置，结束位置。 从索引1开始，到结束索引位置2
  myList.fillRange(1, 2,'aaa');
  // flutter: [苹果, aaa, 桃子, 葡萄]
  print(myList);
  //1-3都修改为'aaa'
  myList.fillRange(1, 3,'aaa');
  // flutter: [苹果, aaa, aaa, 葡萄]
  print(myList);

  //指定索引插入某个数据
  myList.insert(0, '香蕉');
  // flutter: [香蕉，苹果, aaa, aaa, 葡萄]
  print(myList);
  // 指定位置插入多个数据
  myList.insertAll(1, ['西瓜','桃子']);
  // flutter: [香蕉，西瓜, 桃子, 苹果, aaa, aaa, 葡萄]
  print(myList);

//  List转换成字符串。
  var str = myList.join('-');
//  flutter: 香蕉-西瓜-桃子-苹果-aaa-aaa-葡萄
  print(str);
//  flutter: true
  print(str is String);

  var list = str.split('-');
//  flutter: [香蕉, 西瓜, 桃子, 苹果, aaa, aaa, 葡萄]
  print(list);
}
*/

// Map
/*
void main() {

  Map gifts = {
    'first' : '1',
    'second': '2',
    'fifth' : '3',
  };
  //拼接增加一个字典
  gifts.addAll({
    '爱好':['游戏','旅游'],
    "体重":61.6
  });
//  flutter: {first: 1, second: 2, fifth: 3, 爱好: [游戏, 旅游], 体重: 61.6}
  print(gifts);

  //删除指定key的数据。
  gifts.remove('爱好');
//  flutter: {first: 1, second: 2, fifth: 3, 体重: 61.6}
  print(gifts);
  // 查看map中是否包含某个key；
  bool contains = gifts.containsKey('first');
}
*/

/*
class Test {
  var gifts = {
    'first' : 'partridge',
    'second': 'turtledoves',
    'fifth' : 'golden rings',
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18:'argon',
  };
}
*/

/*
class Test1 {

  //  You can create the same objects using a Map constructor:
//  你可以创建相同的对象使用Map构造函数:
//  注意，在class类初始化类结构的时候，只能有实例变量的声明及初始化，函数方法。不能调用执行方法。
  var gifts = Map();
  var nobleGases = Map();

  test(){
    gifts['first'] = 'partridge';
    gifts['second'] = 'turtledoves';
    gifts['fifth'] = 'golden rings';

    nobleGases[2] = 'helium';
    nobleGases[10] = 'neon';
    nobleGases[18] = 'argon';
  }
}
*/

/*
class Test2 {
  test (){
    var gifts = {'first' : 'partridge'};
    gifts['fourth'] = 'calling birds';
  }

  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18:'argon',
  }
  test2 (){
    // constantMap[2] = 'Helium'; // Uncommenting this causes an error.
  }
}
*/

/*
class Test3{

  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18:'argon',
  }
  test (){
    // constantMap[2] = 'Helium'; // Uncommenting this causes an error.
  }
}
*/

/*
void setData()
{
  final aListOfStrings = ['one', 'two', 'three'];
  final aSetOfStrings = {'one', 'two', 'three'};
  final aMapOfStringsToInts = {
    'one': 1,
    'two': 2,
    'three': 3,
  };
}
*/

// for循环的三种方式：
/*
void test() {

  List myList = ['香蕉','苹果','西瓜'];
  for(var i = 0; i<myList.length; i++) {

    print(myList[i]);
  }

  for(var item in myList){
    print(item);
  }

  myList.forEach((value){
    print("$value");
  });
}
*/

// 修改集合的数据
/*
void test() {

  // 修改
  List list1 = [1,2,3];
  List mList = List();

  for(int i =0; i<list1.length; i++){
    mList.add(list1[i] * 2);
  }
  print(mList);
  //flutter: [2, 4, 6]
}
*/
/*
void test() {

  // 按迭代顺序遍历集合中的元素，让每个元素调用函数方法并返回修改后的新集合；
  List list1 = [1,2,3];
  Iterable mList = list1.map((value){

     return value * 2;
  });

}
*/
/*
void test() {
  // 循环遍历集合，返回满足函数条件的组成的新集合
  List list1 = [1,2,3,4,5,6,7,8,9];
  Iterable mList = list1.where((value){
    return value>5;
  });
  print(mList.toList());
}
//flutter: [6, 7, 8, 9]
*/

/*
void test() {
  // 循环遍历集合，只要集合里面有满足条件的就返回true
  List mylist = [1,2,3,4,5,6,7,8,9];
  var flag = mylist.any((element){
      return element>5;
  });
  print(flag);
}
//flutter: true
*/

void test() {
  // 循环遍历集合，每个都满足条件就返回true，否则返回false
  List mylist = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var flag = mylist.every((element) {
    return element > 5;
  });
  print(flag);
}

/// 3。 函数
/*
String upperCaseIt(String str) {
  return str?.toUpperCase();
}
*/

/*
class BigObject {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;

  void allDone() {
    _done = true;
  }

  BigObject fillBigObject(BigObject obj) {
    return obj
      ..anInt = 1
      ..aString = 'String1'
      ..aList = [3.0]
      ..allDone();
  }
}
*/

/*
class MyClass {

  int _aProperty = 0;

  int get aProperty => _aProperty;

  set aProperty(int value) {
    if (value >= 0) {
      _aProperty = value;
    }
  }
}
*/

/*
class MyClass {

  List<int> _values = [];

  void addValue(int value) {
    _values.add(value);
  }

  int get count {
    return _values.length;
  }
}
*/
class InvalidPriceException {}

class ShoppingCart {
  List<double> _prices = [1.2, 3.5];

  // Add a "total" getter here:
  double get total {
    return _prices.fold(0, (e, t) => e + t);
  }

  // Add a "prices" setter here:
  set prices(List<double> value) {
    if (value.any((p) => p < 0)) {
      throw InvalidPriceException();
    }
    _prices = value;
  }
}

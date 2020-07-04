
import 'package:flutter/material.dart';


class TextFieldDemoController extends StatefulWidget{

  TextFieldDemoController({Key key}): super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextFieldDemoPageState();
  }
}

class _TextFieldDemoPageState extends State<TextFieldDemoController>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField演示页面"),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
//              //1.默认样式，InputDecorator的默认值是' const UnderlineInputBorder() ‘。
              TextField(
                decoration: InputDecoration(
                  hintText: "默认装饰器，",
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              //4.InputDecoration.collapsed-定义与输入字段大小相同的[InputDecorator]，没有边框。
              TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "请输入昵称，设置collapsed",
                ),
              ),
              SizedBox(height: 10,),
//              //2.InputDecoration-labelText
//              TextField(
//                decoration: InputDecoration(
//                  labelText: "用户名",
//                  border: OutlineInputBorder(),
//                ),
//              ),
//              SizedBox(height: 10,),
//              //2.InputDecoration-设置icon,hintText,helperText,counterText
//              TextField(
//                decoration: InputDecoration(
//                  icon: Icon(Icons.send),
//                  hintText: "Hint Text",
//                  helperText: "Helper Text",
//                  counterText: "0 characters",
////                  border: OutlineInputBorder(),
//                ),
//              ),
//              SizedBox(height: 10,),
//              //3.InputDecoration-占位字符串
//              TextField(
//                decoration: InputDecoration(
//                  hintText: "请输入昵称，默认",
//                  border: OutlineInputBorder(),
//                ),
//              ),
//              SizedBox(height: 10,),
              //5。定义isDense是否垂直缩小空间。
              TextField(
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "请输入昵称，设置了isDense属性",
                  border: OutlineInputBorder(),
                  focusColor: Colors.orange,
                  hoverColor: Colors.red,
                ),
              ),
              SizedBox(height: 10,),
              //6。修改contentPadding。
              TextField(
                decoration: InputDecoration(
                  hintText: "请输入昵称,只设置contentPadding",
                  //默认`EdgeInsets.fromLTRB(12, 20, 12, 12)`
                  contentPadding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                  border: OutlineInputBorder(
                    //[InputDecoration.labelText]宽度差距两边的水平填充。不懂？
//                      gapPadding: 4,
                      //边界的圆角矩形的半径。
                      borderRadius: const BorderRadius.all(Radius.circular(4.0))
                  ),
                ),
              ),
              SizedBox(height: 10,),
              //7。修改contentPadding，isDense。
              TextField(
                decoration: InputDecoration(
                  hintText: "请-设置了contentPadding，isDense",
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                  border: OutlineInputBorder(
                    //[InputDecoration.labelText]宽度差距两边的水平填充。不懂？
//                      gapPadding: 4,
                      //边界的圆角矩形的半径。
                      borderRadius: const BorderRadius.all(Radius.circular(4.0))
                  ),
                ),
              ),
              SizedBox(height: 10,),
              //7。设置前缀，后缀。
              TextField(
                decoration: InputDecoration(
                  hintText: '昵称',
                  prefix: Text('Prefix'),
                  suffix: Text('Suffix'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                style: TextStyle(textBaseline: TextBaseline.alphabetic,
                  fontSize: 28.0,
                ),
                decoration: InputDecoration(
                  hintText: "请输入份数",
                  hintStyle: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 28.0,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(162, 15, 20, 15),
                  filled: true,
                  fillColor:Color(0xffF2F1F6) ,
                  border:OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDDDDDD), width: 0.64,),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.64,),
                  ),
//                    prefixIcon: Icon(Icons.print),
                  prefix: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text("连打份数",style: TextStyle(fontSize: 28,color: Color(0xFF333333)),),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      fontSize: 28.0,
                    ),
                    decoration: InputDecoration(
                      hintText: "请输入份数",
                      hintStyle: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 28.0,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(162, 15, 20, 15),
                      filled: true,
                      fillColor:Color(0xffF2F1F6) ,
                      border:OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFDDDDDD), width: 0.64,),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 0.64,),
                      ),
//                    prefixIcon: Icon(Icons.print),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20,),
                    child: Text("连打份数",style: TextStyle(fontSize: 28,color: Color(0xFF333333)),),
                  ),
                ],
              ),
//              Container(
//
//              ),
//              TextField(
//                obscureText: true,
//                decoration: InputDecoration(
//                  hintText: "密码框",
//                  border: OutlineInputBorder(),
//                ),
//              )
//              SizedBox(height: 10,),
//              //8。textField多行文本框。
//              TextField(
//                maxLines: 2,
//                decoration: InputDecoration(
//                  hintText: "多行文本框",
//                  border: OutlineInputBorder(),
//                ),
//              ),
            ],
          ),
      ),
    );
  }
}
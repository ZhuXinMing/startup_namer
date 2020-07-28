import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:startupnamer/widgets/text_number_limit_formatter.dart';

class TextFieldDemoController extends StatefulWidget {
  TextFieldDemoController({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextFieldDemoPageState();
  }
}

class _TextFieldDemoPageState extends State<TextFieldDemoController> {

  FocusNode _node;
  bool _focused = false;
  FocusAttachment _nodeAttachment;
  Color _color = Colors.white;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _node = FocusNode(debugLabel: 'Button');
    _node.addListener(_handleFocusChange);
    _nodeAttachment = _node.attach(context,onKey:_handleKeyPress);
  }

  void _handleFocusChange(){
    if(_node.hasFocus != _focused){
      setState(() {
        _focused = _node.hasFocus;
      });
    }
  }

  bool _handleKeyPress(FocusNode node, RawKeyEvent event){
    if(event is RawKeyDownEvent){

      print('Focus node ${node.debugLabel} got key  event:${event.logicalKey}');
      if(event.logicalKey == LogicalKeyboardKey.keyR){
        print('Changing color to red.');
        setState(() {
          _color = Colors.red;
        });
        return true;
      }
    }
    return false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _node.removeListener(_handleFocusChange);
    _node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField演示页面"),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
//              //1.默认样式，InputDecorator的默认值是' const UnderlineInputBorder() ‘。
                TextField(
                  decoration: InputDecoration(
                    hintText: "默认装饰器，默认边框就是UnderlineInputBorder()",
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //4.InputDecoration.collapsed-定义与输入字段大小相同的[InputDecorator]，没有边框。
                TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "设置.collapsed,没有边框",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //2.InputDecoration-设置icon,hintText,helperText,counterText
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.send),
                    hintText: "设置icon属性，helper,hintText等",
                    helperText: "Helper Text",
                    counterText: "0 characters",
//                  border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
//              //3.InputDecoration-占位字符串
                TextField(
                  decoration: InputDecoration(
                    hintText: "设置外边框",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "设置labelText",
                    border: OutlineInputBorder(),
                    hintText:  "设置hintText",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //5。定义isDense是否垂直缩小空间。isDense默认false
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "设置了isDense属性",
                    border: OutlineInputBorder(),
                    focusColor: Colors.orange,
                    hoverColor: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //6。修改contentPadding。
                TextField(
                  decoration: InputDecoration(
                    hintText: "只设置contentPadding",
                    //contentPadding根据isDense导致默认值不同，`EdgeInsets.fromLTRB(12, 20, 12, 12)`
                    contentPadding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                    border: OutlineInputBorder(
                        //边界的圆角矩形的半径。
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //7。修改contentPadding，isDense。
                TextField(
                  decoration: InputDecoration(
                    hintText: "同时设置contentPadding，isDense",
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //7.设置前缀，后缀。
                TextField(
                  decoration: InputDecoration(
                    hintText: '昵称-设置了prefix，suffix',
                    prefix: Text('Prefix'),
                    suffix: Text('Suffix'),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    TextField(
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                        fontSize: 28.0,
                      ),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [TextNumberLimitFormatter(5,2)],
                      decoration: InputDecoration(
//                        labelText:  "请输入份数",
//                        labelStyle:TextStyle(
//                          color: Color(0xff999999),
//                          fontSize: 28.0,
//                        ),
                        hintText: "请输入份数",
                        hintStyle: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 28.0,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(162, 15, 20, 15),
                        filled: true,
                        fillColor:Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(),
                        ),
                        //默认情况下的边框
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 0.64,
                          ),
                        ),
                        //有焦点的时候边框
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 0.64,
                          ),
                        ),
//                    prefixIcon: Icon(Icons.print),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        "连打份数",
                        style:
                            TextStyle(fontSize: 28, color: Color(0xFF333333)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "密码框",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "多行文本框",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "多行文本框",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

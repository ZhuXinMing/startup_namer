import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

typedef OnConfirmListener = Function(String text);

class InputSeveralDialog extends Dialog {
  final String title;
  @required OnConfirmListener onConfirmListener;

  InputSeveralDialog({this.title = "", this.onConfirmListener});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: InputSeveralDialogPage(title: this.title,onConfirmListener: onConfirmListener,),
      ),
    );
  }
}

class InputSeveralDialogPage extends StatefulWidget {
  final String title;
  OnConfirmListener onConfirmListener;

  InputSeveralDialogPage({this.title = "", this.onConfirmListener});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InputSeveralDialogState();
  }
}

class InputSeveralDialogState extends State<InputSeveralDialogPage> {
  static double width = 460;
  static double height = 301;
  static double topContentHeight = 71;
  static double bottomBtnHeight = 70;

  TextEditingController _username = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _username.text = "初始值";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(height),
      decoration: BoxDecoration(
        color: const Color(0xff3F4251),
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.loose,
              children: <Widget>[
                Align(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Color(0xffFEC791),
                      fontSize: ScreenUtil().setSp(28),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Container(
                      width: ScreenUtil().setWidth(52),
                      height: ScreenUtil().setWidth(topContentHeight),
                      alignment: Alignment.center,
                      child: Image.asset(
                        "images/1x/icon_close.png",
                        width: ScreenUtil().setWidth(20),
                        height: ScreenUtil().setWidth(20),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: ScreenUtil().setWidth(height - topContentHeight - 10),
            width: ScreenUtil().setWidth(width - 10 * 2),
//                padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(10), 0,
//                  ScreenUtil().setWidth(10), ScreenUtil().setWidth(10)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setWidth(30),
                ),
                Container(
                  height: ScreenUtil().setWidth(70),
                  width: ScreenUtil().setWidth(400),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F1F6),
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(5)),
                    border: Border.all(color: Color(0xFFDDDDDD), width: 0.64),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20)),
                  child: Row(
                    children: [
                      Text(
                        "连打份数",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: Color(0xFF333333),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(20),
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                          ),
                          keyboardType: TextInputType.number,
                          controller: _username,
                          onChanged: (value) {
//                              _username.text = value;
                          },
//                          maxLength: 6,
                          decoration: InputDecoration.collapsed(
                              hintText: "请输入份数",
                              hintStyle: TextStyle(
                                fontSize: ScreenUtil().setSp(28),
                                color: Color(0xFF999999),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(30),
                ),
                Container(
                  height: ScreenUtil().setWidth(bottomBtnHeight + 20),
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), 0,
                      ScreenUtil().setWidth(20), ScreenUtil().setWidth(20)),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
//                              widget.onConfirmListener(widget.selectIndex);
                        widget.onConfirmListener(_username.text);
                        print("_userName.text = ${_username.text}");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffFF714A),
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().setWidth(5)),
                        ),
                        child: Text(
                          "确定",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(28),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
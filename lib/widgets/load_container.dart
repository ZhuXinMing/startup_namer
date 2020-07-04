import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'index.dart';

///
///   @Name    : merchant_sorting
///   @author  : 橄榄
///   @date    : 2020/7/2 14:25
///   @desc    : 页面加载视图
///   @version : 1.0
///
class LoadingContainer extends StatefulWidget {
  final Widget child;

  ///加载中视图
  final Widget loading;

  ///错误视图
  final Widget error;

  ///暂无数据
  final Widget noData;

  ///错误点击重试回调
  final GestureTapCallback onErrorClick;

  ///控制器
  final LoadingController loadingController;

  LoadingContainer(
      {Key key,
      @required this.child,
      this.loading = const Center(
        child: LoadingWidget(),
      ),
      this.error = const Center(
        child: ErrorWidget(),
      ),
      this.noData = const Center(
        child: NoDataWidget(),
      ),
      this.onErrorClick,
      @required LoadingController loadingController})
      : this.loadingController = loadingController ?? LoadingController(),
        super(key: key);

  @override
  _LoadingContainerState createState() => _LoadingContainerState();
}

class _LoadingContainerState extends State<LoadingContainer>
    with StateObserver<int> {
  int status = 0;

  @override
  void initState() {
    super.initState();
    widget.loadingController._attach(this);
  }

  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      return widget.loading;
    }
    if (status == -1) {
      return GestureDetector(
        child: widget.error,
        onTap: widget.onErrorClick,
      );
    }
    if (status == -2) {
      return widget.noData;
    }
    return widget.child;
  }

  @override
  void onNotifyData({int data}) {
    setState(() {
      status = data;
    });
  }
}

class LoadingController {
  StateObserver<int> _stateObserver;

  void _attach(StateObserver observer) {
    _stateObserver = observer;
  }

  ///加载完成
  void loadComplete() {
    _stateObserver.onNotifyData(data: 1);
  }

  ///加载失败
  void loadError() {
    _stateObserver.onNotifyData(data: -1);
  }

  ///无数据
  void loadNoData() {
    _stateObserver.onNotifyData(data: -2);
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
          child: Text(
            '加载中',
            style: TextStyle(
                color: Colors.white, fontSize: ScreenUtil().setSp(20)),
          ),
        )
      ],
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
          child: UI.image('no_data', width: ScreenUtil().setWidth(86)),
        ),
        Text(
          '网络异常，请点击重试',
          style:
              TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(20)),
        )
      ],
    );
  }
}

class NoDataWidget extends StatelessWidget {
  const NoDataWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(6)),
          child: UI.image('no_data', width: ScreenUtil().setWidth(86)),
        ),
        Text(
          '暂无数据',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20), color: Color(0xff93989E)),
        )
      ],
    );
  }
}

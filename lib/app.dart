import 'package:flutter/material.dart' hide Action;

import 'model/apps.dart';

///
/// 初始化各种配置，设置程序启动页面
///
/// @author David
/// @date 2019-08-16
///
Widget createApp() {
  return MaterialApp(
    title: '九畅店掌柜-V2',
//    debugShowCheckedModeBanner: false,
//    showPerformanceOverlay: true,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    /// 设置启动页面
    home: Apps.routes.buildPage(Apps.test.path, null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(
        builder: (BuildContext context) {
          return Apps.routes.buildPage(settings.name, settings.arguments);
        },
      );
    },
  );
}

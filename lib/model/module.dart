import 'package:flutter/cupertino.dart';

/// 功能模块
class Module {
  String id;
  String code;
  String name;
  String path;

  Module({this.id, this.code, this.name, this.path});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      path: json['page'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['page'] = this.path;
    return data;
  }

  /// 跳转页面
  Future<dynamic> push(
      BuildContext context, {
        Object arguments,
      }) {
    return Navigator.of(context).pushNamed(path, arguments: arguments);
  }
}

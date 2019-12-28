import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_web_fish_redux_updat_error/fish_redux_test/page.dart';

import 'module.dart';

///
/// 页面路由注册 & 功能模块列表
/// 所有页面都需要在这里注册
///
/// @author David
/// @date 2019-08-16
///
class Apps {
  static final test = Module(id: '', code: '', name: '测试', path: 'test');

  /// 所有页面路由注册
  static final _pages = <String, Page<Object, dynamic>>{
    test.path: TestPage(),
  };
  static final AbstractRoutes routes = PageRoutes(
    /// 页面注册
    pages: Apps._pages,

    ///
    visitor: (String path, Page<Object, dynamic> page) {
      /// AOP
      /// 页面可以有一些私有的AOP的增强， 但往往会有一些AOP是整个应用下，所有页面都会有的。
      /// 这些公共的通用AOP，通过遍历路由页面的形式统一加入。
      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],

        /// Effect AOP
        effectMiddleware: [
          _pageAnalyticsMiddleware<dynamic>(),
        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );
    },
  );

  /// 简单的Effect AOP
  /// 只针对页面的生命周期进行打印
  static EffectMiddleware<T> _pageAnalyticsMiddleware<T>(
      {String tag = 'redux'}) {
    return (AbstractLogic<dynamic> logic, Store<T> store) {
      return (Effect<dynamic> effect) {
        return (Action action, Context<dynamic> ctx) {
          if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
            debugPrint('AOP: ${logic.runtimeType} ${action.type.toString()} ');
          }
          return effect?.call(action, ctx);
        };
      };
    };
  }
}

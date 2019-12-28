import 'package:fish_redux/fish_redux.dart';
import './total_component/component.dart';

import 'detail_adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

/// fish reduex
class TestPage
    extends Page<InventoryDetailState, Map<String, dynamic>> {
  TestPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<InventoryDetailState>(
              adapter:
                  NoneConn<InventoryDetailState>() + DetailAdapterAdapter(),
              slots: <String, Dependent<InventoryDetailState>>{
                'total': TotalConnector() + TotalComponent(),
              }),
          middleware: <Middleware<InventoryDetailState>>[],
        );
}

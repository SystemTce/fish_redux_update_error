import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TotalState> buildReducer() {
  return asReducer(
    <Object, Reducer<TotalState>>{
      TotalAction.refreshQty: refreshQty,
    },
  );
}

TotalState refreshQty(TotalState state, Action action) {
  final TotalState newState = state.clone();
  return newState
    ..checkQty = action.payload['checkQty']
    ..diffQty = action.payload['diffQty'];
}

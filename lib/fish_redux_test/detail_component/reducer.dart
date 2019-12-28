import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<DetailItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<DetailItemState>>{
      DetailItemAction.action: action,
    },
  );
}

DetailItemState action(DetailItemState state, Action action) {
  return state.clone();
}

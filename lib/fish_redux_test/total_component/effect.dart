import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TotalState> buildEffect() {
  return combineEffects(<Object, Effect<TotalState>>{
    TotalAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TotalState> ctx) {
}

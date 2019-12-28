import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TotalAction { action, refreshQty }

class TotalActionCreator {
  static Action onAction() {
    return const Action(TotalAction.action);
  }

  static Action refreshQty({
    String checkQty,
    String diffQty,
  }) {
    return Action(TotalAction.refreshQty, payload: {
      'checkQty': checkQty,
      'diffQty': diffQty,
    });
  }
}

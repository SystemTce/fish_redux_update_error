import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DetailItemAction {
  action,
  onTap,
  onChanged,
  onAdd,
}

class DetailItemActionCreator {
  /// 选中明细
  static Action onTap() {
    return const Action(DetailItemAction.onTap);
  }
  /// 手动输入变化
  static Action onChanged(String qty) {
    return Action(DetailItemAction.onChanged, payload: qty);
  }

  /// +1、-1点击事件
  static Action onAdd(int qty) {
    return Action(DetailItemAction.onAdd, payload: qty);
  }
}

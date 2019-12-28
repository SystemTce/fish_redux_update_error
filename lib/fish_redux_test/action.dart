import 'package:fish_redux/fish_redux.dart';

import 'detail_component/state.dart';

//TODO replace with your own action
enum InventoryDetailAction {
  showDetails,
  refreshQty,
  onTextChanger,
  nextFocus
}

class InventoryDetailActionCreator {
  /// 查询明细成功，刷新盘点明细列表
  static Action showDetails(List<DetailItemState> list) {
    return Action(InventoryDetailAction.showDetails, payload: list);
  }

  /// 刷新 盘点数、差异数
  static Action refreshQty() {
    return const Action(InventoryDetailAction.refreshQty);
  }

  static Action onTextChanger(String text) {
    return Action(InventoryDetailAction.onTextChanger, payload: text);
  }
  /// 光标移动到下一个输入框
  static Action nextFocus(DetailItemState state) {
    return Action(InventoryDetailAction.nextFocus, payload: state);
  }
}

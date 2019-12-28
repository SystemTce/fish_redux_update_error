import 'package:fish_redux/fish_redux.dart';

import 'detail_component/state.dart';

//TODO replace with your own action
enum InventoryDetailAction {
  searchGoods,
  toBarcodeScan,
  toSearchGoodsPage,
  showGoods,
  onFilter,
  updateFilter,
  showDetails,
  refreshQty,
  clearView,
  onAutoFlag,
  updateAutoFlag,
  onBatchCheck,
  onInventoryModelClearView,
  updateBatchCheck,
  onAddMakeNo,
  onSave,
  jump,
  onBack,
  onClear,
  onTextChanger,
  clear,
  onFocusChange,
  showClear,
  nextFocus,
}

class InventoryDetailActionCreator {
  /// 商品搜索
  static Action searchGoods(String key) {
    return Action(InventoryDetailAction.searchGoods, payload: key);
  }

  /// 跳转商品搜索界面
  static Action toSearchGoodsPage() {
    return const Action(InventoryDetailAction.toSearchGoodsPage);
  }

  /// 跳转扫码
  static Action toBarcodeScan() {
    return const Action(InventoryDetailAction.toBarcodeScan);
  }

  /// 批号过滤点击事件
  static Action onFilter(bool isFilter, {bool isNotShowKeyboard = false}) {
    return Action(InventoryDetailAction.onFilter, payload: {
      'isFilter': isFilter,
      'isNotShowKeyboard': isNotShowKeyboard,
    });
  }

  /// 更新是否批号过滤标志
  static Action updateFilter(bool isFilter) {
    return Action(InventoryDetailAction.updateFilter, payload: isFilter);
  }

  /// 查询明细成功，刷新盘点明细列表
  static Action showDetails(List<DetailItemState> list) {
    return Action(InventoryDetailAction.showDetails, payload: list);
  }

  /// 刷新 盘点数、差异数
  static Action refreshQty() {
    return const Action(InventoryDetailAction.refreshQty);
  }

  static Action clearView() {
    return const Action(InventoryDetailAction.clearView);
  }

  /// 切换按批号或不按批号盘点时清除数据
  static Action onInventoryModelClearView() {
    return const Action(InventoryDetailAction.onInventoryModelClearView);
  }

  /// 显示 保存查询下一个商品参数设置 弹窗
  static Action onAutoFlag() {
    return const Action(InventoryDetailAction.onAutoFlag);
  }

  /// 更新 保存查询下一个商品参数设置
  static Action updateAutoFlag(String flag) {
    return Action(InventoryDetailAction.updateAutoFlag, payload: flag);
  }

  /// 切换 是否按批号盘点
  static Action onShowMakeNo() {
    return const Action(InventoryDetailAction.onBatchCheck);
  }

  /// 更新 是否按批号盘点设置
  static Action updateShowMakeNo() {
    return const Action(InventoryDetailAction.updateBatchCheck);
  }

  /// 新增批号
  static Action onAddMakeNo() {
    return const Action(InventoryDetailAction.onAddMakeNo);
  }

  /// 保存
  static Action onSave() {
    return const Action(InventoryDetailAction.onSave);
  }

  /// 跳转页面
  static Action jump(int flag) {
    return Action(InventoryDetailAction.jump, payload: flag);
  }

  /// 返回事件
  /// isSaveBack : 保存后返回
  static Action onBack() {
    return const Action(InventoryDetailAction.onBack);
  }

  /// 批号过滤-清空
  static Action onClear() {
    return const Action(InventoryDetailAction.onClear);
  }

  static Action onTextChanger(String text) {
    return Action(InventoryDetailAction.onTextChanger, payload: text);
  }

  /// 清空
  static Action clear() {
    return const Action(InventoryDetailAction.clear);
  }

  /// 批号过滤选中
  static Action onFocusChange(bool focus) {
    return Action(InventoryDetailAction.onFocusChange, payload: focus);
  }

  /// 是否显示批号删除按钮
  static Action showClear(bool isShow) {
    return Action(InventoryDetailAction.showClear, payload: isShow);
  }

  /// 光标移动到下一个输入框
  static Action nextFocus(DetailItemState state) {
    return Action(InventoryDetailAction.nextFocus, payload: state);
  }
}

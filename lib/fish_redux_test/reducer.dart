import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'detail_component/state.dart';
import 'state.dart';

Reducer<InventoryDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<InventoryDetailState>>{
      InventoryDetailAction.clearView: clearView,
      InventoryDetailAction.showDetails: showDetails,
    },
  );
}

InventoryDetailState clearView(InventoryDetailState state, Action action) {
  final InventoryDetailState newState = state.clone();
  newState
    ..list = <DetailItemState>[]
    ..totalState.checkQty = '0'
    ..totalState.diffQty = '0'
    // 清空批号过滤
    ;
  return newState;
}

InventoryDetailState showDetails(InventoryDetailState state, Action action) {
  // 更新list
  state.list = action.payload;
  /// 是否显示商品库存
  bool isShowGoodsStock = true;

  state.list.forEach((item) {
    item.isShowGoodsStock = isShowGoodsStock;
    /// 替换null值
    item.accountQty = item.accountQty ?? 0;
    item.addQty = item.addQty ?? 0;
    item.checkQty = item.checkQty ?? 0;
    item.checkQty1 = item.checkQty1 ?? 0;
    item.checkQty2 = item.checkQty2 ?? 0;
    item.purPrice = item.purPrice ?? 0;
    item.stockQty = item.stockQty ?? 0;
    item.stockQty1 = item.stockQty1 ?? 0;
    item.stockQty2 = item.stockQty2 ?? 0;
    //盘点标志：1初盘，2复盘，0未盘
    item.recheckFlag = item.recheckFlag ?? 1;
    //行号
    item.rowNo = item.rowNo ?? 0;

    if (item.controller == null) {
      item.controller = TextEditingController();
    }

    if (item.focusNode == null) {
      item.focusNode = FocusNode();
    }
  });
  // 刷新 盘点数、差异数
  return refreshQty(state, action);
}

InventoryDetailState refreshQty(InventoryDetailState state, Action action) {
  final InventoryDetailState newState = state.clone();

  num checkTotalQty = 0;
  num addTotalQty = 0;
  num stockTotalQty = 0;

  newState.list.forEach((item) {
    checkTotalQty +=
        num.tryParse(item.checkQty?.toString() ?? '0') ?? 0;
    addTotalQty +=
        num.tryParse(item.addQty?.toString() ?? '0') ?? 0;
    stockTotalQty +=
        num.tryParse(item.stockQty?.toString() ?? '0') ?? 0;
  });
  num checkQty = checkTotalQty + addTotalQty;

  newState.checkQty = checkQty.toString();
  newState.diffQty = (checkQty - stockTotalQty).toString();
  return newState;
}

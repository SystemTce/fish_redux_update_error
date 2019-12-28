import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import './total_component/action.dart';
import 'action.dart';
import 'detail_component/state.dart';
import 'state.dart';

Effect<InventoryDetailState> buildEffect() {
  return combineEffects(<Object, Effect<InventoryDetailState>>{
    Lifecycle.initState: init,
    Lifecycle.dispose: dispose,
    InventoryDetailAction.nextFocus: nextFocus,
    InventoryDetailAction.refreshQty: refreshQty,
  });
}

void refreshQty(Action action, Context<InventoryDetailState> ctx) {
  num checkTotalQty = 0;
  num addTotalQty = 0;
  num stockTotalQty = 0;
  ctx.state.list.forEach((item) {
    checkTotalQty +=
        num.tryParse(item.checkQty?.toString() ?? '0') ?? 0;
    addTotalQty +=
        num.tryParse(item.addQty?.toString() ?? '0') ?? 0;
    stockTotalQty +=
        num.tryParse(item.stockQty?.toString() ?? '0') ?? 0;
  });
  num checkQty = checkTotalQty + addTotalQty;
  var checkQtyStr = checkQty.toString();
  var diffQtyStr = (checkQty - stockTotalQty).toString();
  ctx.dispatch(TotalActionCreator.refreshQty(
    checkQty: checkQtyStr,
    diffQty: diffQtyStr,
  ));
}

void init(Action action, Context<InventoryDetailState> ctx) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    /// 刷新盘点列表
    ctx.dispatch(InventoryDetailActionCreator.showDetails(List.generate(
        10,
            (index) => DetailItemState(
          makeNo: '$index',
          batchNo: '$index',
          checkQty: index.ceilToDouble() + 2,
          stockQty: index.ceilToDouble() + 1,
          stationCode: '$index',
          addQty: index.ceilToDouble(),
          validDate: '201901010$index',
          itemId: '商品ID',
          purPrice: 9.9,
        ))));
  });
}

void dispose(Action action, Context<InventoryDetailState> ctx) {
  ctx.state.scrollController.dispose();
}

void nextFocus(Action action, Context<InventoryDetailState> ctx) {
  int index = ctx.state.list.indexOf(action.payload);
  if (index != -1) {
    if (index + 1 == ctx.state.list.length) {
      FocusScope.of(ctx.context).unfocus();
    } else {
      ctx.state.list[(index + 1)]?.focusNode?.requestFocus();
    }
  }
}

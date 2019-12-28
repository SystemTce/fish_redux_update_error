import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import '../action.dart';
import 'action.dart';
import 'state.dart';

Effect<DetailItemState> buildEffect() {
  return combineEffects(<Object, Effect<DetailItemState>>{
    DetailItemAction.onChanged: onChanged,
    DetailItemAction.onAdd: onAdd,
  });
}

void onChanged(Action action, Context<DetailItemState> ctx) {
  ctx.state.addQty = double.tryParse(action.payload) ?? 0;
  // 刷新 总盘点数量、差异数量
  ctx.dispatch(InventoryDetailActionCreator.refreshQty());
}

void onAdd(Action action, Context<DetailItemState> ctx) {
  // 更新明细数量
  num qty = (num.tryParse(ctx.state.controller.text) ?? 0) + action.payload;
  // 更新字段数量
  ctx.state.addQty = qty;
  // 更新显示的数量
  ctx.state.controller.value = TextEditingValue(
    text: qty.toString(),
    selection: TextSelection.collapsed(offset: qty.toString().length),
  );

  // 刷新 总盘点数量、差异数量
  ctx.dispatch(InventoryDetailActionCreator.refreshQty());
}

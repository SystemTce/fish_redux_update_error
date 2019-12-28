import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import './total_component/state.dart';
import 'detail_component/state.dart';

class InventoryDetailState extends MutableSource
    implements Cloneable<InventoryDetailState> {
  TotalState totalState;
  String checkQty; // 实盘点数
  String diffQty; // 差异数
  //当前盘点明细列表到列表数据
  List<DetailItemState> list;
  ScrollController scrollController;
  InventoryDetailState({
    this.list,
    this.checkQty,
    this.diffQty,
  });

  @override
  InventoryDetailState clone() {
    return InventoryDetailState()
      ..totalState = totalState
      ..list = list
      ..checkQty = checkQty
      ..diffQty = diffQty
      ..scrollController = scrollController;
  }

  @override
  Object getItemData(int index) =>list[index] ;

  @override
  String getItemType(int index) => 'detail';

  /// 添加底部填充空白item
  /// 为了实现在输入数量时，保存按钮不顶起固定在底部，在最后追加一个空的item,增加底部的间距
  @override
  int get itemCount => list.length;

  @override
  void setItemData(int index, Object data) =>list[index] = data;
}

InventoryDetailState initState(Map<String, dynamic> map) {
  map = map ?? {};

  return InventoryDetailState()
    ..totalState = TotalState()
    ..scrollController = ScrollController() ;
}

class TotalConnector extends ConnOp<InventoryDetailState, TotalState> {
  @override
  TotalState get(InventoryDetailState state) {
    return state.totalState;
  }

  @override
  void set(InventoryDetailState state, TotalState subState) {
    state.totalState = subState;
  }
}

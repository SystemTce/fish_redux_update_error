import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../action.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    DetailItemState state, Dispatch dispatch, ViewService viewService) {
  // 库存数量
  String stockQty;
  // 已盘颜色
  Color textColor;
  if (state.isShowGoodsStock) {
    //是否显示已盘数
    textColor = state.checkQty != state.stockQty ? Colors.red : null;
    // 显示库存
    stockQty = state.stockQty.toString();
  } else {
    //不显示库存
    if (state.stockQty == null || state.stockQty == 0) {
      stockQty = '无';
    } else if (state.stockQty < 0) {
      /// <0
      stockQty = '负';
    } else {
      /// > 0
      stockQty = '有';
    }
  }

  // 输入控件
  Widget inputWidget = Row(
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.remove),
        onPressed: () {
          dispatch(DetailItemActionCreator.onAdd(-1));
        },
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        tooltip: '数量减1',
      ),
      Expanded(
        child: Container(
          height: 30,
          child: TextField(
            maxLines: 1,
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              WhitelistingTextInputFormatter(
                  RegExp(r'^[-]?((\d+\.\d+)|(\d+\.)|(\d+))?')),
            ],
            textAlign: TextAlign.center,
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
            controller: state.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(4),
            ),
            onChanged: (text) {
              dispatch(DetailItemActionCreator.onChanged(text));
            },
            focusNode: state.focusNode,
            textInputAction: TextInputAction.next,
            onEditingComplete: () {
              dispatch(InventoryDetailActionCreator.nextFocus(state));
            },
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          dispatch(DetailItemActionCreator.onAdd(1));
        },
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        tooltip: '数量加1',
      ),
    ],
  );

  // 内容控件
  Widget buildContent() {
    /// 按批号盘点
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('货位:${state.stationCode ?? ''}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Text('批号:${state.makeNo ?? ''}')),
            Expanded(child: Text('效期:${state.validDate ?? ''}')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Text('库存:$stockQty')),
            Expanded(child: Text('进价:***')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Text(
                '已盘:${state.checkQty.toString()}',
                style: TextStyle(color: textColor),
              ),
            ),
            Expanded(
              flex: 11,
              child: inputWidget,
            ),
          ],
        ),
      ],
    );
  }

  return Container(
    margin: EdgeInsets.all(4),
    child: Material(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      elevation: 1,
      child: InkWell(
        onTap: () {
          if (!state.focusNode.hasFocus) {
            state.focusNode.requestFocus();
          }
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
          child: buildContent(),
        ),
      ),
    ),
  );
}

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';

Widget buildView(TotalState state, Dispatch dispatch, ViewService viewService) {
  Color diffColor(String diff) {
    return (diff == null || diff.isEmpty || diff == '0') ? null : Colors.red;
  }

  return Container(
    margin: const EdgeInsets.fromLTRB(6, 0, 6, 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            '实盘:${state.checkQty ?? ''}',
            style: const TextStyle(color: Colors.blue),
          ),
        ),
        VerticalDivider(
          width: 1,
        ),
        Expanded(
          child: Text(
            //是否显示库存
            '差异:${state.diffQty ?? ''}',
            style: TextStyle(
              color: diffColor(state.diffQty),
            ),
          ),
        ),
      ],
    ),
  );
}

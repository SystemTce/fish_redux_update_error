import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    InventoryDetailState state, Dispatch dispatch, ViewService viewService) {
  var adapter = viewService.buildAdapter();
  var size = MediaQuery.of(viewService.context).size;
  return  Scaffold(
    appBar: AppBar(),
    body:  Container(
      height: size.height,
      child: Column(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                viewService.buildComponent('total'),
              ],
            ),
          ),
          Container(
            margin:EdgeInsets.zero,
            height: 35,
            color: Colors.blue,
            child:    FlatButton(onPressed: (){
              dispatch(InventoryDetailActionCreator.onSave());
            }, child: Text(
              '保存',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),),
          ),
          Expanded(child:  ListView.builder(
            controller: state.scrollController,
            itemBuilder: adapter.itemBuilder,
            itemCount: adapter.itemCount,
          ),),
        ],
      ),
    ),

  );
}

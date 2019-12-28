import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

/// 盘点明细
class DetailItemState implements Cloneable<DetailItemState> {
  double accountQty;
  double addQty;
  String batchNo;
  String batchNoFlag;
  String checkNo;
  double checkQty;
  double checkQty1;
  double checkQty2;
  String counter;
  String itemId;
  String makeDate;
  String makeNo;
  String producer;
  double purPrice;
  int recheckFlag;
  int rowNo;
  String stationCode;
  String stationId;
  String stockFlag;
  double stockQty;
  double stockQty1;
  double stockQty2;
  String stockStatus;
  String validDate;

  String orgId;
  String actorId;
  String actTime;

  bool isShowGoodsStock = false;

  TextEditingController controller;
  FocusNode focusNode;

  String get uniqueId =>
      (makeNo ?? '') + '-' + (batchNo ?? '') + '-' + (stationCode ?? '');

  DetailItemState({
    this.accountQty,
    this.addQty,
    this.batchNo,
    this.batchNoFlag,
    this.checkNo,
    this.checkQty,
    this.checkQty1,
    this.checkQty2,
    this.counter,
    this.itemId,
    this.makeDate,
    this.makeNo,
    this.producer,
    this.purPrice,
    this.recheckFlag,
    this.rowNo,
    this.stationCode,
    this.stationId,
    this.stockFlag,
    this.stockQty,
    this.stockQty1,
    this.stockQty2,
    this.stockStatus,
    this.validDate,
    this.orgId,
    this.actorId,
    this.actTime,
  });

  factory DetailItemState.fromJson(Map<String, dynamic> json) {
    return DetailItemState(
      accountQty: double.tryParse(json['accountQty'].toString()),
      addQty: double.tryParse(json['addQty'].toString()),
      batchNo: json['batchNo'],
      batchNoFlag: json['batchNoFlag'],
      checkNo: json['checkNo'],
      checkQty: double.tryParse(json['checkQty'].toString()),
      checkQty1: double.tryParse(json['checkQty1'].toString()),
      checkQty2: double.tryParse(json['checkQty2'].toString()),
      counter: json['counter'],
      itemId: json['itemId'],
      makeDate: json['makeDate'],
      makeNo: json['makeNo'],
      producer: json['producer'],
      purPrice: double.tryParse(json['purPrice'].toString()),
      recheckFlag: json['recheckFlag'],
      rowNo: json['rowNo'],
      stationCode: json['stationCode'],
      stationId: json['stationId'],
      stockFlag: json['stockFlag'],
      stockQty: double.tryParse(json['stockQty'].toString()),
      stockQty1: double.tryParse(json['stockQty1'].toString()),
      stockQty2: double.tryParse(json['stockQty2'].toString()),
      stockStatus: json['stockStatus'],
      validDate: json['validDate'],
      orgId: json['orgId'],
      actorId: json['actorId'],
      actTime: json['actTime'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountQty'] = this.accountQty;
    data['addQty'] = this.addQty;
    data['batchNo'] = this.batchNo;
    data['batchNoFlag'] = this.batchNoFlag;
    data['checkNo'] = this.checkNo;
    data['checkQty'] = this.checkQty;
    data['checkQty1'] = this.checkQty1;
    data['checkQty2'] = this.checkQty2;
    data['counter'] = this.counter;
    data['itemId'] = this.itemId;
    data['makeDate'] = this.makeDate;
    data['makeNo'] = this.makeNo;
    data['producer'] = this.producer;
    data['purPrice'] = this.purPrice;
    data['recheckFlag'] = this.recheckFlag;
    data['rowNo'] = this.rowNo;
    data['stationCode'] = this.stationCode;
    data['stationId'] = this.stationId;
    data['stockFlag'] = this.stockFlag;
    data['stockQty'] = this.stockQty;
    data['stockQty1'] = this.stockQty1;
    data['stockQty2'] = this.stockQty2;
    data['stockStatus'] = this.stockStatus;
    data['validDate'] = this.validDate;
    data['orgId'] = this.orgId;
    data['actorId'] = this.actorId;
    data['actTime'] = this.actTime;
    return data;
  }

  @override
  DetailItemState clone() {
    return DetailItemState()
      ..accountQty = accountQty
      ..addQty = addQty
      ..batchNo = batchNo
      ..batchNoFlag = batchNoFlag
      ..checkNo = checkNo
      ..checkQty = checkQty
      ..checkQty1 = checkQty1
      ..checkQty2 = checkQty2
      ..counter = counter
      ..itemId = itemId
      ..makeDate = makeDate
      ..makeNo = makeNo
      ..producer = producer
      ..purPrice = purPrice
      ..recheckFlag = recheckFlag
      ..rowNo = rowNo
      ..stationCode = stationCode
      ..stationId = stationId
      ..stockFlag = stockFlag
      ..stockQty = stockQty
      ..stockQty1 = stockQty1
      ..stockQty2 = stockQty2
      ..stockStatus = stockStatus
      ..validDate = validDate
      ..orgId = orgId
      ..actorId = actorId
      ..actTime = actTime
      ..isShowGoodsStock = isShowGoodsStock
      ..controller = controller
      ..focusNode = focusNode;
  }
}

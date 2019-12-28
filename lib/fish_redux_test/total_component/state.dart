import 'package:fish_redux/fish_redux.dart';

class TotalState implements Cloneable<TotalState> {
  String checkQty;
  String diffQty;
  TotalState({this.checkQty, this.diffQty});

  @override
  TotalState clone() {
    return TotalState()
      ..checkQty = checkQty
      ..diffQty = diffQty;
  }
}

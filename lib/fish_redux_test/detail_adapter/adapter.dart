import 'package:fish_redux/fish_redux.dart';
import '../detail_component/component.dart';

import '../state.dart';

class DetailAdapterAdapter extends SourceFlowAdapter<InventoryDetailState> {
  DetailAdapterAdapter()
      : super(
          pool: <String, Component<Object>>{
            'detail': DetailItemComponent(),
          },
        );
}
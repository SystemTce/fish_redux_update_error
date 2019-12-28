import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DetailItemComponent extends Component<DetailItemState> {
  DetailItemComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DetailItemState>(
                adapter: null,
                slots: <String, Dependent<DetailItemState>>{
                }),);

}

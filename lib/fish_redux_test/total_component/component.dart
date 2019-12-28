import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TotalComponent extends Component<TotalState> {
  TotalComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TotalState>(
                adapter: null,
                slots: <String, Dependent<TotalState>>{
                }),);

}

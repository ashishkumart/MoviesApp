import 'package:bloc/bloc.dart';
import 'package:movies_app/src/common/app_tabs.dart';
import 'package:movies_app/src/dashboard/bloc/dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, AppTab> {
 /* DashboardBloc({@required AuthenticationBloc authenticationBloc})
      : assert(authenticationBloc != null);*/

  @override
  AppTab get initialState => AppTab.discover;

  @override
  Stream<AppTab> mapEventToState(DashboardEvent event) async* {
    if (event is UpdateTab) yield event.tab;
  }
}

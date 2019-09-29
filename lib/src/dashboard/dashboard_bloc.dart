import 'package:flutter/cupertino.dart';
import 'package:movies_app/src/authentication/authentication.dart';
import 'package:movies_app/src/common/app_tabs.dart';
import 'package:movies_app/src/dashboard/dashboard_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:movies_app/src/login/login_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, AppTab> {
 /* DashboardBloc({@required AuthenticationBloc authenticationBloc})
      : assert(authenticationBloc != null);*/

  @override
  AppTab get initialState => AppTab.popular;

  @override
  Stream<AppTab> mapEventToState(DashboardEvent event) async* {
    if (event is UpdateTab) yield event.tab;
  }
}

import 'package:equatable/equatable.dart';
import 'package:movies_app/src/common/app_tabs.dart';

abstract class DashboardEvent extends Equatable {
  DashboardEvent([List props = const []]) : super(props);
}

class UpdateTab extends DashboardEvent {
  final AppTab tab;

  UpdateTab(this.tab) : super([tab]);
}

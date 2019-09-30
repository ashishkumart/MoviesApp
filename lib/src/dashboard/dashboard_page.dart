import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/src/authentication/authentication.dart';
import 'package:movies_app/src/common/app_tabs.dart';
import 'package:movies_app/src/dashboard/dashboard.dart';
import 'package:movies_app/src/dashboard/tab_selector.dart';
import 'package:movies_app/src/popular/popular_movies_page.dart';
import 'package:movies_app/src/top_rated/top_rated_movies_page.dart';
import 'package:movies_app/src/upcoming/upcoming_movies_page.dart';

class DashboardPage extends StatelessWidget {
  var authenticationBloc;

  DashboardPage({this.authenticationBloc}) : assert(authenticationBloc != null);

  String title = '';
  var tabTitles = ["Upcoming Movies", "Popular Movies", "Top Rated Movies"];

  @override
  Widget build(BuildContext context) {
    DashboardBloc _bloc = new DashboardBloc();
    return BlocBuilder<DashboardBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text(tabTitles[activeTab.index]),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _showConfirmDialog(context, authenticationBloc);
                },
              )
            ],
          ),
          body: _openPage(activeTab),
          bottomNavigationBar: TabSelector(
              activeTab: activeTab,
              onTabSelected: (tab) {
                _bloc.dispatch(UpdateTab(tab));
              }),
        );
      },
      bloc: _bloc,
    );
  }

  _openPage(AppTab tab) {
    //title = tabTitles[tab.index];
    switch (tab) {
      case AppTab.popular:
        return PopularMoviesPage();

      case AppTab.top_rated:
        return TopRatedMoviesPage();

      case AppTab.upcoming:
        return UpcomingMoviesPage();
    }
  }

  _showConfirmDialog(BuildContext context, AuthenticationBloc bloc) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Movie App'),
            content: Text('Are you sure want to end this session?'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    bloc.dispatch(LoggedOut());

                  },
                  child: Text('Yes')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No')),
            ],
          );
        });
  }
}

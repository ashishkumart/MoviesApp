import 'package:flutter/material.dart';
import 'package:movies_app/app_keys/app_keys.dart';
import 'package:movies_app/src/common/app_tabs.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: AppKeys.tabs,
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.trending_up), title: Text('Upcoming')),
        BottomNavigationBarItem(
            icon: Icon(Icons.event), title: Text('Popular')),
        BottomNavigationBarItem(
            icon: Icon(Icons.rate_review), title: Text('Top Rated')),
      ],
    );
  }
}

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
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.movie), title: Text('Movies')),
        BottomNavigationBarItem(icon: Icon(Icons.tv), title: Text('TV Shows')),
        BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('People')),
      ],
    );
  }
}

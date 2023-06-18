import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/2_application/pages/dashboard/dashboard_page.dart';
import 'package:todo_app/2_application/pages/overview/overview_page.dart';
import 'package:todo_app/2_application/pages/settings/settings_page.dart';
import 'package:todo_app/2_application/pages/task/task_page.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required String tab,
  }) : index = tabs.indexWhere(
          (element) => element.name == tab,
        );

  static const tabs = [
    DashboardPage.pageConfig,
    OverviewPage.pageConfig,
    TaskPage.pageConfig,
  ];

  final int index;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs
      .map(
        (page) => NavigationDestination(
          icon: Icon(page.icon),
          label: page.name,
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('primary-navigation-medium'),
                builder: (context) => AdaptiveScaffold.standardNavigationRail(
                  destinations: destinations
                      .map(
                        (destination) => AdaptiveScaffold.toRailDestination(
                          destination,
                        ),
                      )
                      .toList(),
                  onDestinationSelected: (index) =>
                      _tapOnNavigationDesination(context, index),
                  selectedIndex: widget.index,
                  selectedLabelTextStyle: TextStyle(
                    color: theme.colorScheme.onBackground,
                  ),
                  selectedIconTheme: IconThemeData(
                    color: theme.colorScheme.onBackground,
                  ),
                  unselectedIconTheme: IconThemeData(
                    color: theme.colorScheme.onBackground.withOpacity(0.5),
                  ),
                ),
              ),
            },
          ),
          bottomNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('bottom-navigation-small'),
                builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                  destinations: destinations,
                  currentIndex: widget.index,
                  onDestinationSelected: (value) =>
                      _tapOnNavigationDesination(context, value),
                ),
              ),
            },
          ),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('primary-body-small'),
                builder: (_) => HomePage.tabs[widget.index].child,
              ),
            },
          ),
          secondaryBody: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('secondary-body-medium'),
                builder: AdaptiveScaffold.emptyBuilder,
              ),
            },
          ),
        ),
      ),
    );
  }

  void _tapOnNavigationDesination(BuildContext context, int index) =>
      context.go('/home/${HomePage.tabs[index].name}');
}

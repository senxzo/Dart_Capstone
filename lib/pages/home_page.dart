import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:stressed_out/pages/analyze/analyze_list.dart';
import 'package:stressed_out/pages/components/common_components.dart';
import 'package:stressed_out/pages/event/event_list.dart';
import 'package:stressed_out/pages/post/create_post.dart';
import 'package:stressed_out/pages/post/post_list.dart';
import 'package:stressed_out/utils/app_colors.dart';
import 'package:stressed_out/utils/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var activeNavIndex = 0;

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  final tabIcons = [
    Icons.account_circle_outlined,
    Icons.analytics,
    Icons.post_add
  ];

  final titles = [
    AppConstants.events,
    AppConstants.analyze,
    AppConstants.posts
  ];

  final pages = [
    const EventList(),
    const AnalyzeList(),
    const PostList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonComponents.tabbedAppBar(context, titles[activeNavIndex]),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: pages,
        items: _navBarsItems(),
        onItemSelected: (index) => {activeNavIndex = index},
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 56.0),
        child: FloatingActionButton(
          backgroundColor: AppColors.primarySwatch.shade900,
          isExtended: true,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePost(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    List<PersistentBottomNavBarItem> items = [];
    int i = 0;
    for (String t in titles) {
      items.add(PersistentBottomNavBarItem(
        icon: Icon(tabIcons[i++]),
        title: t,
        activeColorPrimary: AppColors.primarySwatch.shade900,
        inactiveColorPrimary: AppColors.primarySwatch.shade300,
      ));
    }

    return items;
  }
}

import 'package:flutter/material.dart';
import 'package:may/tabPages/earning_tab_page.dart';
import 'package:may/tabPages/home_tab_page.dart';
import 'package:may/tabPages/rating_tab_page.dart';

import '../tabPages/profile_tab_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeTabPage(),
          EarningTabPage(),
          RatingTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Earning",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Rating",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Profile",
        ),
      ]),
    );
  }
}

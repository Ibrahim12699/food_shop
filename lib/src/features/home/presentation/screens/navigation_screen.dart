import 'package:food_shop/src/core/resources/constants.dart';
import 'package:food_shop/src/core/resources/route_manager.dart';
import 'package:food_shop/src/features/home/presentation/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBody() {
    return RouteGenerator.navScreens[selectedTab];
  }

  Widget _buildBottomNavBar() {
    return CustomBottomNavBar(
      items: navItems,
      selectedIndex: selectedTab,
      onTap: _onBottomNavTap,
    );
  }

  void _onBottomNavTap(int index) {
    setState(() {
      selectedTab = index;
    });
  }
}

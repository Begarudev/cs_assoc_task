import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({
    super.key,
  });

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shadows: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 9,
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
      ),
      child: TabBar(
          onTap: _updateIndex,
          indicatorPadding: const EdgeInsets.only(bottom: 8),
          indicatorColor: const Color.fromRGBO(20, 30, 115, 1),
          tabs: [
            _buildTab("assets/icons/home.svg",
                "assets/icons/home_icon_filled.svg", 0),
            _buildTab("assets/icons/maps.svg",
                "assets/icons/map_view_filled_icon.svg", 1),
            _buildTab("assets/icons/tickets.svg",
                "assets/icons/tickets_view_filled_icon.svg", 2),
            Tab(
              icon: SvgPicture.asset(
                "assets/icons/notification_icon.svg",
                color: _selectedIndex == 3
                    ? const Color.fromRGBO(20, 30, 115, 1)
                    : null,
              ),
            ),
          ]),
    );
  }

  Widget _buildTab(String selectedIconPath, String iconPath, int index) {
    return Tab(
      icon: SvgPicture.asset(
        _selectedIndex == index ? iconPath : selectedIconPath,
      ),
    );
  }
}

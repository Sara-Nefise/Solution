import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:solution_app/core/constants/AppColor.dart';
import 'package:solution_app/feature/LogIn/view/login_view.dart';
import 'package:solution_app/products/widgets/googlemap.dart';
import 'package:solution_app/products/widgets/saveuser.dart';

import '../../feature/FarmarProfile/view/farmarpage_view.dart';
import '../../feature/HomePage/view/homepage_view.dart';
import '../../feature/Messages/view/messages_view.dart';
import '../../feature/UserProfile/view/userprofile_view.dart';

class ButtonNavigation extends StatefulWidget {
  int value;
  ButtonNavigation({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  final iconList = [Icons.home, Icons.message, Icons.map, Icons.person];

  final List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    MessagePage(),
    const GoogleMappage(),
    Userprofile(user: user_1),
  ];
  var _bottomNavIndex = 0;
  final List<Widget> _widgetOptionsFarmar = <Widget>[
    Homepage(),
    MessagePage(),
    const GoogleMappage(),
    Farmarprofile(user: user_1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        backgroundColor: AppColors().greyli,
        activeColor: AppColors().brown,
        inactiveColor: AppColors().green,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors().grey,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: value == 2
          ? _widgetOptions.elementAt(_bottomNavIndex)
          : _widgetOptionsFarmar.elementAt(_bottomNavIndex),
    );
  }
}

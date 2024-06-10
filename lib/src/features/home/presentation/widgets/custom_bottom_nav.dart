import 'package:food_shop/src/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
    required this.items,
  });

  final List<NavModel> items;
  final void Function(int index)? onTap;
  final int selectedIndex;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xffFEFEFE),
      type: BottomNavigationBarType.fixed,
      fixedColor: ColorManager.black,
      items: List.generate(
          widget.items.length,
          (index) => _buildItem(
                widget.items[index],
                index,
              )),
      selectedFontSize: 10.spMin,
      unselectedFontSize: 10.spMin,
      unselectedItemColor: ColorManager.black,
      currentIndex: widget.selectedIndex,
      onTap: widget.onTap!,
    );
  }

  BottomNavigationBarItem _buildItem(NavModel item, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          _buildIndicator(index),
          6.verticalSpace,
          _buildIcon(item),
          4.verticalSpace,
        ],
      ),
      label: item.title,
    );
  }

  Widget _buildIndicator(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      height: 3.h,
      decoration: BoxDecoration(
        color: widget.selectedIndex == index
            ? ColorManager.primaryColor
            : Colors.transparent,
      ),
    );
  }

 Widget _buildIcon(NavModel item) {
    return SvgPicture.asset(
      item.image,
    );
  }
}

class NavModel {
  final String title;
  final String image;
  final int index;

  NavModel({
    required this.title,
    required this.image,
    required this.index,
  });
}

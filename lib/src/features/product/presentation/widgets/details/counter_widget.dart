import 'package:food_shop/src/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.onMinusPressed,
    required this.onPlusPressed,
    required this.counter,
  });

  final Function() onMinusPressed;
  final Function() onPlusPressed;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildMinusButton(),
          _buildCounter(),
          _buildPlusButton(),
        ],
      ),
    );
  }

  Widget _buildMinusButton() {
    return IconButton(
      onPressed: onMinusPressed,
      icon: SvgPicture.asset(
        AssetsManager.minusIc,
      ),
    );
  }

  Widget _buildCounter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Text(
        '$counter',
        style: TextStyle(
          fontSize: 16.spMin,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPlusButton() {
    return IconButton(
      onPressed: onPlusPressed,
      icon: SvgPicture.asset(
        AssetsManager.plusIc,
      ),
    );
  }
}

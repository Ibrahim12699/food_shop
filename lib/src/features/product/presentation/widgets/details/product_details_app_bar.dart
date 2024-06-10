import 'package:food_shop/src/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildAppBar(context);
  }

  Widget _buildAppBar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildArrowBack(context),
        _buildCartButton(context),
      ],
    );
  }

  Widget _buildArrowBack(context) {
    return IconButton(
      icon: SvgPicture.asset(
        AssetsManager.arrowLeft,
        width: 24.w,
        height: 24.h,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildCartButton(context) {
    return IconButton(
      icon: SvgPicture.asset(
        AssetsManager.cartIc,
        width: 24.w,
        height: 24.h,
      ),
      onPressed: () {},
    );
  }
}

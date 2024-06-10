import 'package:food_shop/src/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductsAppBar({
    super.key,
    this.onBackPress,
  });

  final Function()? onBackPress;

  @override
  Widget build(BuildContext context) {
    return _buildAppBar(context);
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  Widget _buildAppBar(context) {
    return AppBar(
      forceMaterialTransparency: true,
      leading: _buildArrowBack(context),
      actions: [
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
      onPressed: () => _onBackPress(context),
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

  void _onBackPress(context) {
    if (onBackPress != null) {
      onBackPress!();
    } else {
      Navigator.of(context).pop();
    }
  }
}

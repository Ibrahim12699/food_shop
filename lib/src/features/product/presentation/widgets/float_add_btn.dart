import 'package:food_shop/src/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatAddBtn extends StatelessWidget {
  const FloatAddBtn({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return _buildAddButton();
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 55.r,
        width: 55.r,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            AssetsManager.plusIc,
          ),
        ),
      ),
    );
  }
}

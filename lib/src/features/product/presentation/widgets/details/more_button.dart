import 'package:food_shop/src/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBtn();
  }

  Widget _buildBtn() {
    return Expanded(
      child: GestureDetector(
        child: Column(
          children: [
            _buildCircle(),
            6.verticalSpace,
            _buildLabel(),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle() {
    return Container(
      height: 42.r,
      width: 42.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 0.5.r,
        ),
      ),
      child: _buildIcon(),
    );
  }

  Widget _buildIcon() {
    return Center(
      child: SvgPicture.asset(
        AssetsManager.arrowRight,
        colorFilter: const ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _buildLabel() {
    return Text(
      'More',
      style: TextStyle(
        color: Colors.black,
        fontSize: 12.spMin,
      ),
    );
  }
}

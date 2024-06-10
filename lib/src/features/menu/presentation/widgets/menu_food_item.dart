import 'package:food_shop/src/core/resources/assets_manager.dart';
import 'package:food_shop/src/core/resources/style_manager.dart';
import 'package:food_shop/src/features/menu/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuFoodItem extends StatelessWidget {
  const MenuFoodItem({
    super.key,
    required this.model,
    required this.onTap,
  });

  final ProductModel model;
  final Function(ProductModel) onTap;

  @override
  Widget build(BuildContext context) {
    return _buildItem(context);
  }

  Widget _buildItem(context) {
    return GestureDetector(
      onTap: () => onTap(model),
      child: Stack(
        children: [
          _buildContainer(),
          _buildImage(),
          _buildDetails(),
          _buildArrow(),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      margin: EdgeInsetsDirectional.only(
        top: 50.h,
        start: 18.w,
        end: 18.w,
      ),
      constraints: BoxConstraints(
        maxHeight: 120.h,
        minHeight: 80.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 9,
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Positioned(
      left: 0.01.sw,
      bottom: 4,
      top: 0,
      right: 0.6.sw,
      child: Image.asset(
        model.image ?? AssetsManager.defaultImage,
        // width: 100.w,
      ),
    );
  }

  Widget _buildDetails() {
    return Positioned(
      top: 40.h,
      bottom: 0,
      left: 0.38.sw,
      right: 16.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          3.verticalSpace,
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(model.name ?? '',
        style: getBoldStyle(
          fontSize: 20.spMin,
          color: Colors.black,
        ));
  }

  Widget _buildDescription() {
    return Text(model.description ?? '',
        style: getRegularStyle(
          fontSize: 14.spMin,
          color: Colors.grey,
        ));
  }

  Widget _buildArrow() {
    return Positioned(
      right: 30.w,
      bottom: 14.h,
      child: SvgPicture.asset(
        AssetsManager.arrowRightCircle,
      ),
    );
  }
}

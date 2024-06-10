import 'package:food_shop/src/core/resources/style_manager.dart';
import 'package:food_shop/src/features/menu/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTitleWidget extends StatelessWidget {
  const ProductTitleWidget({
    super.key,
    this.model,
    this.opacity,
  });

  final ProductModel? model;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    return _buildItem();
  }

  Widget _buildItem() {
    return Opacity(
      opacity: opacity ?? 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemTitle(),
          _buildItemDescription(),
        ],
      ),
    );
  }

  Widget _buildItemTitle() {
    return Text(
      model?.name ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: getBoldStyle(
        fontSize: 30.spMin,
        color: Colors.black,
      ),
    );
  }

  Widget _buildItemDescription() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 4.w),
      child: Text(
        model?.description ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: getRegularStyle(
          fontSize: 16.spMin,
          color: Colors.black,
        ),
      ),
    );
  }
}

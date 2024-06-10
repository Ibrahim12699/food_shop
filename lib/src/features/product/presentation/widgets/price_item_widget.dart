import 'package:food_shop/src/core/resources/style_manager.dart';
import 'package:food_shop/src/features/menu/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceItemWidget extends StatelessWidget {
  const PriceItemWidget({
    super.key,
    this.model,
  });

  final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    return _buildPriceItem();
  }

  Widget _buildPriceItem() {
    String price = model?.price == null ? '0' : model!.price.toString();
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '£${price.split('.').first}.',
            style: getMediumStyle(
              fontSize: 32.spMin,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: price.split('.').last,
            style: getMediumStyle(
              fontSize: 14.spMin,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

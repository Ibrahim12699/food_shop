import 'package:food_shop/src/core/resources/assets_manager.dart';
import 'package:food_shop/src/core/resources/color_manager.dart';
import 'package:food_shop/src/core/resources/enums.dart';
import 'package:food_shop/src/core/resources/string_manager.dart';
import 'package:food_shop/src/features/menu/data/model/product_model.dart';
import 'package:food_shop/src/features/product/presentation/widgets/details/more_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductSizeButton extends StatelessWidget {
  const ProductSizeButton({
    super.key,
    required this.productSizeNotifier,
    required this.onProductSizeChanged,
    required this.product,
  });

  final Function(ProductSize) onProductSizeChanged;
  final ValueNotifier<ProductSize> productSizeNotifier;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return _buildSizeButtons();
  }

  Widget _buildSizeButtons() {
    return Row(
      children: [
        _buildSizeButton(
          label: StringManager.small,
          size: ProductSize.S,
          onTap: onProductSizeChanged,
        ),
        _buildSizeButton(
          label: StringManager.medium,
          size: ProductSize.M,
          onTap: onProductSizeChanged,
        ),
        _buildSizeButton(
          label: StringManager.large,
          size: ProductSize.L,
          onTap: onProductSizeChanged,
        ),
        const MoreButton(),
      ],
    );
  }

  Widget _buildSizeButton({
    required String label,
    required ProductSize size,
    required Function(ProductSize) onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(size),
        child: Column(
          children: [
            ValueListenableBuilder<ProductSize>(
              valueListenable: productSizeNotifier,
              builder: (context, value, child) {
                return _buildCircle(size);
              },
            ),
            6.verticalSpace,
            _buildLabel(label),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(ProductSize size) {
    return Container(
      height: 42.r,
      width: 42.r,
      padding: _getPadding(size, 42.r),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _isSizeSelected(size)
            ? ColorManager.primaryColor
            : Colors.transparent,
        border: _isSizeSelected(size)
            ? null
            : Border.all(
                color: Colors.black,
                width: 0.5.r,
              ),
      ),
      child: _buildIcon(size),
    );
  }

  Widget _buildIcon(ProductSize size) {
    return SvgPicture.asset(
      _isDrink ? AssetsManager.cupIcon : AssetsManager.phHamburgerThin,
      colorFilter: ColorFilter.mode(
        _isSizeSelected(size) ? Colors.white : Colors.black,
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.black,
        fontSize: 12.spMin,
      ),
    );
  }

  EdgeInsets _getPadding(ProductSize productSize, double circleSize) {
    double padding = 12;
    if (_isDrink) {
      switch (productSize) {
        case ProductSize.S:
          padding = circleSize * 0.32;
        case ProductSize.M:
          padding = circleSize * 0.28;
        case ProductSize.L:
          padding = circleSize * 0.24;
        case ProductSize.none:
          padding = circleSize * 0.28;
      }
    }
    return EdgeInsets.all(padding);
  }

  bool _isSizeSelected(ProductSize size) {
    return productSizeNotifier.value == size;
  }

  bool get _isDrink => product.type == ProductType.drink;
}

import 'package:food_shop/src/core/resources/enums.dart';
import 'package:food_shop/src/core/resources/route_manager.dart';
import 'package:food_shop/src/features/menu/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwiper {
  static const Map<AnimationType, List<AnimationOffset>> animations = {
    AnimationType.none: [
      AnimationOffset(0.6, 1.0, -1.0, -0.1),
      AnimationOffset(0.25, -1, 0.02, 1.1),
      AnimationOffset(0.25, -1.3, 0.35, 1.3),
      AnimationOffset(0.22, -1.5, 0.5, 1.5),
      AnimationOffset(0.25, 0.2, 0.6, 0.8),
    ],
    AnimationType.drink: [
      AnimationOffset(0.9, 0.8, -0.2, -0.3),
      AnimationOffset(0.25, 0.2, 0, 0),
      AnimationOffset(0.2, 0.1, 0.4, 0.4),
      AnimationOffset(0.15, 0, 0.55, 0.54),
      AnimationOffset(0.2, 0.25, 0.6, 0.8),
    ],
    AnimationType.food: [
      AnimationOffset(0.9, 0.8, 0.0, -0.3),
      AnimationOffset(0.25, 0.1, -0.1, 0),
      AnimationOffset(0.25, 0.1, 0.3, 0.45),
      AnimationOffset(0.2, 0.1, 0.5, 0.65),
      AnimationOffset(0.25, 0.2, 0.55, 0.8),
    ],
  };
}

enum AnimationType {
  none,
  drink,
  food,
}

enum MoveType {
  none,
  up,
  down,
}

class AnimationOffset {
  final double top;
  final double right;
  final double bottom;
  final double left;
  final double? scale;
  final double? opacity;

  const AnimationOffset(
    this.top,
    this.right,
    this.bottom,
    this.left, [
    this.scale,
    this.opacity,
  ]);
}

class ItemLabel extends StatelessWidget {
  const ItemLabel({
    super.key,
    required this.index,
    required this.items,
  });

  final int index;

  final List<ProductModel> items;

  @override
  Widget build(BuildContext context) {
    return _buildLabel();
  }

  Widget _buildLabel() {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5.h,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.black,
              ),
              child: FittedBox(
                child: Text(
                  "$index : ${items[index].name}",
                  style: const TextStyle(
                    color: Colors.white,
                    // fontSize: 12.spMin,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClickableArea extends StatelessWidget {
  const ClickableArea({
    super.key,
    required this.position,
    this.animation,
    required this.product,
  });

  final int position;
  final AnimationOffset? animation;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return _buildItem(context);
  }

  Widget _buildItem(context) {
    return position != 1
        ? const SizedBox()
        : Positioned.fromRelativeRect(
            rect: product.type == ProductType.food
                ? RelativeRect.fromLTRB(
                    0.15.sw,
                    (animation?.top ?? 0) * 0.85.sh,
                    (animation?.right ?? 0) * 0.8.sw,
                    0.2.sh,
                  )
                : RelativeRect.fromLTRB(
                    0.15.sw,
                    (animation?.top ?? 0) * 0.4.sh,
                    (animation?.right ?? 0) * 0.8.sw,
                    0.1.sh,
                  ),
            child: GestureDetector(
              onTap: () => _onItemTap(position, context, product),
              child: Container(
                color: Colors.transparent,
                // color: Colors.blue.withOpacity(position * 0.1),
              ),
            ));
  }

  void _onItemTap(int position, context, ProductModel product) {
    if (position == 1) {
      Navigator.of(context).pushNamed(Routes.productDetailsScreen, arguments: {
        'product': product,
      });
    }
  }
}

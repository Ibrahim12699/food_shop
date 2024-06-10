import 'package:food_shop/src/features/menu/data/model/product_model.dart';
import 'package:food_shop/src/features/product/presentation/widgets/custom_swiper.dart';
import 'package:food_shop/src/features/product/presentation/widgets/price_item_widget.dart';
import 'package:food_shop/src/features/product/presentation/widgets/product_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SwiperHeaderWidget extends StatefulWidget {
  const SwiperHeaderWidget({
    super.key,
    required this.modelNotifier,
  });

  final ValueNotifier<ProductWithDirection> modelNotifier;

  @override
  State<SwiperHeaderWidget> createState() => _SwiperHeaderWidgetState();
}

class _SwiperHeaderWidgetState extends State<SwiperHeaderWidget> {
  Duration defaultDuration = const Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildHeader();
  }

  Widget _buildHeader() {
    return ValueListenableBuilder<ProductWithDirection>(
        valueListenable: widget.modelNotifier,
        builder:
            (BuildContext context, ProductWithDirection model, Widget? child) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitlePageView(model),
                16.horizontalSpace,
                _buildPricePageView(model),
              ],
            ),
          );
        });
  }

  Widget _buildTitlePageView(ProductWithDirection model) {
    return Expanded(
      child: AnimationLimiter(
        key: ValueKey(model.product?.id),
        child: AnimationConfiguration.staggeredList(
            position: 0,
            duration: const Duration(milliseconds: 300),
            child: SlideAnimation(
              horizontalOffset: isUpSwipe == true ? 150 : -150,
              curve: Curves.fastOutSlowIn,
              child: ProductTitleWidget(
                model: model.product,
                opacity: 1,
              ),
            )),
      ),
    );
  }

  Widget _buildPricePageView(ProductWithDirection model) {
    double opacity = 1;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 20.h,
        left: 20.w,
        right: 10.w,
      ),
      child: AnimationLimiter(
        key: ValueKey(model.product?.id),
        child: AnimationConfiguration.staggeredList(
          position: 0,
          duration: defaultDuration,
          child: SlideAnimation(
              verticalOffset: isUpSwipe ? 50 : -50,
              child: Opacity(
                opacity: opacity,
                child: PriceItemWidget(
                  model: model.product,
                ),
              )),
        ),
      ),
    );
  }

  bool get isUpSwipe =>
      widget.modelNotifier.value.swipeDirection == MoveType.up;
}

class ProductWithDirection {
  final ProductModel? product;
  final MoveType? swipeDirection;

  ProductWithDirection({
    this.product,
    this.swipeDirection,
  });
}



import 'package:food_shop/src/core/resources/enums.dart';
import 'package:food_shop/src/features/menu/data/model/product_model.dart';
import 'package:food_shop/src/features/product/presentation/widgets/custom_swiper.dart';
import 'package:food_shop/src/features/product/presentation/widgets/details/counter_widget.dart';
import 'package:food_shop/src/features/product/presentation/widgets/details/customize_button.dart';
import 'package:food_shop/src/features/product/presentation/widgets/details/product_details_app_bar.dart';
import 'package:food_shop/src/features/product/presentation/widgets/details/product_size_button.dart';
import 'package:food_shop/src/features/product/presentation/widgets/details/temperature_widget.dart';
import 'package:food_shop/src/features/product/presentation/widgets/float_add_btn.dart';
import 'package:food_shop/src/features/product/presentation/widgets/price_item_widget.dart';
import 'package:food_shop/src/features/product/presentation/widgets/product_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double _scale = 0.75;
  ValueNotifier<ProductSize> productSizeNotifier =
      ValueNotifier<ProductSize>(ProductSize.none);
  ValueNotifier<int> counter = ValueNotifier<int>(0);
  late ValueNotifier<AnimationOffset> addOffsetNotifier =
      ValueNotifier<AnimationOffset>(
          AnimationOffset(context.topPadding + 100, 30, 140, 30, _scale, 0));
  late ValueNotifier<AnimationOffset> minusOffsetNotifier =
      ValueNotifier<AnimationOffset>(AnimationOffset(
          context.topPadding, 10, 1.sh * 0.8, 1.sw * 0.8, _scale, 0.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildItemImage(),
        _buildAddTransitionItemImage(),
        _buildMinusTransitionItemImage(),
        _buildAppBar(),
        _buildHeader(),
        _buildCartCounter(),
        _buildButtons(),
        _buildBottomSection(),
      ],
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: context.topPadding,
      left: 0,
      right: 0,
      child: const ProductDetailsAppBar(),
    );
  }

  Widget _buildCartCounter() {
    return Positioned(
      top: context.topPadding + 16.r,
      right: 18.r,
      child: ValueListenableBuilder<int>(
          valueListenable: counter,
          builder: (context, value, child) {
            return Visibility(
              visible: value > 0,
              child: Text(
                '$value',
              ),
            );
          }),
    );
  }

  Widget _buildHeader() {
    return Positioned(
      top: context.topPadding + 50.h,
      left: 16.w,
      right: 16.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ProductTitleWidget(
              model: widget.product,
            ),
          ),
          16.horizontalSpace,
          PriceItemWidget(
            model: widget.product,
          ),
        ],
      ),
    );
  }

  Widget _buildItemImage() {
    return Positioned(
      top: (context.topPadding + 100).h,
      left: 30.w,
      right: 30.w,
      bottom: 140.h,
      child: ValueListenableBuilder<ProductSize>(
          valueListenable: productSizeNotifier,
          builder: (context, value, child) {
            return AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: _scale,
              child: Hero(
                transitionOnUserGestures: true,
                tag: widget.product.id ?? '',
                child: Image.asset(
                  widget.product.image ?? '',
                ),
              ),
            );
          }),
    );
  }

  Widget _buildAddTransitionItemImage() {
    return ValueListenableBuilder<AnimationOffset>(
        valueListenable: addOffsetNotifier,
        builder: (context, value, child) {
          return AnimatedPositioned(
            top: value.top.h,
            left: value.left.w,
            right: value.right.w,
            bottom: value.bottom.h,
            onEnd: _onAddTransitionEnd,
            duration: const Duration(milliseconds: 300),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: value.scale ?? 1,
              child: Opacity(
                opacity: value.opacity ?? 1,
                child: Image.asset(
                  widget.product.image ?? '',
                ),
              ),
            ),
          );
        });
  }

  Widget _buildMinusTransitionItemImage() {
    return ValueListenableBuilder<AnimationOffset>(
        valueListenable: minusOffsetNotifier,
        builder: (context, value, child) {
          return AnimatedPositioned(
            top: value.top.h,
            left: value.left.w,
            right: value.right.w,
            bottom: value.bottom.h,
            onEnd: _onMinusTransitionEnd,
            duration: const Duration(milliseconds: 300),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: value.scale ?? 1,
              child: Opacity(
                opacity: value.opacity ?? 1,
                child: Image.asset(
                  widget.product.image ?? '',
                ),
              ),
            ),
          );
        });
  }

  Widget _buildButtons() {
    return Positioned(
      bottom: 100.h,
      left: 0,
      right: 0,
      child: ProductSizeButton(
        productSizeNotifier: productSizeNotifier,
        onProductSizeChanged: _onSizeButtonPressed,
        product: widget.product,
      ),
    );
  }

  Widget _buildBottomSection() {
    return Positioned(
      left: 16.w,
      right: 16.w,
      bottom: 32.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _isDrink ? const TemperatureWidget() : const CustomizeButton(),
          _buildCounterSection(),
        ],
      ),
    );
  }

  Widget _buildCounterSection() {
    return ValueListenableBuilder<int>(
        valueListenable: counter,
        builder: (context, value, child) {
          return SizedBox(
            child: value < 1
                ? FloatAddBtn(onPressed: _onAddButtonPressed)
                : CounterWidget(
                    counter: value,
                    onMinusPressed: _onMinusPressed,
                    onPlusPressed: _onPlusPressed,
                  ),
          );
        });
  }

  void _onSizeButtonPressed(ProductSize size) {
    switch (size) {
      case ProductSize.S:
        _scale = 0.5;
        break;
      case ProductSize.M:
        _scale = 0.75;
        break;
      case ProductSize.L:
        _scale = 1;
        break;
      case ProductSize.none:
        _scale = 0.75;
    }

    addOffsetNotifier.value =
        AnimationOffset(context.topPadding + 100, 30, 140, 30, _scale, 0);
    productSizeNotifier.value = size;
  }

  void _onAddButtonPressed() {
    counter.value++;
    addOffsetNotifier.value =
        AnimationOffset(context.topPadding, 10, 1.sh * 0.8, 1.sw * 0.8, 1, 0.5);
  }

  void _onPlusPressed() {
    counter.value++;
    addOffsetNotifier.value =
        AnimationOffset(context.topPadding, 10, 1.sh * 0.8, 1.sw * 0.8, 1, 0.5);
  }

  bool get _isDrink => widget.product.type == ProductType.drink;

  void _onAddTransitionEnd() {
    addOffsetNotifier.value =
        AnimationOffset(context.topPadding + 100, 30, 140, 30, _scale, 0);
  }

  void _onMinusPressed() {
    if (counter.value > 0) {
      counter.value--;
      minusOffsetNotifier.value = AnimationOffset(
        context.topPadding + 100,
        30,
        140,
        30,
        _scale,
        0.5,
      );
    }
  }

  void _onMinusTransitionEnd() {
    minusOffsetNotifier.value = AnimationOffset(
        context.topPadding, 10, 1.sh * 0.8, 1.sw * 0.8, _scale, 0.0);
  }
}

extension BuildContextExtension on BuildContext {
  double get topPadding => MediaQuery.of(this).padding.top;
}

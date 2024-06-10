import 'package:food_shop/src/core/resources/assets_manager.dart';
import 'package:food_shop/src/core/resources/enums.dart';
import 'package:food_shop/src/features/menu/data/model/product_model.dart';
import 'package:food_shop/src/features/product/presentation/widgets/custom_swiper.dart';
import 'package:food_shop/src/features/product/presentation/widgets/swiper_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget({
    super.key,
    required this.onIndexChanged,
    required this.items,
  });

  final List<ProductModel> items;
  final ValueChanged<ProductWithDirection> onIndexChanged;

  @override
  SwiperWidgetState createState() => SwiperWidgetState();
}

class SwiperWidgetState extends State<SwiperWidget> {
  Duration defaultDuration = const Duration(milliseconds: 500);
  final ValueNotifier<MoveType> swipeNotifier =
      ValueNotifier<MoveType>(MoveType.none);
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);
  int _lastIndex = 0;
  List<ProductModel> items = [];
  bool _firstTime = true;

  @override
  void initState() {
    items = widget.items;
    super.initState();
    _startInitialAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return _buildCustomSwiper();
  }

  Widget _buildCustomSwiper() {
    return GestureDetector(
      onVerticalDragEnd: _onPanEnd,
      onVerticalDragStart: _onPanStart,
      onVerticalDragUpdate: _onPanUpdate,
      child: ValueListenableBuilder<MoveType>(
        valueListenable: swipeNotifier,
        builder: (context, direction, child) {
          return Container(
            color: Colors.transparent,
            child: ValueListenableBuilder<int>(
              valueListenable: currentIndexNotifier,
              builder: (context, value, child) {
                return Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: _buildAnimations(),
                );
              },
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildAnimations() {
    List<Widget> animations = [];

    int length = items.length;
    for (int position = 0; position < length; position++) {
      int index = (currentIndexNotifier.value + position) % length;

      animations.insert(
        0,
        _buildAnimation(
          position: position,
          index: index,
        ),
      );
    }

    return animations;
  }

  Widget _buildAnimation({
    required int position,
    required int index,
  }) {
    final AnimationOffset animation = _getAnimation(position);

    return AnimatedPositioned(
      key: ValueKey(index),
      duration: defaultDuration,
      top: animation.top.sh,
      right: animation.right.sw,
      bottom: animation.bottom.sh,
      left: animation.left.sw,
      child: _buildItem(index: index, animation: animation, position: position),
    );
  }

  Widget _buildItem({
    required int index,
    required int position,
    AnimationOffset? animation,
  }) {
    return Stack(
      key: ValueKey(index),
      fit: StackFit.expand,
      children: [
        Hero(
          transitionOnUserGestures: true,
          tag: items[index].id ?? '$position',
          child: Image.asset(
            items[index].image ?? AssetsManager.defaultImage,
          ),
        ),
        ClickableArea(
          position: position,
          product: items[index],
          animation: animation,
        ),
      ],
    );
  }

  void _move({required int nextIndex}) {
    final length = items.length;
    int swipeIndex = (nextIndex % length + length) % length;
    int index = 0;
    if (swipeIndex < (length - 1)) {
      index = swipeIndex + 1;
    }
    currentIndexNotifier.value = swipeIndex;
    widget.onIndexChanged(ProductWithDirection(
      product: items[index],
      swipeDirection: swipeNotifier.value,
    ));

    _lastIndex = swipeIndex;
  }

  void _onPanStart(DragStartDetails details) {}

  void _onPanEnd(DragEndDetails details) {
    if (!_firstTime) {
      defaultDuration = const Duration(milliseconds: 300);
    }
    final nextIndex =
        swipeNotifier.value == MoveType.up ? _lastIndex - 1 : _lastIndex + 1;
    _move(nextIndex: nextIndex);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _updateSwipeDirection(
      details.delta.dy < 0 ? MoveType.up : MoveType.down,
    );
  }

  void _updateSwipeDirection(MoveType swipe) {
    swipeNotifier.value = swipe;
  }

  List<AnimationOffset>? animationList;

  AnimationOffset _getAnimation(int position) {
    if (_firstTime) {
      animationList = CustomSwiper.animations[AnimationType.none];
    } else {
      animationList = CustomSwiper.animations[
          items.first.type == ProductType.food
              ? AnimationType.food
              : AnimationType.drink];
    }

    if (position < (animationList?.length ?? 0)) {
      return animationList![position];
    } else {
      AnimationOffset animation;
      if (swipeNotifier.value == MoveType.down) {
        animation = const AnimationOffset(1, 1, 0, -0.2);
      } else if (swipeNotifier.value == MoveType.up) {
        if (items.first.type == ProductType.food) {
          animation = const AnimationOffset(0.9, 0.8, 0.0, -0.3);
        } else {
          animation = const AnimationOffset(0.9, 0.8, -0.2, -0.3);
        }
      } else {
        animation = const AnimationOffset(1, 1, 0, -0.2);
      }
      return animation;
    }
  }

  void _startInitialAnimation() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _firstTime = false;
        swipeNotifier.value = MoveType.none;
        widget.onIndexChanged(ProductWithDirection(
          product: items[currentIndexNotifier.value + 1],
          swipeDirection: MoveType.down,
        ));
      });
    });
  }
}

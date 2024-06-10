import 'package:food_shop/src/core/resources/assets_manager.dart';
import 'package:food_shop/src/core/resources/constants.dart';
import 'package:food_shop/src/core/resources/route_manager.dart';
import 'package:food_shop/src/core/resources/string_manager.dart';
import 'package:food_shop/src/core/resources/style_manager.dart';
import 'package:food_shop/src/features/menu/data/model/product_model.dart';
import 'package:food_shop/src/features/menu/logic/menu_cubit.dart';
import 'package:food_shop/src/features/menu/presentation/widgets/menu_food_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Duration duration = const Duration(milliseconds: 500);
  int itemCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildCubit(),
    );
  }

  Widget _buildCubit() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        state.mapOrNull(
          backFromProducts: _onBackFromProducts,
        );
      },
      builder: (context, state) {
        return _buildBody();
      },
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        50.verticalSpace,
        _buildHeader(),
        20.verticalSpace,
        _buildFoodList(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 20.w,
        end: 10.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitle(),
          _buildCartBtn(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      StringManager.menu,
      style: getBoldStyle(
        fontSize: 32.spMin,
        color: Colors.black,
      ),
    );
  }

  Widget _buildCartBtn() {
    return IconButton(
      icon: SvgPicture.asset(
        AssetsManager.cartIc,
        width: 24.r,
        height: 24.r,
      ),
      onPressed: () {},
    );
  }

  Widget _buildFoodList() {
    return Expanded(
      child: AnimationLimiter(
        key: ValueKey("$itemCount"),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(bottom: 80.h),
          itemCount: menuList.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: duration,
              child: SlideAnimation(
                verticalOffset: 300.h,
                child: FadeInAnimation(
                  child: MenuFoodItem(
                    model: menuList[index],
                    onTap: _onFoodItemTap,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onFoodItemTap(ProductModel model) {
    switch (model.id) {
      case "1":
        Navigator.of(context).pushNamed(
          Routes.productsScreen,
          arguments: {
            "items": drinksList,
          },
        );
        break;
      case "2":
        Navigator.of(context).pushNamed(
          Routes.productsScreen,
          arguments: {
            "items": foodList,
          },
        );
        break;
    }
  }

  void _onBackFromProducts(BackFromProducts value) {
    itemCount++;
  }
}

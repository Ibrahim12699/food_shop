import 'package:food_shop/src/core/resources/route_manager.dart';
import 'package:food_shop/src/features/menu/data/model/product_model.dart';
import 'package:food_shop/src/features/product/presentation/widgets/float_add_btn.dart';
import 'package:food_shop/src/features/product/presentation/widgets/products_app_bar.dart';
import 'package:food_shop/src/features/product/presentation/widgets/swipe_widget.dart';
import 'package:food_shop/src/features/product/presentation/widgets/swiper_header_widget.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.items});

  final List<ProductModel> items;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  Duration animationDuration = const Duration(milliseconds: 300);
  ValueNotifier<ProductWithDirection> productNotifier =
      ValueNotifier<ProductWithDirection>(ProductWithDirection());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ProductsAppBar(onBackPress: _onBackPress),
      body: _buildBody(),
      floatingActionButton: _buildAddFloatingActionButton(),
    );
  }

  Widget _buildBody() {
    return PopScope(
      onPopInvoked: (val) {
        if (val) {
          RouteGenerator.menuCubit.backFromProducts();
        }
      },
      child: Stack(
        children: [
          SwiperWidget(
            items: widget.items,
            onIndexChanged: _onFoodPageChanged,
          ),
          _buildHeader(),
        ],
      ),
    );
  }

  Widget _buildAddFloatingActionButton() {
    return FloatAddBtn(
      onPressed: _onAddButtonPressed,
    );
  }

  Widget _buildHeader() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: SwiperHeaderWidget(
        modelNotifier: productNotifier,
      ),
    );
  }

  void _onFoodPageChanged(ProductWithDirection model) {
    productNotifier.value = model;
    // log("active: ${model.product?.name??''}");
  }

  void _onAddButtonPressed() {
    Navigator.of(context).pushNamed(Routes.productDetailsScreen, arguments: {
      'product': productNotifier.value.product,
    });
  }

  void _onBackPress() {
    Navigator.pop(context);
    RouteGenerator.menuCubit.backFromProducts();
  }
}

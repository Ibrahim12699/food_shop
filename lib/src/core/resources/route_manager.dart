import 'package:food_shop/src/features/auth/screens/auth_screen.dart';
import 'package:food_shop/src/features/home/presentation/screens/navigation_screen.dart';
import 'package:food_shop/src/features/menu/data/model/product_model.dart';
import 'package:food_shop/src/features/menu/logic/menu_cubit.dart';
import 'package:food_shop/src/features/menu/presentation/screens/menu_screen.dart';
import 'package:food_shop/src/features/product/presentation/screens/product_details_screen.dart';
import 'package:food_shop/src/features/product/presentation/screens/products_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class Routes {
  static const String authScreen = '/authScreen';
  static const String navigationScreen = '/navigationScreen';
  static const String productsScreen = '/productsScreen';
  static const String productDetailsScreen = '/productDetailsScreen';
}

class RouteGenerator {
  static late MenuCubit menuCubit;

  RouteGenerator() {
    menuCubit = MenuCubit();
  }

  static List<Widget> navScreens = [
    const MenuScreen(),
    const MenuScreen(),
    const MenuScreen(),
    const MenuScreen(),
    const MenuScreen(),
  ];

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) => const AuthScreen());

      case Routes.navigationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: menuCubit, child: const NavigationScreen()),
        );

      case Routes.productsScreen:
        Map args = settings.arguments as Map;
        List<ProductModel> items = args['items'];
        return MaterialPageRoute(builder: (_) => ProductsScreen(items: items));

      case Routes.productDetailsScreen:
        Map args = settings.arguments as Map;
        ProductModel product = args['product'];
        return MaterialPageRoute(
            maintainState: true,
            settings: settings,
            builder: (_) => ProductDetailsScreen(
                  product: product,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

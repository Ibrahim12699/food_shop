import 'package:food_shop/src/core/resources/assets_manager.dart';
import 'package:food_shop/src/core/resources/enums.dart';
import 'package:food_shop/src/features/home/presentation/widgets/custom_bottom_nav.dart';
import 'package:food_shop/src/features/menu/data/model/product_model.dart';

class AppConstants {
  static var appName = 'Food Shop';
}

List<NavModel> navItems = [
  NavModel(title: "Home", image: AssetsManager.homeIc, index: 0),
  NavModel(title: "Orders", image: AssetsManager.ordersIc, index: 1),
  NavModel(title: "Saved", image: AssetsManager.savedIc, index: 2),
  NavModel(title: "Update", image: AssetsManager.updateIc, index: 3),
  NavModel(title: "Menu", image: AssetsManager.menuIc, index: 4),
];

List<ProductModel> menuList = [
  ProductModel(
    id: "1",
    name: 'Milk Shake',
    price: 5.99,
    image: AssetsManager.drink2,
    description: '20 Cups of different flavours',
  ),
  ProductModel(
    id: "2",
    name: 'Chicken Burger',
    price: 5.99,
    image: AssetsManager.chickenBurger,
    description: '20 sets of different flavours',
  ),
  ProductModel(
    id: "3",
    name: 'Chocolate Drinks',
    price: 5.99,
    image: AssetsManager.chocolateDrinks,
    description: '20 Cups of different flavours',
  ),
  ProductModel(
    id: "4",
    name: 'Coffee Drinks',
    price: 5.99,
    image: AssetsManager.coffeeDrinks,
    description: '20 Cups of different flavours',
  ),
  ProductModel(
    id: "5",
    name: 'Milk Shake',
    price: 5.99,
    image: AssetsManager.fruite,
    description: '20 Cups of different flavours',
  ),
];

List<ProductModel> drinksList = [
  ProductModel(
    id: "5",
    index: 4,
    name: 'Malty Hazelnut Mocha',
    price: 6.55,
    image: AssetsManager.drink5,
    description:
        'Espresso with Chocolate Malt powder, ground hazelnuts, ice and milk',
    type: ProductType.drink,
  ),
  ProductModel(
    id: "2",
    index: 1,
    name: 'Caramel Coffee',
    price: 7.85,
    image: AssetsManager.drink6,
    description:
        'Coffee is bold and flavorful with a caramel taste that is sweet and creamy.',
    type: ProductType.drink,
  ),
  ProductModel(
    id: "6",
    index: 5,
    name: 'Chocolate Chip',
    price: 9.99,
    image: AssetsManager.drink2,
    description: 'Creamy taste of mocha-flavoured sauce blended with milk.',
    type: ProductType.drink,
  ),
  ProductModel(
    id: "1",
    index: 0,
    name: 'Cookies & Cream',
    price: 6.99,
    image: AssetsManager.drink1,
    description: 'Mocha sauce and Frappuccino® chips are blended with milk',
    type: ProductType.drink,
  ),
  ProductModel(
    id: "4",
    index: 3,
    name: 'Caramel Cream Frappuccino',
    price: 3.75,
    image: AssetsManager.drink4,
    description: 'Buttery caramel syrup is blended with milk and ice',
    type: ProductType.drink,
  ),
  ProductModel(
    id: "3",
    index: 2,
    name: 'Strawberry Cream',
    price: 5.99,
    image: AssetsManager.drink3,
    description: 'strawberries and cream',
    type: ProductType.drink,
  ),
  ProductModel(
    id: "7",
    index: 6,
    name: 'Matcha Green Tea',
    description: 'Matcha tea with milk and ice',
    price: 11.99,
    image: AssetsManager.drink7,
    type: ProductType.drink,
  ),
];
List<ProductModel> foodList = [
  ProductModel(
    id: "7",
    name: 'Chicken Cheese',
    description: 'Chicken, cheese and mayonnaise',
    price: 11.99,
    image: AssetsManager.food7,
    type: ProductType.food,
  ),
  ProductModel(
    id: "1",
    name: 'Classic Angus',
    price: 6.99,
    image: AssetsManager.food1,
    description: 'Beef, cheese, tomato, onions, pickles with mustard',
    type: ProductType.food,
  ),
  ProductModel(
    id: "3",
    name: 'Triple Cheese',
    price: 5.99,
    image: AssetsManager.food3,
    description: 'Beef, onions, pickle, ketchup, mustard',
    type: ProductType.food,
  ),
  ProductModel(
    id: "4",
    name: 'Double Feisty',
    price: 3.75,
    image: AssetsManager.food4,
    description: 'Chicken patties, marinated ',
    type: ProductType.food,
  ),
  ProductModel(
    id: "2",
    name: 'Brekkie Burger',
    price: 7.85,
    image: AssetsManager.food2,
    description: 'melting cheese, bacon, egg, beef patty, BBQ sauce',
    type: ProductType.food,
  ),
  ProductModel(
    id: "5",
    name: 'Chicken',
    price: 6.55,
    image: AssetsManager.food5,
    description: 'chicken breast, grown lettuce',
    type: ProductType.food,
  ),
  ProductModel(
    id: "6",
    name: 'Crispy Deluxe',
    price: 9.99,
    image: AssetsManager.food6,
    description: 'chicken breast, Cheese, lettuce, tomato',
    type: ProductType.food,
  ),

];

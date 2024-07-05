import 'package:e_commerce/models/items.dart';

class CartItem {
  Items item;
  List<Size> selectedSizes;
  int quantity;

  CartItem({
    required this.item,
    this.quantity = 1,
    required this.selectedSizes,
  });

  double get totalPrice {
    double sizePrices = selectedSizes.fold(0, (sum, size) => sum + size.price);
    return (item.price + sizePrices) * 1;
  }
}

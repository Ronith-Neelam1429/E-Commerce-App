import 'package:collection/collection.dart';
import 'package:e_commerce/models/cart_Item.dart';

import 'items.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Items> _menu = [
    // Shirts
    Items(
      name: "Red Monster Truck T-shirt",
      description:
          'A red monster struck t-shirt made out of cotton and synthetic material',
      imagePath: 'lib/images/shirts/monShirt.jpg',
      price: 4.99,
      category: ItemCategory.shirts,
      size: [
        Size(name: "Small", price: 4.99),
        Size(name: "Medium", price: 5.99),
        Size(name: "Large", price: 6.99),
      ],
    ),
    Items(
      name: "Blue Button Formal Shirt",
      description:
          'A blue button shirt for formal events. Made with 100% real cotton and plastic.',
      imagePath: 'lib/images/shirts/buttonUp.jpg',
      price: 14.99,
      category: ItemCategory.shirts,
      size: [
        Size(name: "Small", price: 14.99),
        Size(name: "Medium", price: 20.99),
        Size(name: "Large", price: 26.99),
      ],
    ),
    Items(
      name: "Flower Dress",
      description: 'A womens flower dress made with 100% real cotton.',
      imagePath: 'lib/images/shirts/dress.jpg',
      price: 15.99,
      category: ItemCategory.shirts,
      size: [
        Size(name: "Small", price: 15.99),
        Size(name: "Medium", price: 21.99),
        Size(name: "Large", price: 26.99),
      ],
    ),
    Items(
      name: "Smiling Hoodie",
      description:
          'A brown hoodie made with 100% real wool. Includes a smiley face graphic.',
      imagePath: 'lib/images/shirts/hoodie.jpg',
      price: 35.99,
      category: ItemCategory.shirts,
      size: [
        Size(name: "Small", price: 35.99),
        Size(name: "Medium", price: 37.99),
        Size(name: "Large", price: 40.99),
      ],
    ),
    Items(
      name: "Beach Tank Top",
      description: 'A beach tank top for womens made from synthetic materials.',
      imagePath: 'lib/images/shirts/tankTop.jpg',
      price: 9.99,
      category: ItemCategory.shirts,
      size: [
        Size(name: "Small", price: 9.99),
        Size(name: "Medium", price: 11.99),
        Size(name: "Large", price: 13.99),
      ],
    ),
    // Pants
    Items(
      name: "Mens Cargo Shorts",
      description: 'Mens cargo shorts made with 100% real cotton.',
      imagePath: 'lib/images/pants/cargos.jpg',
      price: 15.99,
      category: ItemCategory.pants,
      size: [
        Size(name: "Small", price: 10.99),
        Size(name: "Medium", price: 15.99),
        Size(name: "Large", price: 19.99),
      ],
    ),
    Items(
      name: "Women's summer shorts",
      description: 'Women\'s summer shorts made with 100% real cotton. ',
      imagePath: 'lib/images/pants/clothshorts.jpg',
      price: 9.99,
      category: ItemCategory.pants,
      size: [
        Size(name: "Small", price: 9.99),
        Size(name: "Medium", price: 12.99),
        Size(name: "Large", price: 14.99),
      ],
    ),
    Items(
      name: "Mens Ripped jJeans",
      description: 'Stylish ripped jeans for men. Made with 100% real denim.',
      imagePath: 'lib/images/pants/jeans.jpg',
      price: 25.99,
      category: ItemCategory.pants,
      size: [
        Size(name: "Small", price: 25.99),
        Size(name: "Medium", price: 30.99),
        Size(name: "Large", price: 33.99),
      ],
    ),
    Items(
      name: "Mens Joggers",
      description: 'Comfortable mens joggers made with 100% real cotton.',
      imagePath: 'lib/images/pants/joggers.jpg',
      price: 14.99,
      category: ItemCategory.pants,
      size: [
        Size(name: "Small", price: 14.99),
        Size(name: "Medium", price: 17.99),
        Size(name: "Large", price: 20.99),
      ],
    ),
    Items(
      name: "Womens Leggings",
      description:
          'Womens leggings for sports and exercise. Made with 100% real cotton.',
      imagePath: 'lib/images/pants/leggings.jpg',
      price: 10.99,
      category: ItemCategory.pants,
      size: [
        Size(name: "Small", price: 10.99),
        Size(name: "Medium", price: 13.99),
        Size(name: "Large", price: 15.99),
      ],
    ),
    // Shoes
    Items(
      name: "Mens Hiking Boots",
      description:
          'Sturdy mens hiking boots, built to withstand rain, snow, and sand.',
      imagePath: 'lib/images/shoes/boots.jpeg',
      price: 39.99,
      category: ItemCategory.shoes,
      size: [
        Size(name: "Small", price: 39.99),
        Size(name: "Medium", price: 42.99),
        Size(name: "Large", price: 44.99),
      ],
    ),
    Items(
      name: "Nike Jordan 1 High AI\'s",
      description: 'Stylish jordans from Nike made out of synthetic leather.',
      imagePath: 'lib/images/shoes/nike.jpg',
      price: 189.99,
      category: ItemCategory.shoes,
      size: [
        Size(name: "Small", price: 189.99),
        Size(name: "Medium", price: 194.99),
        Size(name: "Large", price: 199.99),
      ],
    ),
    Items(
      name: "Womens Slippers",
      description:
          'Women\'s slippes with a planet design. Made out of synthetic leather',
      imagePath: 'lib/images/shoes/planSlippers.jpeg',
      price: 39.99,
      category: ItemCategory.shoes,
      size: [
        Size(name: "Small", price: 39.99),
        Size(name: "Medium", price: 44.99),
        Size(name: "Large", price: 49.99),
      ],
    ),
    Items(
      name: "Womens Sneakers",
      description:
          'Women\'s sneakers used to play sports and exercise. Made out of 70% rubber',
      imagePath: 'lib/images/shoes/rainSneakers.jpeg',
      price: 39.99,
      category: ItemCategory.shoes,
      size: [
        Size(name: "Small", price: 39.99),
        Size(name: "Medium", price: 45.99),
        Size(name: "Large", price: 48.99),
      ],
    ),
    Items(
      name: "Mens Vans",
      description: 'Red loafers from Vans. Made with real cloth.',
      imagePath: 'lib/images/shoes/vans.jpg',
      price: 54.99,
      category: ItemCategory.shoes,
      size: [
        Size(name: "Small", price: 54.99),
        Size(name: "Medium", price: 59.99),
        Size(name: "Large", price: 64.99),
      ],
    ),
    // Hats
    Items(
      name: "Unisex Cap",
      description: 'Unisex cap with cute dragon graphic.',
      imagePath: 'lib/images/hats/capDrag.jpeg',
      price: 15.99,
      category: ItemCategory.hats,
      size: [
        Size(name: "Small", price: 15.99),
        Size(name: "Medium", price: 18.99),
        Size(name: "Large", price: 21.99),
      ],
    ),
    Items(
      name: "Mens Cowboy Hat",
      description: 'Men\'s cowboy hat hand-made with real leather and feather',
      imagePath: 'lib/images/hats/cowboy.jpeg',
      price: 49.99,
      category: ItemCategory.hats,
      size: [
        Size(name: "Small", price: 49.99),
        Size(name: "Medium", price: 54.99),
        Size(name: "Large", price: 59.99),
      ],
    ),
    Items(
      name: "Women\'s Bucket Hat",
      description: 'Red bucket hat for womens. Made with real cloth',
      imagePath: 'lib/images/hats/redBucket.jpeg',
      price: 19.99,
      category: ItemCategory.hats,
      size: [
        Size(name: "Small", price: 19.99),
        Size(name: "Medium", price: 23.99),
        Size(name: "Large", price: 27.99),
      ],
    ),
    Items(
      name: "Women\'s Tennis Cap",
      description: 'Women\'s tennis cap. Has adjustable strap.',
      imagePath: 'lib/images/hats/tennis.jpeg',
      price: 39.99,
      category: ItemCategory.hats,
      size: [
        Size(name: "Small", price: 9.99),
        Size(name: "Medium", price: 12.99),
        Size(name: "Large", price: 14.99),
      ],
    ),
    Items(
      name: "Unisex Baseball Cap",
      description:
          'A black baseball cap with the logo of the AI phoinex baseball team.',
      imagePath: 'lib/images/hats/redCap.jpeg',
      price: 19.99,
      category: ItemCategory.hats,
      size: [
        Size(name: "Small", price: 19.99),
        Size(name: "Medium", price: 23.99),
        Size(name: "Large", price: 26.99),
      ],
    ),
    // Jewlery
    Items(
      name: "Women\'s Bracelet",
      description:
          'Womens Bracelet made from real silver. Hand-crafted from Hogwarts.',
      imagePath: 'lib/images/jewlery/bracelet.jpeg',
      price: 139.99,
      category: ItemCategory.jewlery,
      size: [
        Size(name: "Standard", price: 139.99),
        Size(name: "Deluxe", price: 179.99),
      ],
    ),
    Items(
      name: "Mens Chain",
      description: 'Mens steel chain hand-crafted from Thor himself.',
      imagePath: 'lib/images/jewlery/chain.jpeg',
      price: 210.99,
      category: ItemCategory.jewlery,
      size: [
        Size(name: "Standard", price: 210.99),
        Size(name: "Deluxe", price: 260.99),
      ],
    ),
    Items(
      name: "Womens Diamond Necklace",
      description: 'Womens diamond necklace. The diamond was mined with minors',
      imagePath: 'lib/images/jewlery/diaNecklace.jpeg',
      price: 539.99,
      category: ItemCategory.jewlery,
      size: [
        Size(name: "Standard", price: 539.99),
        Size(name: "Deluxe", price: 639.99),
      ],
    ),
    Items(
      name: "Earrings",
      description:
          'Earrings hand-made by blacksmiths. The gem is an emerald from MineCraft.',
      imagePath: 'lib/images/jewlery/earrings.jpeg',
      price: 799.99,
      category: ItemCategory.jewlery,
      size: [
        Size(name: "Standard", price: 799.99),
        Size(name: "Deluxe", price: 899.99),
      ],
    ),
    Items(
      name: "Gold Wedding Ring",
      description:
          'A gold wedding ring with 99.99% pure gold and a polished diamond.',
      imagePath: 'lib/images/jewlery/bracelet.jpeg',
      price: 999.99,
      category: ItemCategory.jewlery,
      size: [
        Size(name: "Standard", price: 999.99),
        Size(name: "Deluxe", price: 1099.99),
      ],
    ),
  ];

  // Getters
  List<Items> get menu => _menu;

/* Operations */

  // User Cart
  final List<CartItem> _cart = [];

  // Add to cart
  void addToCart(Items item, List<Size> selectedSize) {
    // Check if there is a cart item already with the same item and selected sizes
    CartItem? cartItem = _cart.firstWhereOrNull((items) {
      // Check if the cart items are the same
      bool isSameItem = items.item == item;

      // check if the list of selected sizes are the same
      bool isSameSize =
          ListEquality().equals(items.selectedSizes, selectedSize);

      return isSameItem && isSameSize;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // else, add a new item
    else {
      _cart.add(
        CartItem(
          item: item,
          selectedSizes: selectedSize,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartItem != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.item.price;
      for (Size size in cartItem.selectedSizes) {
        itemTotal += size.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // total number of items in a cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Helpers
  // Generate a receipt

  // format double value into money
}

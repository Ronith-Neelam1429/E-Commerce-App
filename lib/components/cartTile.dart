import 'package:e_commerce/components/quantitySelector.dart';
import 'package:e_commerce/models/cart_Item.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;

  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shop, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0), // Add right padding
              child: Column(
                children: [
                  SizedBox(height: 7),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            cartItem.item.imagePath,
                            height: 80, // Reduced height
                            width: 80, // Reduced width
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        // Use Expanded to let the text take the available space
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.item.name,
                              style: TextStyle(
                                fontSize: 14, // Reduced font size
                              ),
                            ),
                            Text(
                              '\$${cartItem.item.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                            Container(
                              width:
                                  double.infinity, // Use full width available
                              child: Text(
                                '${cartItem.item.description}',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0), // Adjust this padding as needed
                        child: QuantitySelector(
                          quantity: cartItem.quantity,
                          item: cartItem.item,
                          onDecrement: () {
                            shop.removeFromCart(cartItem);
                          },
                          onIncrement: () {
                            shop.addToCart(
                                cartItem.item, cartItem.selectedSizes);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Sizes

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: cartItem.selectedSizes.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: cartItem.selectedSizes
                      .map(
                        (size) => FilterChip(
                          label: Row(
                            children: [
                              // Size Picked
                              Text(size.name),
                              const SizedBox(width: 5),
                              // Size Price
                              Text(
                                '(+\$${size.price.toStringAsFixed(2)})',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              )
                            ],
                          ),
                          onSelected: (value) {},
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

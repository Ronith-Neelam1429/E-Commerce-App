import 'package:e_commerce/components/button.dart';
import 'package:e_commerce/components/cartTile.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:e_commerce/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shop, child) {
        final userCart = shop.cart;
        // Scaffold UI
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            title: Text("Cart"),
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // Clear button
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Are you sure you want to clear the cart?"),
                        actions: [
                          // Cancel Button
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          // Confirm Button
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              shop.clearCart();
                            },
                            child: Text("Confirm"),
                          )
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Divider(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      endIndent: 25,
                      indent: 25,
                    ),
                    userCart.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text(
                                "Your cart is empty",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                //get individual cart item
                                final cartItem = userCart[index];

                                // return cart title UI
                                return CartTile(cartItem: cartItem);
                              },
                            ),
                          )
                  ],
                ),
              ),
              // Checkout button
              MyButton(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentPage()),
                      ),
                  text: "Go to checkout"),
              SizedBox(
                height: 30,
              )
            ],
          ),
        );
      },
    );
  }
}

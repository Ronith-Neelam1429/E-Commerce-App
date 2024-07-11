import 'package:e_commerce/components/button.dart';
import 'package:e_commerce/models/items.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  final Items item;
  final Map<Size, bool> selectedSizes = {};

  ItemPage({
    super.key,
    required this.item,
  }) {
    // Initialize selected Sizes to be false
    for (Size sizes in item.size) {
      selectedSizes[sizes] = false;
    }
  }

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  void addToCart(Items item, Map<Size, bool> selectedSize) {
    // Close the current food page to go back to the menu
    Navigator.pop(context);
    List<Size> currentlySelectedAddons = [];
    for (Size sizes in widget.item.size) {
      if (widget.selectedSizes[sizes] == true) {
        currentlySelectedAddons.add(sizes);
      }
    }
    context.read<Shop>().addToCart(item, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Item Image
                Image.asset(widget.item.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Item Name
                      Text(
                        widget.item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      // Item Price
                      Text(
                        '\$${widget.item.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Item Description
                      Text(widget.item.description),

                      const SizedBox(height: 10),
                      Divider(color: Theme.of(context).colorScheme.secondary),
                      const SizedBox(height: 10),

                      Text(
                        "Sizes",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Sizes
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.item.size.length,
                          itemBuilder: (context, index) {
                            // get individual sizes
                            Size sizes = widget.item.size[index];
                            return CheckboxListTile(
                              title: Text(sizes.name),
                              subtitle: Text(
                                '+\$${sizes.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              value: widget.selectedSizes[sizes],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedSizes[sizes] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

                // Checkout Button
                MyButton(
                  onTap: () => addToCart(widget.item, widget.selectedSizes),
                  text: "Add to cart",
                ),
                const SizedBox(height: 35)
              ],
            ),
          ),
        ),

        // Back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ],
    );
  }
}

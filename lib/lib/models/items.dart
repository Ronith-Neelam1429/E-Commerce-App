class Items {
  // What is included on each card
  final String name; // Graphhic T-Shirt
  final String description; // A red shirt with a graphic and made of cotton
  final String imagePath; // lib/images/shirt.png
  final double price; // 4.99
  final ItemCategory category; // Shirts
  List<Size> size;

  Items({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.size,
  });
}

// Categories of apparel
enum ItemCategory {
  shirts,
  pants,
  shoes,
  jewlery,
  hats,
}

// Addons
class Size {
  String name;
  double price;

  Size({
    required this.name,
    required this.price,
  });
}

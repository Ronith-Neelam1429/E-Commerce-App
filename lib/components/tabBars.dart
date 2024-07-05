import 'package:e_commerce/models/items.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  const CustomTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return ItemCategory.values.map((category) {
      final categoryName = category.toString().split('.').last;
      return Tab(
        text: categoryName.capitalize(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}

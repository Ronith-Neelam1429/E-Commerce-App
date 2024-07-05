import 'package:e_commerce/components/itemTile.dart';
import 'package:e_commerce/components/my_drawer.dart';
import 'package:e_commerce/components/sliverApp.dart';
import 'package:e_commerce/components/tabBars.dart';
import 'package:e_commerce/models/items.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:e_commerce/pages/itemPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: ItemCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Sort out and return a list of food items that belong to a specific category
  List<Items> _filterMenuByCategory(
      ItemCategory category, List<Items> fullMenu) {
    return fullMenu.where((item) => item.category == category).toList();
  }

  List<Widget> getItemsInThiscategory(List<Items> fullMenu) {
    return ItemCategory.values.map((category) {
      List<Items> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get each item
          final item = categoryMenu[index];

          // return the tile
          return Itemtile(
            item: item,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (contezt) => ItemPage(item: item))),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverApp(
            title: CustomTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          )
        ],
        body: Consumer<Shop>(
          builder: (context, shop, child) => TabBarView(
            controller: _tabController,
            children: getItemsInThiscategory(shop.menu),
          ),
        ),
      ),
    );
  }
}

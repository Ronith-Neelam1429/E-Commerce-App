import 'package:e_commerce/components/currentLocation.dart';
import 'package:e_commerce/components/descriptionBox.dart';
import 'package:e_commerce/components/my_drawer.dart';
import 'package:e_commerce/components/sliverApp.dart';
import 'package:e_commerce/components/tabBars.dart';
import 'package:flutter/material.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // my current location
                CurrentLocation(),
                // description box
                DescriptionBox(),
              ],
            ),
          )
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("hello world"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("hello"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("world"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:klontong/providers/navigation_provider.dart';
import 'package:klontong/screens/add_product/add_product_screen.dart';
import 'package:klontong/screens/product_list/product_list_screen.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: context.read<NavigationProvider>().currentIndex,
        onTap: (index) {
          context.read<NavigationProvider>().setCurrentIndex(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Product List'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Product'),
        ],
      ),
      body: Consumer<NavigationProvider>(
        builder: (context, navigationProvider, child) {
          return navigationProvider.currentIndex == 0 ? const ProductListScreen() : const AddProductScreen();
        },
      ),
    );
  }
}

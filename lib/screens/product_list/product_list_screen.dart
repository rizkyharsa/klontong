import 'package:flutter/material.dart';
import 'package:klontong/providers/product_provider.dart';
import 'package:klontong/screens/product_detail/product_detail_screen.dart';
import 'package:klontong/screens/product_list/widgets/button_pagination.dart';
import 'package:klontong/screens/product_list/widgets/product_list.dart';
import 'package:klontong/screens/product_list/widgets/search_box.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ///Search box
            SearchBox(
              onSearch: (searchQuery) {
                Provider.of<ProductProvider>(context, listen: false).searchProducts(search: searchQuery);
              },
            ),
            const SizedBox(height: 32),

            ///List of products
            Expanded(
              child: Consumer<ProductProvider>(
                builder: (context, value, child) {
                  var product = value.products;
                  if (value.isDataLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (product.isEmpty) {
                    return const Center(child: Text('There is no data'));
                  } else {
                    return ProductList(
                      products: product,
                      onTap: (product) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              product: product,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonPagination(
                  onPressed: Provider.of<ProductProvider>(context, listen: false).currentPage > 1
                      ? () async {
                          await Provider.of<ProductProvider>(context, listen: false).previousPage();
                        }
                      : null,
                  pagination: "Previous",
                ),
                ButtonPagination(
                  onPressed: () async {
                    await Provider.of<ProductProvider>(context, listen: false).nextPage();
                  },
                  pagination: "Next",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

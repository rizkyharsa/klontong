import 'package:flutter/material.dart';
import 'package:klontong/data/product.dart';

import '../../../utility/device_utility.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products, required this.onTap});

  final List<Product> products;
  final Function(Product)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: GestureDetector(
            onTap: () {
              onTap!(products[index]);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              height: DeviceUtility.getScreenHeight(context) * .10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  /// Product Image
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: NetworkImage(products[index].image.toString()),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  /// Product Name & Description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${products[index].name}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "${products[index].description}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),

                  /// Price
                  Text(
                    "Rp. ${products[index].price}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

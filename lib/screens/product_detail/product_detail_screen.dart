import 'package:flutter/material.dart';
import 'package:klontong/data/product.dart';
import 'package:klontong/utility/device_utility.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Product Image
            Center(
              child: Container(
                height: DeviceUtility.getScreenHeight(context) * .25,
                width: DeviceUtility.getScreenWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade300,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: NetworkImage(product.image.toString()),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),

            ///Product Detail
            Text(
              "${product.name}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),

            Text(
              "${product.description}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              "Harga: Rp. ${product.price}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

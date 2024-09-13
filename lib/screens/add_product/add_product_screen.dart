import 'package:flutter/material.dart';
import 'package:klontong/screens/add_product/widgets/add_product_form.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: AddProductForm(),
        ),
      ),
    );
  }
}

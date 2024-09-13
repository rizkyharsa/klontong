import 'package:flutter/material.dart';
import 'package:klontong/data/product.dart';
import 'package:klontong/providers/product_provider.dart';
import 'package:klontong/widgets/random_strings.dart';
import 'package:provider/provider.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({
    super.key,
  });

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final lengthController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: "Description"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: weightController,
            decoration: const InputDecoration(labelText: "Weight(g)"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the weight';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: widthController,
            decoration: const InputDecoration(labelText: "Width(cm)"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the width';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: lengthController,
            decoration: const InputDecoration(labelText: "Length(cm)"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the length';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: heightController,
            decoration: const InputDecoration(labelText: "Height(cm)"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the height';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: priceController,
            decoration: const InputDecoration(labelText: "Price"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the price';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final product = Product(
                      name: nameController.text,
                      description: descriptionController.text,
                      // categoryId: categoryId,
                      // categoryName: categoryName,
                      sku: getRandomString(5),
                      weight: int.parse(weightController.text),
                      width: int.parse(widthController.text),
                      height: int.parse(heightController.text),
                      length: int.parse(lengthController.text),
                      price: int.parse(priceController.text),
                      image: "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b");
                  await Provider.of<ProductProvider>(context, listen: false).addProduct(product);
                }
              },
              child: const Text("Submit"),
            ),
          )
        ],
      ),
    );
  }
}

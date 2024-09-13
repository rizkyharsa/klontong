import 'package:flutter/material.dart';
import 'package:klontong/data/product.dart';
import 'package:klontong/data/services/api_services.dart';

class ProductProvider with ChangeNotifier {
  final apiServices = ApiServices();
  List<Product> products = [];
  int currentPage = 1;
  bool isDataLoading = false;
  String searchQuery = '';

  List<Product> get productsData => products;
  int get currentPageData => currentPage;
  bool get isLoading => isDataLoading;

  Future<void> addProduct(Product product) async {
    final dataProduct = await apiServices.addProduct(product);
    products.add(dataProduct);
    notifyListeners();
  }

  Future<void> loadProducts() async {
    isDataLoading = true;
    notifyListeners();

    final listProduct = await apiServices.getProducts(currentPage);
    products.addAll(listProduct);
    currentPage++;

    isDataLoading = false;
    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    await apiServices.updateProduct(product);
    final index = products.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      products[index] = product;
    }
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    await apiServices.deleteProduct(id);
    products.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future<void> searchProducts({String search = ''}) async {
    searchQuery = search;
    final fetchedProducts = await apiServices.searchProducts(page: currentPage, searchQuery: searchQuery);
    products = fetchedProducts;
    notifyListeners();
  }

  Future<void> nextPage() async {
    currentPage++;
    await searchProducts(search: searchQuery);
  }

  Future<void> previousPage() async {
    if (currentPage > 1) {
      currentPage--;
      await searchProducts(search: searchQuery);
    }
  }
}

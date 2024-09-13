class Product {
  int? id;
  int? categoryId;
  String? categoryName;
  String? sku;
  String? name;
  String? description;
  int? weight;
  int? width;
  int? length;
  int? height;
  String? image;
  int? price;

  Product({
    this.id,
    this.categoryId,
    this.categoryName,
    this.sku,
    this.name,
    this.description,
    this.weight,
    this.width,
    this.length,
    this.height,
    this.image,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["CategoryId"],
        categoryName: json["categoryName"],
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        weight: json["weight"],
        width: json["width"],
        length: json["length"],
        height: json["height"],
        image: json["image"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "CategoryId": categoryId,
        "categoryName": categoryName,
        "sku": sku,
        "name": name,
        "description": description,
        "weight": weight,
        "width": width,
        "length": length,
        "height": height,
        "image": image,
        "price": price,
      };
}

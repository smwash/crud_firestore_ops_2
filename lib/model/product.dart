class Product {
  final String name;
  final double price;
  final String productId;

  Product({this.name, this.price, this.productId});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'productId': productId,
    };
  }

  Product.fromFirestore(Map<String, dynamic> document)
      : name = document['name'],
        price = document['price'],
        productId = document['productId'];
}

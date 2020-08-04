import 'package:crud_operations_prac2/model/product.dart';
import 'package:crud_operations_prac2/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
  String _name;
  double _price;
  String _productId;
  var uuid = Uuid();
  final database = Database();

  String get name => _name;
  double get price => _price;

  changeName(String name) {
    _name = name;
    notifyListeners();
  }

  changePrice(String price) {
    _price = double.parse(price);
    notifyListeners();
  }

  loadValues(Product product) {
    _name = product.name;
    _price = product.price;
    _productId = product.productId;
  }

  saveProducts() {
    if (_productId == null) {
      final newProduct = Product(
        name: name,
        price: price,
        productId: uuid.v4(),
      );
      database.saveProducts(newProduct);
    } else {
      final updatedProduct = Product(
        name: name,
        price: price,
        productId: _productId,
      );
      database.saveProducts(updatedProduct);
    }
  }

  removeProduct(String productId) {
    database.deleteProduct(productId);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operations_prac2/model/product.dart';

class Database {
  CollectionReference productCollection =
      Firestore.instance.collection('products');

  //create products in firestore:
  Future<void> saveProducts(Product product) async {
    return await productCollection.document(product.productId).setData(
          product.toMap(),
        );
  }

//get list of products from products collection.
  Stream<List<Product>> getProducts() {
    return productCollection.snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (document) => Product.fromFirestore(document.data),
              )
              .toList(),
        );
  }

//delete product:
  Future<void> deleteProduct(String productId) async {
    return await productCollection.document(productId).delete();
  }
}

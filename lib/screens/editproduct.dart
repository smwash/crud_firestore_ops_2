import 'package:crud_operations_prac2/model/product.dart';
import 'package:crud_operations_prac2/provider/product_provider.dart';
import 'package:crud_operations_prac2/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProduct extends StatefulWidget {
  final Product product;

  EditProduct({this.product});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Add Product',
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  initialValue:
                      widget.product == null ? '' : widget.product.name,
                  decoration: InputDecoration(hintText: 'Product name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Olease enter a valid product name';
                    }
                    return null;
                  },
                  onSaved: (value) => product.changeName(value),
                ),
                TextFormField(
                  initialValue: widget.product == null
                      ? ''
                      : widget.product.price.toString(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Product price'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid price';
                    }
                    return null;
                  },
                  onSaved: (value) => product.changePrice(value),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  child: Text('Save'),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    final isValid = _formKey.currentState.validate();
                    if (isValid) {
                      _formKey.currentState.save();
                      product.saveProducts();
                    }
                    Navigator.pop(context);
                  },
                ),
                RaisedButton(
                    child: Text('Delete'),
                    onPressed: () {
                      product.removeProduct(widget.product.productId);
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

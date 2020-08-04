import 'package:crud_operations_prac2/screens/product_screen.dart';
import 'package:crud_operations_prac2/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/product_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final database = Database();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        StreamProvider(create: (context) => database.getProducts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: ProductsScreen(),
      ),
    );
  }
}

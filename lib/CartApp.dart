import 'package:flutter/material.dart';

import 'ProductModel.dart';
import 'screens/CheckoutScreen.dart';
import 'screens/ProductScreen.dart';

class CartApp extends StatefulWidget {
  const CartApp({super.key});

  @override
  State<CartApp> createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  List<ProductModel> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart App"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Products",
              ),
              Tab(
                text: "Checkout",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductScreen((selectedProduct) {
              setState(() {
                cart.add(selectedProduct); //update
                sum = 0;
                cart.forEach((item) {
                  sum = sum + item.price;
                });
              });
            }),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: CheckoutScreen(cart, sum),
            ),
          ],
        ),
      ),
    );
  }
}

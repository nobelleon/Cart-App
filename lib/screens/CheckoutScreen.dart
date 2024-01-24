import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final cart;
  final sum;

  CheckoutScreen(this.cart, this.sum);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cart[index].name),
                trailing: Text(
                  "\Rp.${cart[index].price}.000",
                  style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: cart.length,
            shrinkWrap: true,
          ),
          Divider(),
          Text("Total : \Rp.$sum.000"),
        ],
      ),
    );
  }
}

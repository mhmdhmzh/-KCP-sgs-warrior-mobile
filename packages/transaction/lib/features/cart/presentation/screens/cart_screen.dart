import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:transaction/features/cart/presentation/screens/components/cart_item_component.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CartItemComponent(
                  index: index,
                );
              },
              itemCount: 100),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              spreadRadius: 2,
              color: Colors.blue.shade200,
            )
          ],
        ),
        height: getHeight(70),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total:'),
                  const Text(
                    'Rp 89.000.000',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icon/logo.png',
                        height: getHeight(10),
                      ),
                      WidthGap(width: getWidth(5)),
                      Text(
                        '34.000',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Checkout')),
            ],
          ),
        ),
      ),
    );
  }
}

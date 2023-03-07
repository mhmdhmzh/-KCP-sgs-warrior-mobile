import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:product/common_utils.dart';
import 'package:product/features/product/domain/entities/product_entity.dart';
import 'package:product/features/warehouse/presentation/screens/warehouse_screen.dart';

import '../bloc/product_card_bloc.dart';

class ProductCardSceen extends StatelessWidget {
  ProductCardSceen({
    required this.image,
    required this.stock,
    required this.productId,
    Key? key,
  }) : super(key: key);

  final String image;
  final String productId;
  final String stock;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductCardBloc>(),
      child: BlocBuilder<ProductCardBloc, ProductCardState>(
        builder: (context, state) {
          if (state is ProductCardInitial) {
            BlocProvider.of<ProductCardBloc>(context)
                .add(GetProductCard(productId: productId));
            return Container();
          } else if (state is Loading) {
            return Scaffold(
              appBar: AppBar(title: const Text('Produk')),
              body: const SafeArea(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.blue,
                ),
                height: getHeight(65),
                child: const CircularProgressIndicator(),
              ),
            );
          } else if (state is Success) {
            var productData = state.data.data.first;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Produk'),
                actions: const [
                  WarehouseAppbarIcon(),
                ],
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl: image,
                          height: getHeight(340),
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productData.prodName.toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getFont(24),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            HeightGap(height: getHeight(10)),
                            Text(
                              CommonUtils().currency(
                                  int.parse(productData.prodBasePrice)),
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: getFont(14),
                              ),
                            ),
                            HeightGap(height: getHeight(10)),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icon/logo.png',
                                  height: getHeight(15),
                                ),
                                Text(
                                  productData.prodModalPrice,
                                  style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getFont(14),
                                  ),
                                )
                              ],
                            ),
                            const Divider(),
                            HeightGap(height: getHeight(10)),
                            Row(
                              children: [
                                Text(
                                  'Warehouse: ',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: getFont(14),
                                  ),
                                ),
                                Text(
                                  'Zimbabwe',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getFont(14),
                                  ),
                                )
                              ],
                            ),
                            HeightGap(height: getHeight(10)),
                            const Divider(),
                            HeightGap(height: getHeight(10)),
                            Text(
                              'Informasi Produk',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getFont(24),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            HeightGap(height: getHeight(10)),
                            const Divider(),
                            HeightGap(height: getHeight(10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Berat: ',
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: getFont(14),
                                  ),
                                ),
                                Text(
                                  '${productData.prodGram} ${productData.prodSatuan}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getFont(14),
                                  ),
                                )
                              ],
                            ),
                            HeightGap(height: getHeight(10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Stock Tersedia: ',
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: getFont(14),
                                  ),
                                ),
                                Text(
                                  'stock',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getFont(14),
                                  ),
                                )
                              ],
                            ),
                            HeightGap(height: getHeight(10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Kategori: ',
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: getFont(14),
                                  ),
                                ),
                                Text(
                                  'categoryName',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getFont(14),
                                  ),
                                )
                              ],
                            ),
                            HeightGap(height: getHeight(10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Brand: ',
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: getFont(14),
                                  ),
                                ),
                                Text(
                                  'brandName',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getFont(14),
                                  ),
                                )
                              ],
                            ),
                            HeightGap(height: getHeight(10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Principle: ',
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: getFont(14),
                                  ),
                                ),
                                Text(
                                  'principleName',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getFont(14),
                                  ),
                                )
                              ],
                            ),
                            HeightGap(height: getHeight(10)),
                            const Divider(),
                            HeightGap(height: getHeight(10)),
                            Text(
                              'Deskripsi Produk',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getFont(24),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            HeightGap(height: getHeight(10)),
                            const Divider(),
                            HeightGap(height: getHeight(10)),
                            Text(
                              productData.prodDescription,
                              maxLines: null,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: getFont(14),
                              ),
                            ),
                            HeightGap(height: getHeight(10)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.blue,
                ),
                height: getHeight(65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                    Text(
                      'Keranjang',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is Error) {
            return Scaffold(
              appBar: AppBar(title: const Text('Produk')),
              body: SafeArea(
                child: Center(
                  child: Text(state.message),
                ),
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.blue,
                ),
                height: getHeight(65),
                child: Text(state.message),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(title: const Text('Produk')),
              body: const SafeArea(
                child: Center(
                  child: Text('Application Error'),
                ),
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.blue,
                ),
                height: getHeight(65),
                child: const Text('Application Error'),
              ),
            );
          }
        },
      ),
    );
  }
}

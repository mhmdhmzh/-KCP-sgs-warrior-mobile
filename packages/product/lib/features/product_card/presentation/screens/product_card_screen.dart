import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:product/common_utils.dart';
import 'package:product/features/product/domain/entities/product_entity.dart';
import 'package:product/features/warehouse/presentation/screens/warehouse_screen.dart';

import '../../../product/presentation/bloc/product_bloc.dart';

class ProductCardSceen extends StatelessWidget {
  ProductCardSceen({
    required this.productName,
    this.warehouseId,
    Key? key,
  }) : super(key: key);

  final String productName;
  final String? warehouseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductBloc>(),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            BlocProvider.of<ProductBloc>(context).add(GetProductCard(
                prodName: productName, warehouseId: warehouseId ?? '1'));
            return Container();
          } else if (state is ProductCardLoading) {
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
          } else if (state is ProductCardSuccess) {
            var productData = state.product.data.first;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Produk'),
                actions: [
                  WarehouseAppbarIcon(
                    isProductScreen: false,
                    prodName: productData.prodName,
                  ),
                ],
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl: productData.image.first,
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
                              productData.prodBasePrice,
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
                                  productData.prodWarpay.toString(),
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
                                  productData.warehouseName,
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
                                  '${productData.stock} stock',
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
                                  productData.categoryName,
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
                                  productData.brandName,
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
                                  productData.principleName,
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
          } else if (state is ProductCardError) {
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

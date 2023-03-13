import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:core/core.dart';
import 'package:product/features/product/presentation/screens/component/card_widget.dart';
import 'package:product/features/product/presentation/screens/component/top_card_widget..dart';

import '../../bloc/product_bloc.dart';

class TopProductComponent extends StatelessWidget {
  const TopProductComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductBloc>(),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            BlocProvider.of<ProductBloc>(context).add(GetTopProduct());
            return Container();
          } else if (state is TopProductLoading) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Top Produk',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFont(18),
                      ),
                    ),
                  ),
                  HeightGap(
                    height: getHeight(30),
                  ),
                  SizedBox(
                    height: getHeight(100),
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is TopProductSuccess) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Top Produk',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFont(18),
                      ),
                    ),
                  ),
                  HeightGap(
                    height: getHeight(30),
                  ),
                  SizedBox(
                    height: getHeight(300),
                    child: Expanded(
                      child: GridView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 3 / 2.3,
                          ),
                          children: state.products.data
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TopCardWidget(productData: e),
                                ),
                              )
                              .toList()),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is TopProductError) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Top Produk',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFont(18),
                      ),
                    ),
                  ),
                  HeightGap(
                    height: getHeight(30),
                  ),
                  SizedBox(
                    height: getHeight(100),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: Text(state.message),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Top Produk',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFont(18),
                      ),
                    ),
                  ),
                  HeightGap(
                    height: getHeight(30),
                  ),
                  SizedBox(
                    height: getHeight(100),
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: Text('Application Error'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:product/features/warehouse/presentation/screens/warehouse_screen.dart';
import '../../../../common_utils.dart';
import '../../../global_variable.dart' as globVar;

import '../bloc/product_bloc.dart';
import 'component/card_widget.dart';
import 'component/card_widget_shimmer.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);

  ValueNotifier<TextEditingController> searchController =
      ValueNotifier(TextEditingController());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Produk'),
          actions: const [
            WarehouseAppbarIcon(),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Form(
                child: ValueListenableBuilder(
                  valueListenable: searchController,
                  builder: (context, v, w) => FormInputSearch(
                    controller: searchController.value,
                    textWeight: FontWeight.normal,
                    textColor: Colors.black,
                    cursorColor: Colors.black,
                    borderOutlineColor: Colors.black,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 15,
                      color: Colors.black,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        searchController.value.text = '';
                      },
                      child: const Center(
                        widthFactor: 0,
                        child: Text(
                          'clear',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    hint: 'search product',
                    onChanged: (value) {
                      debugPrint(value);
                      BlocProvider.of<ProductBloc>(context).add(SearchProduct(
                          prodName: searchController.value.text,
                          warehouseId: '1'));
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductInitial) {
                  BlocProvider.of<ProductBloc>(context).add(GetProduct());
                  return Container();
                } else if (state is ProductEmpty) {
                  return const Center(
                    child: Text('Start Searching'),
                  );
                } else if (state is ProductLoading) {
                  return Expanded(
                    child: InViewNotifierCustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      // controller: _scrollControllerProduct,
                      isInViewPortCondition: (
                        double deltaTop,
                        double deltaBottom,
                        double vpHeight,
                      ) {
                        return deltaTop < (0.9 * vpHeight) &&
                            deltaBottom > (0.1 * vpHeight);
                      },
                      slivers: <Widget>[
                        SliverPadding(
                          padding:
                              const EdgeInsets.only(top: 50.0, bottom: 50.0),
                          sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200.0,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 32,
                              childAspectRatio: 0.7,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return InViewNotifierWidget(
                                  id: 'id',
                                  builder: (BuildContext context, bool isInView,
                                      Widget? child) {
                                    return const CardWidgetShimmer();
                                  },
                                );
                              },
                              childCount: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is ProductSuccess) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () =>
                              Future.delayed(const Duration(seconds: 1)).then(
                            (value) async {
                              var bloc = BlocProvider.of<ProductBloc>(context);
                              globVar.productList = [];

                              bloc.add(GetProduct());
                            },
                          ),
                          child: InViewNotifierCustomScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            isInViewPortCondition: (
                              double deltaTop,
                              double deltaBottom,
                              double vpHeight,
                            ) {
                              return deltaTop < (0.9 * vpHeight) &&
                                  deltaBottom > (0.0 * vpHeight);
                            },
                            slivers: <Widget>[
                              SliverPadding(
                                padding: const EdgeInsets.only(
                                    top: 50.0, bottom: 50.0),
                                sliver: SliverGrid(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200.0,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 32,
                                    childAspectRatio: 0.7,
                                  ),
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      var ProductDetail =
                                          state.products.data[index];
                                      return InViewNotifierWidget(
                                        id: 'id',
                                        builder: (BuildContext context,
                                            bool isInView, Widget? child) {
                                          return CardWidget(
                                            productData: ProductDetail,
                                          );
                                        },
                                      );
                                    },
                                    childCount: state.products.data.length,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is ProductError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const Center(
                    child: Text('Something Error Load Page'),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

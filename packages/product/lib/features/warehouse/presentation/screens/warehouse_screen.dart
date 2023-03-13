import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation/route/routes.dart';
import 'package:product/features/product/presentation/bloc/product_bloc.dart';

import '../bloc/warehouse_bloc.dart';
import 'package:core/common/constants.dart' as constants;

class WarehouseAppbarIcon extends StatelessWidget {
  const WarehouseAppbarIcon({
    required this.isProductScreen,
    required this.prodName,
    Key? key,
  }) : super(key: key);
  final bool isProductScreen;
  final String prodName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
      child: InkWell(
        onTap: () => showModalBottomSheet(
          enableDrag: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (_) {
            return WarehouseComponent(
              isProductScreen: isProductScreen,
              prodName: prodName,
            );
          },
        ),
        child: const Icon(
          Icons.warehouse,
          color: Colors.white,
        ),
      ),
    );
  }
}

class WarehouseComponent extends StatefulWidget {
  const WarehouseComponent({
    required this.isProductScreen,
    required this.prodName,
    Key? key,
  }) : super(key: key);
  final bool isProductScreen;
  final String prodName;

  @override
  State<WarehouseComponent> createState() => _WarehouseComponentState();
}

class _WarehouseComponentState extends State<WarehouseComponent> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductBloc>(),
          child: Container(),
        ),
        BlocProvider(
          create: (context) => sl<WarehouseBloc>(),
          child: Container(),
        ),
      ],
      child: BlocBuilder<WarehouseBloc, WarehouseState>(
        builder: (context, state) {
          if (state is WarehouseInitial) {
            BlocProvider.of<WarehouseBloc>(context).add(GetWarehouseEvent());
            return Container();
          } else if (state is Loading) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is Success) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HeightGap(height: getHeight(10)),
                      SizedBox(
                        height: getHeight(30),
                        child: ListTile(
                          title: Text(
                            'Warehouse',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getFont(16.5),
                            ),
                          ),
                        ),
                      ),
                      HeightGap(height: getHeight(16)),
                      const Divider(),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.warehouseEntity.data.length,
                        itemBuilder: (context, index) {
                          var warehouse = state.warehouseEntity.data[index];
                          return ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              if (widget.isProductScreen) {
                                debugPrint('tap');
                                sl<SharedPreferences>().setString(
                                    constants.PREF_KEY_WAREHOUSE_ID,
                                    warehouse.id.toString());
                                sl<SharedPreferences>().setString(
                                    constants.PREF_KEY_WAREHOUSE_NAME,
                                    warehouse.name);
                                context.pushNamed(AppRouter.productSearch,
                                    queryParams: {
                                      'warehouse_id': '${warehouse.id}',
                                      'warehouse_name': warehouse.name,
                                    });
                              } else {
                                debugPrint('top');
                                context.pushNamed(AppRouter.productCard,
                                    queryParams: {
                                      'product_name': widget.prodName,
                                      'warehouse_id': '${warehouse.id}'
                                    });
                              }
                            },
                            title: Text(
                              warehouse.name,
                              style: TextStyle(
                                fontSize: getFont(12),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (index, context) => const Divider(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is Error) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(state.message),
              ),
            );
          } else {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text('Application Error'),
              ),
            );
          }
        },
      ),
    );
  }
}

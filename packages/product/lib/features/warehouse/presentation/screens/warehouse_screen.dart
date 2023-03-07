import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../bloc/warehouse_bloc.dart';

class WarehouseAppbarIcon extends StatelessWidget {
  const WarehouseAppbarIcon({Key? key}) : super(key: key);

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
            return const WarehouseComponent();
          },
        ),
        child: const Icon(
          Icons.store,
          color: Colors.white,
        ),
      ),
    );
  }
}

class WarehouseComponent extends StatelessWidget {
  const WarehouseComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WarehouseBloc>(),
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
                            onTap: () {},
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

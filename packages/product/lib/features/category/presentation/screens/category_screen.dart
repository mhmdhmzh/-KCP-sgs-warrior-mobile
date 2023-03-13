import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:core/core.dart';

import '../bloc/category_bloc.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryBloc>(),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryInitial) {
            BlocProvider.of<CategoryBloc>(context).add(GetCategory());
            return Container();
          } else if (state is Loading) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kategori',
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
          } else if (state is Success) {
            var category = state.categoryEntity.data.where(
              (element) => element.categoryImage != null,
            );
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kategori',
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
                    // height: getHeight(100),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 102,
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: category.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CategoryItem(
                                iconPath:
                                    category.toList()[index].categoryImage!,
                                title: category.toList()[index].categoryName,
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is Error) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kategori',
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
                      'Kategori',
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

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.iconPath,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String iconPath, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                spreadRadius: 2,
                color: Colors.blue.shade200,
              )
            ],
          ),
          height: getHeight(60),
          width: getWidth(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              child: iconPath != ''
                  ? CachedNetworkImage(imageUrl: iconPath)
                  : Image.asset('assets/icon/logo.png'),
            ),
          ),
        ),
        HeightGap(
          height: getHeight(10),
        ),
        Text(
          title,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: getFont(12),
          ),
        ),
      ],
    );
  }
}

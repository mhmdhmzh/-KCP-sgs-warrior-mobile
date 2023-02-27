import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:core/core.dart';

class CategoryComponent extends StatelessWidget {
  CategoryComponent({Key? key}) : super(key: key);

  List<String> categoryList = ['', '', ''];

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CategoryItem(
                    iconPath: 'assets/icon/logo.png',
                    title: 'Beauty',
                  ),
                  WidthGap(
                    width: getWidth(20),
                  ),
                  const CategoryItem(
                    iconPath: 'assets/icon/logo.png',
                    title: 'Health',
                  ),
                  WidthGap(
                    width: getWidth(20),
                  ),
                  const CategoryItem(
                    iconPath: 'assets/icon/logo.png',
                    title: 'Food',
                  ),
                ],
              ),
            ),
          ),
        ],
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
          height: getHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              child: Image.asset(iconPath),
            ),
          ),
        ),
        HeightGap(
          height: getHeight(10),
        ),
        const Text('Beauty'),
      ],
    );
  }
}

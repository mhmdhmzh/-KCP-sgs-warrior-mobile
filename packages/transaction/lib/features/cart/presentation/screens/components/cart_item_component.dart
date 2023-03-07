import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartItemComponent extends StatelessWidget {
  const CartItemComponent({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(),
                Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        key: ValueKey<int>(index),
        onDismissed: (DismissDirection direction) {
          debugPrint('deleted');
        },
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl:
                'https://blogscdn.thehut.net/app/uploads/sites/1160/2018/01/080819-Body-Prods.jpg',
            fit: BoxFit.cover,
            height: getHeight(80),
            width: getWidth(80),
          ),
          title: Column(
            children: [
              Text(
                'PRODUK DENGAN TAMBAHAN HARGA AGAR LEBIH MAHAL JADINYA BISA BEGINI DEH',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: getFont(16),
                ),
              ),
              HeightGap(height: getHeight(10)),
              Row(
                children: [
                  const Text(
                    'Rp 15.000',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  WidthGap(width: getWidth(5)),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icon/logo.png',
                        height: getHeight(15),
                      ),
                      Text(
                        '200',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  WidthGap(width: getWidth(5)),
                  Text('x $index'),
                ],
              ),
              HeightGap(height: getHeight(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Warehouse: ',
                        style: TextStyle(
                          fontSize: getFont(12),
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Jakarta',
                        style: TextStyle(
                          fontSize: getFont(12),
                          color: Colors.grey.shade800,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: getHeight(10),
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.delete,
                        size: getHeight(10),
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

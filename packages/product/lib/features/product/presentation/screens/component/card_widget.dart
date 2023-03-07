import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/route/routes.dart';
import 'package:product/features/product/domain/entities/product_entity.dart';
import 'package:core/common/constants.dart' as constants;

import '../../../../../common_utils.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.productData,
    super.key,
  });

  final ProductDataEntity productData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(
          AppRouter.productCard,
          queryParams: {
            'product_id': productData.id.toString(),
            'image': productData.image.first,
            'stock': productData.stock.toString(),
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0)),
                  child: CachedNetworkImage(
                    imageUrl: productData.image.first,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return MarkupComponenet(
                              productData: productData,
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5)),
                        ),
                        width: 25,
                        height: 25,
                        child: const Icon(
                          Icons.percent,
                          color: Colors.white,
                          size: 15.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          HeightGap(height: getHeight(4)),
          Text(
            productData.prodName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: getFont(12.5),
            ),
          ),
          HeightGap(height: getHeight(4)),
          Text(
            productData.prodBasePrice,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              fontSize: getFont(14.5),
            ),
          ),
          HeightGap(height: getHeight(4)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      'assets/icon/logo.png',
                      height: getHeight(10),
                    ),
                  ),
                  WidthGap(width: getWidth(2.5)),
                  Text(
                    '${productData.prodWarpay}',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: getFont(12.5),
                    ),
                  ),
                ],
              ),
              Text(
                ' ${productData.stock} pcs',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: getFont(12.5),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MarkupComponenet extends StatelessWidget {
  MarkupComponenet({required this.productData, Key? key}) : super(key: key);

  final ProductDataEntity productData;

  @override
  Widget build(BuildContext context) {
    var price = productData.prodBasePrice.replaceAll(RegExp('[A-Za-z.]'), '');
    ValueNotifier<int> markupPrice = ValueNotifier(int.parse(price));
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: productData.image.first,
                  height: getHeight(200),
                ),
              ),
            ),
            HeightGap(height: getHeight(30)),
            Text(
              productData.prodName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            HeightGap(height: getHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Harga'),
                ValueListenableBuilder(
                  valueListenable: markupPrice,
                  builder: (context, v, w) => Text(
                    CommonUtils().currency(markupPrice.value),
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            HeightGap(height: getHeight(10)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  suffix: Icon(
                    Icons.percent,
                    color: Colors.grey,
                  ),
                  label: Text('Margin'),
                  fillColor: Colors.black,
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                  iconColor: Colors.black,
                ),
                onChanged: (value) {
                  var result = int.parse(price) +
                      (int.parse(price) * (int.parse(value) / 100)).round();
                  markupPrice.value = result;
                  debugPrint(result.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

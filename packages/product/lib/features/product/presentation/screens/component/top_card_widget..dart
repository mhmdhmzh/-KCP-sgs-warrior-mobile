import 'package:core/core.dart';
import 'package:core/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:navigation/route/routes.dart';
import 'package:product/features/product/domain/entities/product_entity.dart';
import 'package:core/common/constants.dart' as constants;
import 'package:product/features/product/domain/entities/top_product_entity.dart';
import 'package:product/features/product/presentation/screens/component/top_product_component.dart';

import '../../../../../common_utils.dart';

class TopCardWidget extends StatelessWidget {
  const TopCardWidget({
    required this.productData,
    super.key,
  });
  final TopProductDataEntity productData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRouter.productCard,
          queryParams: {
            'product_name': productData.prodName,
            'warehouse_id': sl<SharedPreferences>()
                .getString(constants.PREF_KEY_WAREHOUSE_ID),
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0)),
              child: CachedNetworkImage(
                imageUrl:
                    '${FlavorConfig.instance.baseUrl}${productData.image!}',
                fit: BoxFit.cover,
              ),
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
            CommonUtils().currency(int.parse(productData.prodBasePrice)),
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              fontSize: getFont(14.5),
            ),
          ),
        ],
      ),
    );
  }
}

class TopMarkupComponenet extends StatelessWidget {
  TopMarkupComponenet({required this.productData, Key? key}) : super(key: key);

  final TopProductDataEntity productData;

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
                  imageUrl: productData.image!,
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

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:core/core.dart';

class BannerComponent extends StatelessWidget {
  BannerComponent({Key? key}) : super(key: key);

  List bannerList = [
    'https://png.pngtree.com/png-clipart/20210815/original/pngtree-silk-high-end-beauty-skin-care-banner-png-image_6634815.jpg',
    'https://static.vecteezy.com/system/resources/previews/002/433/251/original/clear-skincare-product-banner-ads-on-wooden-table-with-white-paper-leaves-decorations-free-vector.jpg',
  ];
  final ValueNotifier<int> _current = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: bannerList.length,
          itemBuilder: (BuildContext context, int itemIndex, int i) {
            return InkWell(
              onTap: () => debugPrint('>>> Banner Tapped'),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(bannerList[itemIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              enableInfiniteScroll: true,
              height: getHeight(250),
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                _current.value = index;
              }),
        ),
        ValueListenableBuilder(
            valueListenable: _current,
            builder: (c, current, w) {
              return SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: bannerList.asMap().entries.map((entry) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: current == entry.key ? 24 : 8,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: current == entry.key ? Colors.blue : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
              );
            })
      ],
    );
  }
}

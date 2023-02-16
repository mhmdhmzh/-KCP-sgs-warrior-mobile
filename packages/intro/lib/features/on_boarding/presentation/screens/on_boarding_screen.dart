import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late Material materialButton;
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        pages: onboardingPagesList,
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return ColoredBox(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIndicator(
                    shouldPaint: true,
                    netDragPercent: dragDistance,
                    pagesLength: pagesLength,
                    indicator: Indicator(
                      activeIndicator: const ActiveIndicator(
                        color: Colors.grey,
                      ),
                      closedIndicator: const ClosedIndicator(
                        borderWidth: 10,
                        color: Colors.blue,
                      ),
                      indicatorDesign: IndicatorDesign.polygon(
                        polygonDesign: PolygonDesign(
                          polygon: DesignType.polygon_circle,
                        ),
                      ),
                    ),
                  ),
                  index == pagesLength - 1
                      ? const Text(
                          'SELESAI',
                        )
                      : const Text(
                          'LEWATI',
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  final onboardingPagesList = [
    PageModel(
      widget: Container(
        color: Colors.transparent,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 90.0,
              ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://rare-gallery.com/mocahbig/423182-Dragon-Ball-Dragon-Ball-Z-Son-Gohan-Gohan-manga.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'CHANGE AND RISE',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                'Give others access to any file or folders you choose.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: Container(
        color: Colors.transparent,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 90.0,
              ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://rare-gallery.com/mocahbig/423182-Dragon-Ball-Dragon-Ball-Z-Son-Gohan-Gohan-manga.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'WE CAN DO IT',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                'Give others money and never let anyone else beat you up, ganbate.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: Container(
        color: Colors.transparent,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 90.0,
              ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://rare-gallery.com/mocahbig/423182-Dragon-Ball-Dragon-Ball-Z-Son-Gohan-Gohan-manga.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'WATER THE TOILET',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                'Sometimes it smells, sometimes it does not. So man up and wipe your pee pee.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  ];
}

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation/route/routes.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late Material materialButton;
  final ValueNotifier<int> _index = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _index.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/background/bg_image.jpeg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: size.height,
          color: Colors.white70,
        ),
        ValueListenableBuilder(
          valueListenable: _index,
          builder: (context, index, widget) => Onboarding(
            pages: onboardingPagesList,
            onPageChange: (int pageIndex) {
              _index.value = pageIndex;
            },
            startPageIndex: _index.value,
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
                      _index.value == pagesLength - 1
                          ? InkWell(
                              onTap: () => context.push('/${AppRouter.login}'),
                              child: const Text(
                                'SELESAI',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                _index.value = pagesLength - 1;
                                setIndex(pagesLength - 1);
                              },
                              child: const Text(
                                'LEWATI',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
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

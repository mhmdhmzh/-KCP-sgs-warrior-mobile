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
          'assets/background/bg_image.jpg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
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
                color: Colors.white70,
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
                              onTap: () => context.goNamed(AppRouter.login),
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
        color: Colors.white,
        height: double.infinity,
        child: Center(
          child: Image.asset(
            'assets/background/intro_1.png',
          ),
        ),
      ),
    ),
    PageModel(
      widget: Container(
        color: Colors.white,
        height: double.infinity,
        child: Center(
          child: Image.asset(
            'assets/background/intro_2.png',
          ),
        ),
      ),
    ),
    PageModel(
      widget: Container(
        color: Colors.white,
        height: double.infinity,
        child: Center(
          child: Image.asset(
            'assets/background/intro_3.png',
          ),
        ),
      ),
    ),
  ];
}

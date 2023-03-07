import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:core/common/utils/input_widget.dart';
import 'package:core/common/utils/spaces.dart';
import 'package:core/common/utils/size_config.dart';
import 'package:core/core.dart';
import 'package:home/features/home/presentation/screens/sub_screens/main/component/banner_component.dart';
import 'package:home/features/home/presentation/screens/sub_screens/main/component/category_component.dart';
import 'package:navigation/route/routes.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: InkWell(
          onTap: () => context.goNamed(AppRouter.productSearch),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            height: getHeight(30),
            width: getWidth(300),
            child: Row(
              children: [
                WidthGap(width: getWidth(10)),
                const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                WidthGap(width: getWidth(10)),
                const Text(
                  'Search Product',
                  style: TextStyle(color: Colors.black, fontSize: 15.5),
                )
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            width: double.infinity,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hi, Son Gohan SSJ2',
                      style: TextStyle(
                        fontSize: getFont(18.5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Verified Account',
                      style: TextStyle(
                        fontSize: getFont(11.5),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   width: double.infinity,
              //   color: Colors.blue,
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Align(
              //           alignment: Alignment.centerLeft,
              //           child: Text(
              //             'Hi, Fredrin Sambo',
              //             style: TextStyle(
              //               fontSize: getFont(18.5),
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 50.0,
                        spreadRadius: 0.1,
                        offset: const Offset(0, 3),
                        color: Colors.blue.shade300,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: size.height / 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon/logo.png',
                              height: getHeight(20),
                            ),
                            WidthGap(
                              width: getWidth(10),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '0 WP',
                                  style: TextStyle(
                                    fontSize: getFont(12.5),
                                  ),
                                ),
                                Text(
                                  'Topup Warpay',
                                  style: TextStyle(
                                    fontSize: getFont(10.5),
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.blur_circular_outlined,
                              color: Colors.yellow,
                            ),
                            WidthGap(
                              width: getWidth(10),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '10 Poin',
                                  style: TextStyle(
                                    fontSize: getFont(12.5),
                                  ),
                                ),
                                Text(
                                  'Tukar Poin',
                                  style: TextStyle(
                                    fontSize: getFont(10.5),
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              HeightGap(
                height: getHeight(30),
              ),
              BannerComponent(),
              CategoryComponent(),
              CategoryComponent(),
              CategoryComponent(),
              CategoryComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

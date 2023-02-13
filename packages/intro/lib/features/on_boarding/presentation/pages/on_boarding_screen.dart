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
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          allowImplicitScrolling: true,
          // autoScrollDuration: 0,
          globalHeader: const Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 16, right: 16),
                child: Text('SGS Warrior'),
              ),
            ),
          ),
          // globalFooter: Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: SizedBox(
          //     width: double.infinity,
          //     height: 60,
          //     child: ElevatedButton(
          //       child: const Text(
          //         'Let\'s go right away!',
          //         style: TextStyle(
          //             fontSize: 16.0, fontWeight: FontWeight.bold),
          //       ),
          //       onPressed: () => print('SKIP'),
          //     ),
          //   ),
          // ),
          pages: [
            PageViewModel(
              title: "Full Screen Page",
              body:
                  "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
              image: CachedNetworkImage(
                  imageUrl:
                      'https://i.pinimg.com/originals/41/44/d8/4144d804eeaf88f5cfb20439ee409791.jpg'),
              decoration: const PageDecoration(
                contentMargin: EdgeInsets.symmetric(horizontal: 16),
                fullScreen: true,
                bodyFlex: 2,
                imageFlex: 3,
                safeArea: 100,
              ),
            ),
            PageViewModel(
              title: "Another title page",
              body: "Another beautiful body text for this example onboarding",
              image: CachedNetworkImage(
                  imageUrl:
                      'https://i.pinimg.com/originals/41/44/d8/4144d804eeaf88f5cfb20439ee409791.jpg'),
              footer: ElevatedButton(
                onPressed: () {
                  introKey.currentState?.animateScroll(0);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'FooButton',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration:
                  const PageDecoration(bodyFlex: 6, imageFlex: 6, safeArea: 80),
            ),
            PageViewModel(
              title: "Title of last page - reversed",
              bodyWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Click on ", style: TextStyle(fontSize: 19)),
                  Icon(Icons.edit),
                  Text(" to edit a post", style: TextStyle(fontSize: 19)),
                ],
              ),
              decoration: const PageDecoration(
                bodyFlex: 2,
                imageFlex: 4,
                bodyAlignment: Alignment.bottomCenter,
                imageAlignment: Alignment.topCenter,
              ),
              image: CachedNetworkImage(
                  imageUrl:
                      'https://i.pinimg.com/originals/41/44/d8/4144d804eeaf88f5cfb20439ee409791.jpg'),
              reverse: false,
            ),
          ],
          onDone: () => print('DONE'),
          showSkipButton: false,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: true,
          back: const Icon(Icons.arrow_back),
          skip: const Text(
            'Skip',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.orange,
            ),
          ),
          next: const Icon(Icons.arrow_forward),
          done: const Text(
            'Done',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.orange,
            ),
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          // dotsContainerDecorator: const ShapeDecoration(
          //   color: Colors.blue,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //   ),
          // ),
        ),
      ),
    );
  }
}

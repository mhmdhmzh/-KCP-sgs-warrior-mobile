import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OfferShimmer extends StatelessWidget {
  const OfferShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CardWidgetShimmer extends StatelessWidget {
  const CardWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
            child: Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 219, 219, 219),
              highlightColor: Colors.white,
              child: Container(
                // height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Shimmer.fromColors(
          baseColor: Color.fromARGB(255, 219, 219, 219),
          highlightColor: Colors.white,
          child: Container(
            height: 10,
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Shimmer.fromColors(
          baseColor: Color.fromARGB(255, 219, 219, 219),
          highlightColor: Colors.white,
          child: Container(
            height: 8,
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Shimmer.fromColors(
          baseColor: Color.fromARGB(255, 219, 219, 219),
          highlightColor: Colors.white,
          child: Container(
            height: 7,
            width: 70,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Shimmer.fromColors(
          baseColor: Color.fromARGB(255, 219, 219, 219),
          highlightColor: Colors.white,
          child: Container(
            height: 5,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

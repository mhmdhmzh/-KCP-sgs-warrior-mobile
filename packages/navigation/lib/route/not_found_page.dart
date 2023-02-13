import 'package:flutter/material.dart';
import 'package:navigation/route/routes.dart';

class NotFoundPage extends StatelessWidget {
  NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppRouter.router.location),
      ),
    );
  }
}

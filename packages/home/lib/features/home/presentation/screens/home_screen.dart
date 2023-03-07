import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:home/features/home/presentation/bloc/navbar_bloc.dart';
import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

import 'sub_screens/main/home_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarBloc(),
      child: Scaffold(
        body: BlocBuilder<NavbarBloc, NavbarState>(
          builder: (context, state) {
            if (state is NavbarHome) {
              return const HomeComponent();
            } else if (state is NavbarCart) {
              return const CartScreen();
            } else if (state is NavbarOrder) {
              return const SafeArea(
                child: Center(
                  child: Text('Order'),
                ),
              );
            } else {
              return const SafeArea(
                child: Center(
                  child: Text('Account'),
                ),
              );
            }
          },
        ),
        bottomNavigationBar: BlocBuilder<NavbarBloc, NavbarState>(
          builder: (context, state) {
            var currentIndex;
            if (state is NavbarHome) {
              currentIndex = state.index;
            } else if (state is NavbarCart) {
              currentIndex = state.index;
            } else if (state is NavbarOrder) {
              currentIndex = state.index;
            } else {
              currentIndex = 3;
            }
            return BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              currentIndex: currentIndex,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.currency_bitcoin,
                  ),
                  label: 'Order',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavbarBloc>(context)
                      .add(NavbarTapped(index: 0));
                } else if (index == 1) {
                  BlocProvider.of<NavbarBloc>(context)
                      .add(NavbarTapped(index: 1));
                } else if (index == 2) {
                  BlocProvider.of<NavbarBloc>(context)
                      .add(NavbarTapped(index: 2));
                } else {
                  BlocProvider.of<NavbarBloc>(context)
                      .add(NavbarTapped(index: 3));
                }
              },
            );
          },
        ),
      ),
    );
  }
}

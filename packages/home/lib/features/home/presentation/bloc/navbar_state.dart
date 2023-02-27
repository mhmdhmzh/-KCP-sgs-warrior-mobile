part of 'navbar_bloc.dart';

@immutable
abstract class NavbarState {}

class NavbarHome extends NavbarState {
  int index;

  NavbarHome({required this.index});
}

class NavbarCart extends NavbarState {
  int index;

  NavbarCart({required this.index});
}

class NavbarOrder extends NavbarState {
  int index;

  NavbarOrder({required this.index});
}

class NavbarAccount extends NavbarState {
  int index;

  NavbarAccount({required this.index});
}

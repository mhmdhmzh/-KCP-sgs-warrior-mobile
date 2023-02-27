part of 'navbar_bloc.dart';

@immutable
abstract class NavbarEvent {}

class NavbarTapped extends NavbarEvent {
  int index;

  NavbarTapped({required this.index});
}

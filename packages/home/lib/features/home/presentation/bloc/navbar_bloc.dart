import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarHome(index: 0)) {
    on<NavbarTapped>(_navbarChange);
  }

  _navbarChange(NavbarTapped event, Emitter<NavbarState> emit) {
    if (event.index == 0) {
      emit(NavbarHome(index: 0));
    } else if (event.index == 1) {
      emit(NavbarCart(index: 1));
    } else if (event.index == 2) {
      emit(NavbarOrder(index: 2));
    } else {
      emit(NavbarAccount(index: 3));
    }
  }
}

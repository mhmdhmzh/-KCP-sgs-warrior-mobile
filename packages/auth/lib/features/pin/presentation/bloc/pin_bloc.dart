import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pin_event.dart';
part 'pin_state.dart';

class PinBloc extends Bloc<PinEvent, PinState> {
  PinBloc() : super(PinInitial()) {
    on<PinEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

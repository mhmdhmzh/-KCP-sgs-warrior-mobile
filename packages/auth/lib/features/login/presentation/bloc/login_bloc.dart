import 'package:auth/features/login/domain/entities/login_resp_entity.dart';
import 'package:auth/features/login/domain/usecases/login_usecase.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc({required this.loginUsecase}) : super(LoginInitial()) {
    on<Login>(_login);
  }

  _login(Login event, Emitter<LoginState> emit) async {
    emit(Loading());

    final failedOrSuccess =
        await loginUsecase(LoginParams(event.email, event.media));

    emit(
      failedOrSuccess.fold(
        (l) => Error(message: (l as RequestFailure).message),
        (r) => Success(resp: r),
      ),
    );
  }
}

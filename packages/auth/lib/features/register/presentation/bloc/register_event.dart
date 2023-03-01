part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class GetRegion extends RegisterEvent {}

class DoRegister extends RegisterEvent {
  final RegisterReqEntity req;

  DoRegister({required this.req});
}

part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

// province
class RegionLoading extends RegisterState {}

class RegionSuccess extends RegisterState {
  final RegionEntity regionEntity;

  RegionSuccess({required this.regionEntity});
}

class RegionError extends RegisterState {
  final String message;

  RegionError({required this.message});
}

class RegionEmpty extends RegisterState {}

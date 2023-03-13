part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class Loading extends CategoryState {}

class Success extends CategoryState {
  final CategoryEntity categoryEntity;

  Success({required this.categoryEntity});
}

class Error extends CategoryState {
  final String message;

  Error({required this.message});
}

class Empty extends CategoryState {}

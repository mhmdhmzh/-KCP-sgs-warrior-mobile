import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';
import 'package:product/features/category/domain/entities/category_entity.dart';
import 'package:product/features/category/domain/usecases/category_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUsecase categoryUsecase;

  CategoryBloc({required this.categoryUsecase}) : super(CategoryInitial()) {
    on<GetCategory>(_getCategory);
  }

  _getCategory(GetCategory event, Emitter<CategoryState> emit) async {
    emit(Loading());

    final failedOrSuccess = await categoryUsecase(CategoryParams());

    emit(failedOrSuccess.fold(
        (l) => Error(message: (l as RequestFailure).message),
        (r) => Success(categoryEntity: r)));
  }
}

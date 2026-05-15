import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.homeRepo) : super(SearchResultInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSearchResult({required String category}) async {
    emit(SearchResultLoading());
    var result = await homeRepo.fetchSearchResult(category: category);
    result.fold(
      (failure) {
        emit(SearchResultFailure(failure.errMessage));
      },
      (books) {
        emit(SearchResultSuccess(books));
      },
    );
  }
}

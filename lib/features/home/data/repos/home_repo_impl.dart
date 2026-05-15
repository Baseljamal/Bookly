import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.apiService);
  ApiService apiService;

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?filter=free-ebooks&q=medicine',
      );

      List<BookModel> featuredBooks = [];

      for (var item in data['items'] ?? []) {
        featuredBooks.add(BookModel.fromJson(item));
      }

      return right(featuredBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?filter=free-ebooks&orderBy=newest&q=fantasy',
      );

      List<BookModel> newestBooks = [];

      for (var item in data['items'] ?? []) {
        newestBooks.add(BookModel.fromJson(item));
      }

      return right(newestBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?filter=free-ebooks&orderBy=relevance&q=$category',
      );

      List<BookModel> similarBooks = [];

      for (var item in data['items'] ?? []) {
        similarBooks.add(BookModel.fromJson(item));
      }

      return right(similarBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResult({required String category}) async{
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?filter=free-ebooks&orderBy=relevance&q=$category',
      );

      List<BookModel> searchResult = [];

      for (var item in data['items'] ?? []) {
        searchResult.add(BookModel.fromJson(item));
      }

      return right(searchResult);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

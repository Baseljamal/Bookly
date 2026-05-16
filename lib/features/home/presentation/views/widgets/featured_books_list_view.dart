import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/cached_book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_view_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.featuredBooks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBookDetailsView,
                        extra: state.featuredBooks[index],
                      );
                    },
                    child: CachedBookImage(
                      imageUrl:
                          state
                              .featuredBooks[index]
                              .volumeInfo
                              .imageLinks
                              ?.thumbnail ??
                          '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const FeaturedBooksListViewLoadingWidget();
        }
      },
    );
  }
}

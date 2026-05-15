import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/features/search/presentation/manager/search_result_cubit/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, SearchResultState>(
      builder: (context, state) {
        if (state is SearchResultSuccess) {
          final books = state.searchResultBooks;
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(bookModel: books[index]),
              );
            }, childCount: books.length),
          );
        } else if (state is SearchResultFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errMessage: state.errMessage),
          );
        } else if (state is SearchResultLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CustomLoadingIndicator()),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: Text(
                'Search for any book you like',
                style: Styles.textStyle16,
              ),
            ),
          );
        }
      },
    );
  }
}


// return ListView.builder(
    //   padding: EdgeInsets.zero,
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return const Padding(
    //       padding: EdgeInsets.symmetric(vertical: 10),
    //       // child: BookListViewItem(),
    //       child: Text('data'),
    //     );
    //   },
    // );
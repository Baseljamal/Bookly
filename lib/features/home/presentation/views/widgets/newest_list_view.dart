import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/newest_books_list_view_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(bookModel: state.newestBooks[index]),
              );
            }, childCount: state.newestBooks.length),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errMessage: state.errMessage),
          );
        } else {
          return const SliverToBoxAdapter(
            child: NewestBooksListViewLoadingWidget(),
          );
        }
      },
    );
  }
}

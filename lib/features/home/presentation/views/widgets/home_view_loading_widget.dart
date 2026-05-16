import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item_loading_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_view_loading_widget.dart';
import 'package:flutter/material.dart';

class HomeViewLoadingWidget extends StatelessWidget {
  const HomeViewLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              FeaturedBooksListViewLoadingWidget(),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Newest Books', style: Styles.textStyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: BookListViewItemLoadingWidget(),
            ),
            childCount: 10,
          ),
        ),
      ],
    );
  }
}

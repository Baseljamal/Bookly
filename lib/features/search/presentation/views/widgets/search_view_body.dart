import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back, size: 28),
                ),
                const Expanded(child: CustomSearchTextField()),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          // const SliverToBoxAdapter(
          //   child: Text('Search Result', style: Styles.textStyle18),
          // ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          const SearchResultListView(),
        ],
      ),
    );
  }
}

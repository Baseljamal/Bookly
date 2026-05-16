import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item_loading_widget.dart';
import 'package:flutter/material.dart';

class NewestBooksListViewLoadingWidget extends StatelessWidget {
  const NewestBooksListViewLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItemLoadingWidget(),
        );
      },
    );
  }
}

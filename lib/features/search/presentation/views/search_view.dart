import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SearchViewBody(bookModel: widget.bookModel,)));
  }
}

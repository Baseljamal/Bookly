import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
          builder: (context, state) {
            if (state is FeaturedBooksSuccess) {
              if (state.featuredBooks.isEmpty) {
                return const Center(child: Text('No books available'));
              }
              final book = state.featuredBooks.first;
              return HomeViewBody(bookModel: book);
            } else if (state is FeaturedBooksFailure) {
              return Center(child: Text(state.errMessage));
            } else {
              return const Center(child: CustomLoadingIndicator());
            }
          },
        ),
      ),
    );
  }
}

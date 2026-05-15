import 'package:bookly/features/search/presentation/manager/search_result_cubit/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _search() {
    final category = _controller.text.trim();
    if (category.isNotEmpty) {
      BlocProvider.of<SearchResultCubit>(
        context,
      ).fetchSearchResult(category: category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      cursorColor: Colors.white,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        final category = _controller.text.trim();
        if (category.isNotEmpty) {
          BlocProvider.of<SearchResultCubit>(
            context,
          ).fetchSearchResult(category: category);
        }
      },
      decoration: InputDecoration(
        hintText: 'Search',
        enabledBorder: buildOutlinedInputBorder(),
        focusedBorder: buildOutlinedInputBorder(),
        suffixIcon: IconButton(
          icon: const Opacity(
            opacity: 0.8,
            child: Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
          ),
          onPressed: _search,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlinedInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}

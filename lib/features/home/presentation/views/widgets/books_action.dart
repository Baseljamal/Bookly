import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              text: 'Free',
              textStyle: Styles.textStyle18.copyWith(color: Colors.black),
            ),
          ),
          Expanded(
            child: CustomButton(
              backgroundColor: const Color(0XFFEF8262),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              text: getText(bookModel),
              textStyle: Styles.textStyle16.copyWith(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onPressed: () {
                launchCustomUrl(context, bookModel.volumeInfo.previewLink);
              },
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Free preview';
    }
  }
}

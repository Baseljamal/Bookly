import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedBooksListViewLoadingWidget extends StatelessWidget {
  const FeaturedBooksListViewLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[700]!,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15),
              child: AspectRatio(
                aspectRatio: 2.6 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

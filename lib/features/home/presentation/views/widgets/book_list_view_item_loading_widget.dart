import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookListViewItemLoadingWidget extends StatelessWidget {
  const BookListViewItemLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[700]!,
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 15,
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 50,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Container(
                        height: 20,
                        width: 70,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

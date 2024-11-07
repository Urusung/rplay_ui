import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rplay_ui/favorite_contents_view/widgets/favorite_contenrs_ranking_widget.dart';
import 'package:rplay_ui/favorite_contents_view/widgets/favorite_contents_category_filter_widget.dart';

class FavoriteContentsView extends StatelessWidget {
  const FavoriteContentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            '인기 콘텐츠🔥',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Gap(24),
        FavoriteContentsCategoryFilterWidget(),
        Gap(24),
        FavoriteContentsRankingWidget(),
      ],
    );
  }
}

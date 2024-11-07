import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rplay_ui/favorite_contents_view/widgets/favorite_contents_ranking_carousel_slider_widget.dart';
import 'package:rplay_ui/favorite_contents_view/widgets/favorite_contents_ranking_filter_widget.dart';

class FavoriteContentsRankingWidget extends ConsumerWidget {
  const FavoriteContentsRankingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color.fromARGB(255, 32, 32, 36),
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoriteContentsRankingFilterWidget(),
          Gap(24),
          FavoriteContentsRankingCarouselSliderWidget(),
        ],
      ),
    );
  }
}

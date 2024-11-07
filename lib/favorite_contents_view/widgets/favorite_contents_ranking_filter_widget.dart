import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rplay_ui/favorite_contents_view/riverpod/favorite_contents_riverpod.dart';

class FavoriteContentsRankingFilterWidget extends ConsumerWidget {
  const FavoriteContentsRankingFilterWidget({super.key});
  final List<String> list = const [
    '주간 랭킹',
    '일간 랭킹',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryIndex = ref.watch(selectedCategoryIndexProvider);
    final rankingCarouselController =
        ref.read(rankingCarouselControllerProvider);

    return Wrap(
      spacing: 24,
      children: List.generate(
        list.length,
        (index) {
          return GestureDetector(
            onTap: () {
              ref.read(selectedCategoryIndexProvider.notifier).state = index;
              rankingCarouselController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              width: 64,
              height: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: selectedCategoryIndex == index
                        ? const Color.fromARGB(255, 0, 178, 255)
                        : const Color.fromARGB(255, 32, 32, 36),
                  ),
                ),
              ),
              child: Text(
                list[index],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

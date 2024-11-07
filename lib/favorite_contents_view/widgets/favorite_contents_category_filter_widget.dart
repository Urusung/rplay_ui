import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rplay_ui/home_view/riverpod/home_riverpod.dart';

class FavoriteContentsCategoryFilterWidget extends ConsumerWidget {
  const FavoriteContentsCategoryFilterWidget({super.key});

  final List<String> list = const [
    '콘텐츠',
    '다시보기',
    '무료',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryIndex = ref.watch(selectedCategoryIndexProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Wrap(
        spacing: 8,
        children: List.generate(
          list.length,
          (index) {
            return GestureDetector(
              onTap: () {
                ref.read(selectedCategoryIndexProvider.notifier).state = index;
              },
              child: Container(
                width: 82,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selectedCategoryIndex == index
                      ? const Color.fromARGB(255, 0, 178, 255)
                      : const Color.fromARGB(255, 32, 32, 36),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Text(
                  list[index],
                  style: selectedCategoryIndex == index
                      ? const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      : const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 154, 154, 154),
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

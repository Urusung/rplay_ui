import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rplay_ui/home_view/riverpod/home_riverpod.dart';

class HomeCategoryFilterWidget extends ConsumerWidget {
  const HomeCategoryFilterWidget({super.key});

  final List<String> list = const [
    '전체',
    '라이브',
    'ASMR/롤플레잉',
    '애니/드로잉',
    '여성향',
    '신인',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeCategoryIndex = ref.watch(homeCategoryIndexProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 8,
        children: List.generate(
          list.length,
          (index) {
            return GestureDetector(
              onTap: () {
                ref.read(homeCategoryIndexProvider.notifier).state = index;
              },
              child: Container(
                width: 112,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: homeCategoryIndex == index
                      ? const Color.fromARGB(255, 0, 178, 255)
                      : const Color.fromARGB(255, 32, 32, 36),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Text(
                  list[index],
                  style: homeCategoryIndex == index
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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rplay_ui/home_view/riverpod/home_riverpod.dart';

class HomeCarouselSliderWidget extends ConsumerWidget {
  const HomeCarouselSliderWidget({super.key});

  final imageList = const [
    'https://pb.rplay.live/pics/8c58400a11fffb537f17f809ebfef4b0',
    'https://pb.rplay.live/pics/297fb445c34cb4bfcdbdc4f08bca9e9d',
    'https://pb.rplay.live/pics/876a879cdff34d75093a012090a1d6b3',
    'https://pb.rplay.live/pics/cad4d1e206013bde2d6116c39e522d2e',
    'https://pb.rplay.live/pics/0eefac6667ab945f11303633a7cd726a',
    'https://pb.rplay.live/pics/e0ea436b9e312817ddcca82cc619187f',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestedContentIndex = ref.watch(suggestedContentIndexProvider);
    final CarouselSliderController controller = CarouselSliderController();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.width,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              ref.read(suggestedContentIndexProvider.notifier).state = index;
            },
          ),
          items: imageList
              .map(
                (item) => Image(
                  image: NetworkImage(item),
                  fit: BoxFit.contain,
                ),
              )
              .toList(),
        ),
        Positioned(
          bottom: 12,
          child: Row(
            children: imageList.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => controller.animateToPage(entry.key),
                  child: Container(
                    width: suggestedContentIndex == entry.key ? 16.0 : 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: suggestedContentIndex == entry.key
                          ? const Color.fromARGB(255, 0, 178, 255)
                          : const Color.fromARGB(255, 175, 175, 175),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}

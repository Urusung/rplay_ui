import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryIndexProvider = StateProvider<int>((ref) => 0);
final currentCarouselIndexProvider = StateProvider<int>((ref) => 0);
final rankingCarouselControllerProvider =
    StateProvider<CarouselSliderController>((ref) {
  return CarouselSliderController();
});

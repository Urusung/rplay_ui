import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteContentsCategoryIndexProvider = StateProvider<int>((ref) => 0);
final favoriteContentsRankingIndexProvider = StateProvider<int>((ref) => 0);
final favoriteContentsRankingCarouselIndexProvider =
    StateProvider<int>((ref) => 0);
final favoriteContentsRankingCarouselControllerProvider =
    StateProvider<CarouselSliderController>((ref) {
  return CarouselSliderController();
});

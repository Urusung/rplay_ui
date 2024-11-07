import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rplay_ui/favorite_contents_view/riverpod/favorite_contents_riverpod.dart';
import 'package:rplay_ui/model/ranking_model.dart';

class FavoriteContentsRankingCarouselSliderWidget extends ConsumerWidget {
  const FavoriteContentsRankingCarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<RankingModel> weeklyRankingList = List.generate(
      20,
      (index) => RankingModel(
        rank: index + 1,
        image:
            'https://d2p4nz4c0d1aqf.cloudfront.net/kr/jpeg/7/191da2cdc5f91056b18a2a9113d56a0537feda510df?Expires=1731033926&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9kMnA0bno0YzBkMWFxZi5jbG91ZGZyb250Lm5ldC9rci9qcGVnLzcvMTkxZGEyY2RjNWY5MTA1NmIxOGEyYTkxMTNkNTZhMDUzN2ZlZGE1MTBkZiIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTczMTAzMzkyNn19fV19&Signature=dWqHHEfhhto4QsvBjJTJXkQWrvDVwrPdtNDqbFhUdl3A-b9GHf8S9Zg3j0oJEWQcXcbYOnyhVCOSo7kdS3jebE4jtgABV6Vin8e5j1kx7XnFXo1RcAZIH9cI7ut7o6OUYcZE-XYvknawCV6~E5JDdJOh3JrG5jo-dfXkEjoqgMok50M~ntU5zB-c~n12w3LRcrdq0ljL5IaLa-2GZgVf67A71l88lMAFeA9xLegdZgZX-A7Zg5YCwemsaYaS0rJcwDZ5SXriVuMo8PJBNadPvccWwSpQ-cnDcNPDLwPl9ENFtuBg6FBv38zCKnuKLpuOHxFN5KkHsUtBnNlZtwBAsA__&Key-Pair-Id=K2736FVY8KN7TG',
        title: 'Sample Title ${index + 1}',
        creator: 'creator ${index + 1}',
        viewCount: '1.${index + 1}만',
        likeCount: '${index + 1}',
        commentCount: '${index + 1}',
      ),
    );

    final List<RankingModel> dailyRankingList = List.generate(
      20,
      (index) => RankingModel(
        rank: index + 1,
        image:
            'https://d2p4nz4c0d1aqf.cloudfront.net/kr/png/2/4643c82481fbb5b3964119da696981b1?Expires=1731042154&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9kMnA0bno0YzBkMWFxZi5jbG91ZGZyb250Lm5ldC9rci9wbmcvMi80NjQzYzgyNDgxZmJiNWIzOTY0MTE5ZGE2OTY5ODFiMSIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTczMTA0MjE1NH19fV19&Signature=Ya2ZpJGH8Btu0Va8qcImwQ8yhp3F37xm7yw1H6hadvp1fgjkZpKVEk0viYlQRCm6HCnVnYGds-wldPkJN5YT8jcghbUh~vt4WG6TQhq6xo6FUBGOg~R8OjF668Xdj6RR~Jnkrrxm76L2JoNwGyEg2PT5bnz4eBsvHJ4xoOqk~9q8zvJtMjO-5YhVR5tQdJXh4oG-AeflS1-qiHCj6GopKQN4ne2wNSVv9taGm8eeOMao9UxFVVKM1GTba5QtuKzmsBYzpFeYgbr2YMnqRqRyd7RvlOr6degtx7~B5Bh1a5VjC-6HXDsYwd1iFwjJ5Slx6OaJUMq~~Pm93fJBY4dT8g__&Key-Pair-Id=K2736FVY8KN7TG',
        title: 'Sample Title ${index + 1}',
        creator: 'creator ${index + 1}',
        viewCount: '1.${index + 1}만',
        likeCount: '${index + 1}',
        commentCount: '${index + 1}',
      ),
    );

    List<List<RankingModel>> getChunks(bool isWeekly) {
      final list = isWeekly ? weeklyRankingList : dailyRankingList;
      List<List<RankingModel>> chunks = [];
      for (int i = 0; i < list.length; i += 5) {
        chunks.add(list.sublist(i, i + 5 > list.length ? list.length : i + 5));
      }
      return chunks;
    }

    final selectedCategoryIndex = ref.watch(selectedCategoryIndexProvider);
    final currentCarouselIndex = ref.watch(currentCarouselIndexProvider);
    final rankingCarouselController =
        ref.read(rankingCarouselControllerProvider);

    return Column(
      children: [
        CarouselSlider(
          carouselController: rankingCarouselController,
          options: CarouselOptions(
            height: 432,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              ref.read(currentCarouselIndexProvider.notifier).state = index;
            },
          ),
          items: getChunks(selectedCategoryIndex == 0).map(
            (page) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: page.map(
                  (item) {
                    return RankingListItemWidget(item: item);
                  },
                ).toList(),
              );
            },
          ).toList(),
        ),
        const Gap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getChunks(selectedCategoryIndex == 0).asMap().entries.map(
            (entry) {
              return GestureDetector(
                onTap: () => rankingCarouselController.animateToPage(entry.key),
                child: Container(
                  width: currentCarouselIndex == entry.key ? 16.0 : 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: currentCarouselIndex == entry.key
                        ? const Color.fromARGB(255, 0, 178, 255)
                        : const Color.fromARGB(255, 175, 175, 175),
                  ),
                ),
              );
            },
          ).toList(),
        ),
        const Gap(12),
      ],
    );
  }
}

class RankingListItemWidget extends StatelessWidget {
  final RankingModel item;
  const RankingListItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          decoration: getRankDecoration(item.rank),
          alignment: Alignment.center,
          child: Text(
            item.rank.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Gap(16),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.image,
            width: 98,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(12),
        SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                item.creator,
                style: const TextStyle(
                  color: Color.fromARGB(255, 154, 154, 154),
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color.fromARGB(255, 154, 154, 154),
                    size: 16,
                  ),
                  const Gap(4),
                  Text(
                    item.viewCount,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 154, 154, 154),
                      fontSize: 12,
                    ),
                  ),
                  const Gap(4),
                  const Icon(
                    Icons.favorite_border_rounded,
                    color: Color.fromARGB(255, 154, 154, 154),
                    size: 16,
                  ),
                  const Gap(4),
                  Text(
                    item.likeCount,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 154, 154, 154),
                      fontSize: 12,
                    ),
                  ),
                  const Gap(4),
                  const Icon(
                    CupertinoIcons.chat_bubble,
                    color: Color.fromARGB(255, 154, 154, 154),
                    size: 16,
                  ),
                  const Gap(4),
                  Text(
                    item.commentCount,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 154, 154, 154),
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.favorite_border_rounded,
          size: 18,
          color: Color.fromARGB(255, 154, 154, 154),
        ),
      ],
    );
  }
}

BoxDecoration? getRankDecoration(int rank) {
  if (rank == 1) {
    return const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 237, 157),
          Color.fromARGB(255, 255, 165, 0),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  } else if (rank == 2) {
    return const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 220, 220, 220),
          Color.fromARGB(255, 124, 124, 124),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  } else if (rank == 3) {
    return const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 236, 164, 126),
          Color.fromARGB(255, 160, 75, 44),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  } else {
    return null;
  }
}

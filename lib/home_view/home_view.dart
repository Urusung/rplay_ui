import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rplay_ui/home_view/widgets/home_suggested_content_carousel_slider_widget.dart';
import 'package:rplay_ui/home_view/widgets/home_category_filter_widget.dart';
import 'package:rplay_ui/favorite_contents_view/favorite_contents_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 136,
        backgroundColor: Colors.black,
        leading: Row(
          children: [
            const Gap(12),
            Image.network(
              'https://i.namu.wiki/i/StgLsCLlppKMVXq9yRTMOk13FC5I4G7y2YDgR11EBmiNFPLRsMUC9spmphjge8QDjg8h1QJho61gwvCoIHMpM91hMVxpVTji2Xj5geXrjhFvOuhscERPvD0j1iUOoXSHlQrCqonjL4MO47pCxfjTqQ.webp',
              height: 36,
            ),
            const SizedBox(width: 4),
            Transform.scale(
              scale: 0.7,
              child: Switch(
                value: false,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            child: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          const Gap(12),
          GestureDetector(
            child: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          const Gap(12),
          GestureDetector(
            child: const Icon(
              Icons.reorder_rounded,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          const Gap(12),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(4),
              const HomeCategoryFilterWidget(),
              const Gap(16),
              const HomeCarouselSliderWidget(),
              const Gap(24),
              const FavoriteContentsView(),
              const Gap(48),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 32, 32, 36),
                child: const Text(
                  '이메일 알림 설정 방법 안내',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 154, 154, 154),
                  ),
                ),
              ),
              const Gap(56),
            ],
          ),
        ),
      ),
    );
  }
}

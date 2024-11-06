import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<String> menuTextList = [
    '전체',
    '라이브',
    'ASMR/롤플레잉',
    '애니/드로잉',
    '여성향',
    '신인',
  ];
  List<bool> isMenuSelected = [true, false, false, false, false, false];

  List<String> menu2TextList = [
    '콘텐츠',
    '다시보기',
    '무료',
  ];
  List<bool> isMenu2Selected = [true, false, false];

  final carouselImageList = [
    'https://pb.rplay.live/pics/8c58400a11fffb537f17f809ebfef4b0',
    'https://pb.rplay.live/pics/297fb445c34cb4bfcdbdc4f08bca9e9d',
    'https://pb.rplay.live/pics/876a879cdff34d75093a012090a1d6b3',
    'https://pb.rplay.live/pics/cad4d1e206013bde2d6116c39e522d2e',
    'https://pb.rplay.live/pics/0eefac6667ab945f11303633a7cd726a',
    'https://pb.rplay.live/pics/e0ea436b9e312817ddcca82cc619187f',
  ];
  int current = 0;
  final CarouselSliderController carouselController =
      CarouselSliderController();

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
          const SizedBox(width: 8),
          GestureDetector(
            child: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          const SizedBox(width: 8),
          GestureDetector(
            child: const Icon(
              Icons.reorder_rounded,
              color: Colors.white,
            ),
            onTap: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(4),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 8,
                  children: List.generate(
                    6,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              isMenuSelected =
                                  List.generate(6, (i) => i == index);
                            },
                          );
                        },
                        child: Container(
                          width: 112,
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isMenuSelected[index]
                                ? const Color.fromARGB(255, 0, 178, 255)
                                : const Color.fromARGB(255, 32, 32, 36),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Text(
                            menuTextList[index],
                            style: isMenuSelected[index]
                                ? const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 125, 125, 125),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Gap(16),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      autoPlay: true,
                      height: MediaQuery.of(context).size.width,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      },
                    ),
                    items: carouselImageList
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
                      children: carouselImageList.asMap().entries.map(
                        (entry) {
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width: current == entry.key ? 16.0 : 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: current == entry.key
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
              ),
              const Gap(28),
              const Padding(
                padding: EdgeInsets.only(
                  left: 16,
                ),
                child: Text(
                  '인기 콘텐츠🔥',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(28),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Wrap(
                  spacing: 8,
                  children: List.generate(
                    3,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              isMenu2Selected =
                                  List.generate(6, (i) => i == index);
                            },
                          );
                        },
                        child: Container(
                          width: 82,
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isMenu2Selected[index]
                                ? const Color.fromARGB(255, 0, 178, 255)
                                : const Color.fromARGB(255, 32, 32, 36),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Text(
                            menu2TextList[index],
                            style: isMenu2Selected[index]
                                ? const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 125, 125, 125),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Gap(28),
              Container(
                color: const Color.fromARGB(255, 32, 32, 36),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
              ),
              const Gap(56),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 32, 32, 36),
                child: const Text(
                  '이메일 알림 설정 방법 안내',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 125, 125, 125),
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

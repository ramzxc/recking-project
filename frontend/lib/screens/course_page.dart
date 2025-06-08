import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class CourseDetailPage extends StatelessWidget {
  CourseDetailPage({super.key});

  final String mapImage = 'assets/images/map.png'; // 지도 이미지 경로

  final List<Map<String, String>> places = [
    {'name': '서울숲', 'address': '서울 성동구 뚝섬로 273'},
    {'name': '베이크모굴', 'address': '서울 성동구 서울숲2길 17'},
    {'name': '낫저스트북스', 'address': '서울 성동구 서울숲길 44 3층'},
    {'name': '라라바스켓', 'address': '서울 성동구 서울숲길 55 1층'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 지도 이미지 배경
          Image.asset(
            mapImage,
            width: 500,
            height: 270,
            fit: BoxFit.fill,
          ),
          // 반투명 흰색 카드
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.4,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const Text(
                        '성수 산책',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '@play_king',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: List.generate(places.length, (index) {
                          return _buildPlaceItem(index + 1, places[index], index != places.length - 1);
                        }),
                      ),
                      const SizedBox(height: 20),

                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.calendar_today_outlined, color: Colors.white),
                          label: const Text(
                            '내 일정으로 담기',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          '10명이 이 일정을 탐방했습니다.',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
        bottomNavigationBar: const CustomBottomNavBar(currentIndex: null),


    );
  }

  Widget _buildPlaceItem(int step, Map<String, String> place, bool showLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.orange,
              child: Text(
                '$step',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            if (showLine)
              Container(
                width: 2,
                height: 40,
                color: Colors.orange,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    place['name']!,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: Text(
                    place['address']!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

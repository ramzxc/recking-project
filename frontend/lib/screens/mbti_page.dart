import 'package:flutter/material.dart';

class MbtiPage extends StatefulWidget {
  const MbtiPage({super.key});

  @override
  State<MbtiPage> createState() => _MbtiPageState();
}

class _MbtiPageState extends State<MbtiPage> {
  String? selectedMbti;

  final List<String> mbtiTypes = [
    'ISTJ', 'ISFJ', 'INFJ', 'INTJ',
    'ISTP', 'ISFP', 'INFP', 'INTP',
    'ESTP', 'ESFP', 'ENFP', 'ENTP',
    'ESTJ', 'ESFJ', 'ENFJ', 'ENTJ',
  ];

  final List<Map<String, String>> places = [
    {'title': '서울 시립 미술관', 'image': 'assets/images/seoul_museum.png'},
    {'title': '정동길', 'image': 'assets/images/jungdonggil.png'},
    {'title': '서점 리스본', 'image': 'assets/images/bookstore.png'},
    {'title': '모키 문래', 'image': 'assets/images/moki.png'},
    {'title': '로매지크', 'image': 'assets/images/leaumagique.png'},
    {'title': '텅플래닛', 'image': 'assets/images/tongueplanet.png'},
  ];

  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('MBTI', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 1,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              children: mbtiTypes.map((type) {
                final isSelected = selectedMbti == type;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() => selectedMbti = type);
                    },
                    selectedColor: Colors.cyan[200],
                    backgroundColor: Colors.grey[200],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: selectedMbti == null
                ? _buildIntro()
                : _buildPlaceGrid(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: '내 일정'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: '북마크'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '마이페이지'),
        ],
      ),
    );
  }

  Widget _buildIntro() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.orange.shade300,
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 60),
          ),
          const SizedBox(height: 20),
          const Text(
            '당신과 같은 MBTI를 가진 사람들이\n선호하는 놀거리를 추천합니다.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceGrid() {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(12),
      crossAxisSpacing: 6,
      mainAxisSpacing: 8,
      childAspectRatio: 1,
      children: places.map((place) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                place['image']!,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 8,
                bottom: 8,
                child: Text(
                  place['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

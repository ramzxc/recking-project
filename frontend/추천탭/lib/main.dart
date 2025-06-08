import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MbtiPage()));
}

class MbtiPage extends StatefulWidget {
  const MbtiPage({super.key});

  @override
  State<MbtiPage> createState() => _MbtiPageState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '추천 코스',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: MbtiPage(),
    );
  }
}

class _MbtiPageState extends State<MbtiPage> {
  String? selectedMbti;

  final List<String> mbtiTypes = [
    'ISTJ', 'ISFJ', 'INFJ', 'INTJ',
    'ISTP', 'ISFP', 'ESTJ', 'ESFJ',
    'ENTJ', 'ENFJ', 'ESFP', 'ESFJ',
    'INFP', 'ISFJ', 'ENTP', 'ENFP',
  ];

  final List<Map<String, String>> places = [
    {'title': '서울 시립 미술관', 'image': 'assets/seoul_museum.png'},
    {'title': '정동길', 'image': 'assets/jungdonggil.png'},
    {'title': '서점 리스본', 'image': 'assets/bookstore.png'},
    {'title': '모키 문래', 'image': 'assets/moki.png'},
    {'title': '로매지크', 'image': 'assets/leaumagique.png'},
    {'title': '텅플래닛', 'image': 'assets/tongueplanet.png'},
  ];
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('MBTI'),
        leading:IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: () {}),
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
          onTap: (index) =>
            setState(() =>
              _currentIndex = index
            ),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '커뮤니티'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: '내 일정'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: '북마크'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '마이페이지'),
          ]
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
          child: Icon(Icons.play_arrow, color: Colors.white, size:60),
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
    padding: EdgeInsets.all(12),
    crossAxisSpacing: 6,
    mainAxisSpacing: 8,
    childAspectRatio: 1,
    children: places.map((place) {
      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
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

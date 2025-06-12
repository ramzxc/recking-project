import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> todayList = [
    {
      'image': 'assets/images/home/image1.png',
      'title': '크리스챤 디올 성수',
      'subtitle': '성동구',
      'rating': '4.5',
    },
    {
      'image': 'assets/images/home/image2.png',
      'title': '대림창고 갤러리',
      'subtitle': '성동구',
      'rating': '4.1',
    },
    {
      'image': 'assets/images/home/image3.png',
      'title': '어니언 성수',
      'subtitle': '성동구',
      'rating': '4.3',
    },
  ];

  List<Map<String, dynamic>> courseList = [
    {
      'image': 'assets/images/home/image4.png',
      'title': '실내 놀거리',
      'subtitle': '트렌디 코스',
    },
    {
      'image': 'assets/images/home/image8.png',
      'title': '고궁 산책',
      'subtitle': '고궁 산책',
    },
    {
      'image': 'assets/images/home/image6.png',
      'title': '카페 투어',
      'subtitle': '카페 투어',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double statusBar = MediaQuery.of(context).padding.top;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildTopBar(statusBar),
          _buildTopImage(screenHeight),
          Expanded(child: _buildScrollableContent(context)),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
      floatingActionButton: const FloatingMenuButton(),
    );
  }

  Widget _buildTopBar(double statusBar) {
    return Container(
      padding: EdgeInsets.only(top: statusBar + 10, left: 20, right: 20, bottom: 6),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("유희왕", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, letterSpacing: 2)),
          Icon(Icons.search, size: 32),
        ],
      ),
    );
  }

  Widget _buildTopImage(double screenHeight) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.23,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/redbutton.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Stack(
        children: [
          Positioned(
            left: 16,
            bottom: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("재미가 필요하다면?", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black, blurRadius: 6)])),
                Text("레드버튼 성수점", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.black, blurRadius: 8)])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("오늘의 놀거리 😎"),
              const SizedBox(height: 13),
              _buildHorizontalList(todayList, true),
              const SizedBox(height: 25),
              _buildSectionTitle("추천 코스 🔥"),
              const SizedBox(height: 13),
              _buildHorizontalList(courseList, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          Text("전체보기 >", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey[700]))
        ],
      ),
    );
  }

  Widget _buildHorizontalList(List<dynamic> dataList, bool showRating) {
    return SizedBox(
      height: showRating ? 200 : 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: dataList.length,
        separatorBuilder: (context, idx) => const SizedBox(width: 16),
        itemBuilder: (context, idx) {
          final item = dataList[idx];
          return showRating ? _todayCard(item) : _courseCard(context, item);
        },
      ),
    );
  }

  Widget _todayCard(Map<String, dynamic> item) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: DecorationImage(
          image: item["image"].toString().startsWith('assets/')
              ? AssetImage(item["image"]) as ImageProvider
              : NetworkImage(item["image"] ?? ""),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 13,
            right: 13,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.65),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[400], size: 17),
                  const SizedBox(width: 2),
                  Text(item["rating"] ?? "", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                ],
              ),
            ),
          ),
          _cardTextOverlay(item["title"], item["subtitle"]),
        ],
      ),
    );
  }

  Widget _courseCard(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        if (item["title"]?.toString() == "성수 산책") {
          Navigator.of(context).pushNamed('/course');
        }
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          image: DecorationImage(
            image: item["image"].toString().startsWith('assets/')
                ? AssetImage(item["image"]) as ImageProvider
                : NetworkImage(item["image"] ?? ""),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 18),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.75), Colors.transparent],
                  ),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
                ),
                child: Text(
                  item["title"]?.toString() ?? "",
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardTextOverlay(String? title, String? subtitle) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.72), Colors.transparent],
          ),
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 26),
            Text(title ?? "", style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle ?? "", style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

class FloatingMenuButton extends StatefulWidget {
  const FloatingMenuButton({super.key});

  @override
  State<FloatingMenuButton> createState() => _FloatingMenuButtonState();
}

class _FloatingMenuButtonState extends State<FloatingMenuButton> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_isExpanded) ...[
          _buildMiniButton("MBTI"),
          const SizedBox(height: 10),
          _buildMiniButton("MOOD"),
          const SizedBox(height: 10),
        ],
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          child: ClipOval(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset(
                "assets/icons/menu_icon.jpg",
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.menu, color: Colors.white);
                },
              ),
            ),
          )
        ),
      ],
    );
  }

  Widget _buildMiniButton(String label) {
    String imagePath;
    switch (label) {
      case "MBTI":
        imagePath = "assets/icons/mbti_icon.jpg";
        break;
      case "MOOD":
        imagePath = "assets/icons/mood_icon.jpg";
        break;
      default:
        imagePath = "";
    }

    return FloatingActionButton(
      heroTag: 'fab_$label',
      onPressed: () {
        if (label == "MBTI") {
          Navigator.of(context).pushNamed('/mbti');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$label 버튼 눌림')),
          );
        }
      },
      backgroundColor: Colors.white,
      shape: const CircleBorder(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
          alignment: Alignment.center,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.image, color: Colors.orange);
          },
        ),
      ),
    );
  }
}

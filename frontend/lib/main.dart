import 'package:flutter/material.dart';
import 'models/post.dart';
import 'services/api_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const MyApp());
}

<<<<<<< HEAD:lib/main.dart
/*
void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
*/

// --- 홈 화면 ---
class HomeScreen extends StatelessWidget {
  // 샘플 데이터
  final List<Map<String, String>> todayList = [
    {
      "image": "assets/images/dior.jpg",
      "title": "크리스챤 디올 성수",
      "subtitle": "성동구",
      "rating": "4.5",
    },
    {
      "image": "assets/images/DR.jpg",
      "title": "대림창고 갤러리",
      "subtitle": "성동구",
      "rating": "4.1",
    },
    {
      "image": "assets/images/onion.jpeg",
      "title": "어니언 성수",
      "subtitle": "성동구",
      "rating": "4.3",
    },
  ];

  final List<Map<String, String>> courseList = [
    {
      "image": "assets/images/inside.jpeg",
      "title": "실내 놀거리",
    },
    {
      "image": "assets/images/walk.jpg",
      "title": "고궁 산책",
    },
    {
      "image": "assets/images/cafe.jpeg",
      "title": "카페 투어",
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
          // 상단 SafeArea + 커스텀바
          Container(
            padding: EdgeInsets.only(top: statusBar + 10, left: 20, right: 20, bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("RECKING", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, letterSpacing: 2)),
                Icon(Icons.search, size: 32),
              ],
            ),
          ),
          // 메인 상단 이미지 (사진은 예시)
          Container(
            width: double.infinity,
            height: screenHeight * 0.23,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/redbutton.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
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
          ),
          // 아래 흰색 영역 (rounded top corners)
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 오늘의 놀거리
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("오늘의 놀거리 ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                                Text("😎", style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Text("전체보기 >", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                      SizedBox(height: 13),
                      Container(
                        height: 200,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: todayList.length,
                          separatorBuilder: (context, idx) => SizedBox(width: 16),
                          itemBuilder: (context, idx) {
                            final item = todayList[idx];
                            return _todayCard(item);
                          },
                        ),
                      ),
                      SizedBox(height: 25),
                      // 추천 코스
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("추천 코스 ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                                Text("🔥", style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Text("전체보기 >", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                      SizedBox(height: 13),
                      Container(
                        height: 160,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: courseList.length,
                          separatorBuilder: (context, idx) => SizedBox(width: 16),
                          itemBuilder: (context, idx) {
                            final item = courseList[idx];
                            return _courseCard(item);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // 하단 네비게이션바
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (idx) {
          if (idx == 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => CommunityHomePage())
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "커뮤니티"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "내 일정"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: "북마크"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "마이페이지"),
        ],
      ),
    );
  }

  // 오늘의 놀거리 카드 위젯 (이미지+하단 오버레이+레이팅)
  Widget _todayCard(Map<String, String> item) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: DecorationImage(
          image: NetworkImage(item["image"] ?? ""),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // 레이팅
          Positioned(
            top: 13,
            right: 13,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.65),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[400], size: 17),
                  SizedBox(width: 2),
                  Text(item["rating"] ?? "", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                ],
              ),
            ),
          ),
          // 하단 텍스트
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.72), Colors.transparent],
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 26),
                  Text(
                    item["title"] ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item["subtitle"] ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 추천 코스 카드 위젯 (이미지+하단 오버레이)
  Widget _courseCard(Map<String, String> item) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: DecorationImage(
          image: NetworkImage(item["image"] ?? ""),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // 하단 텍스트 오버레이
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.75), Colors.transparent],
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
              ),
              child: Text(
                item["title"] ?? "",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
=======
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '커뮤니티 앱',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const CommunityHomePage(),
>>>>>>> c9d6cf1 (Update README project structure and backend - frontend connection):frontend/lib/main.dart
    );
  }
}

<<<<<<< HEAD:lib/main.dart
// --- 커뮤니티 페이지 ---
class CommunityHomePage extends StatelessWidget {
=======
class CommunityHomePage extends StatefulWidget {
>>>>>>> c9d6cf1 (Update README project structure and backend - frontend connection):frontend/lib/main.dart
  const CommunityHomePage({super.key});

  @override
  State<CommunityHomePage> createState() => _CommunityHomePageState();
}

class _CommunityHomePageState extends State<CommunityHomePage> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = ApiService.fetchPosts();
  }

  String _formatTimeAgo(DateTime createdAt) {
    final now = DateTime.now();
    final diff = now.difference(createdAt);
    if (diff.inMinutes < 60) return '${diff.inMinutes}분 전';
    if (diff.inHours < 24) return '${diff.inHours}시간 전';
    return '${createdAt.year}.${createdAt.month}.${createdAt.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          title: const Padding(
            padding: EdgeInsets.only(left: 0.0, bottom: 4),
            child: Text('커뮤니티', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          leading: const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Icon(Icons.group_outlined, color: Colors.black, size: 28),
          ),
          actions: const [
            Icon(Icons.notifications_none, color: Colors.black, size: 20),
            SizedBox(width: 16),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildStoryList(),
          const Divider(height: 1),
          Expanded(
            child: FutureBuilder<List<Post>>(
              future: futurePosts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('에러 발생: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('게시글이 없습니다.'));
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 80),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final post = snapshot.data![index];
                      return _buildPostCard(
                        username: post.username,
                        timeAgo: _formatTimeAgo(post.createdAt),
                        content: post.content,
                        imageUrls: post.images,
                        location: post.location,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          onPressed: () {},
          mini: true,
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          child: const Icon(Icons.edit, size: 18, color: Colors.orangeAccent),
        ),
      ),
<<<<<<< HEAD:lib/main.dart
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey[600],
        onTap: (idx) {
          if (idx == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => HomeScreen())
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 22),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, size: 22),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 22),
            label: '내 일정',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, size: 22),
            label: '북마크',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 22),
            label: '마이페이지',
          ),
        ],
=======
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 16),
        color: Colors.white,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          selectedFontSize: 9,
          unselectedFontSize: 9,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey[600],
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 22), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.group, size: 22), label: '커뮤니티'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today, size: 22), label: '내 일정'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark, size: 22), label: '북마크'),
            BottomNavigationBarItem(icon: Icon(Icons.person, size: 22), label: '마이페이지'),
          ],
        ),
>>>>>>> c9d6cf1 (Update README project structure and backend - frontend connection):frontend/lib/main.dart
      ),
    );
  }

  Widget _buildStoryList() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.person, size: 20, color: Colors.orangeAccent),
                ),
                const SizedBox(height: 4),
                Text('user$index', style: const TextStyle(fontSize: 10)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPostCard({
    required String username,
    required String timeAgo,
    required String content,
    required List<String> imageUrls,
    required String location,
  }) {
    final showImages = imageUrls.take(4).toList();
    final moreCount = imageUrls.length - 4;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.grey[200],
                child: const Icon(Icons.person, size: 14, color: Colors.orangeAccent),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    Text(timeAgo, style: const TextStyle(color: Colors.grey, fontSize: 9)),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(fontSize: 11)),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 2.0,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(showImages.length, (i) {
              return SizedBox(
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(showImages[i], fit: BoxFit.cover),
                      if (i == 3 && moreCount > 0)
                        Container(
                          color: Colors.black.withOpacity(0.5),
                          alignment: Alignment.center,
                          child: Text('+$moreCount', style: const TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.favorite_border, size: 16),
              const SizedBox(width: 4),
              const Text('16', style: TextStyle(fontSize: 11)),
              const SizedBox(width: 12),
              const Icon(Icons.chat_bubble_outline, size: 16),
              const SizedBox(width: 4),
              const Text('24', style: TextStyle(fontSize: 11)),
              const SizedBox(width: 12),
              const Icon(Icons.bookmark_border, size: 16),
              const SizedBox(width: 4),
              const Spacer(),
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 2),
              Expanded(
                child: Text(location, style: const TextStyle(color: Colors.grey, fontSize: 11), overflow: TextOverflow.ellipsis, textAlign: TextAlign.right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

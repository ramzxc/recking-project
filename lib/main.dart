import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '커뮤니티 앱',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const CommunityHomePage(),
    );
  }
}

class CommunityHomePage extends StatelessWidget {
  const CommunityHomePage({super.key});

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
            child: Text(
              '커뮤니티',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
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
          Expanded(child: _buildPostList()),
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
          child: const Icon(
            Icons.edit,
            size: 18,
            color: Colors.orangeAccent,
          ),
        ),
      ),


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
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.home, size: 22),
                  SizedBox(height: 2),
                ],
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.group, size: 22),
                  SizedBox(height: 2),
                ],
              ),
              label: '커뮤니티',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.calendar_today, size: 22),
                  SizedBox(height: 2),
                ],
              ),
              label: '내 일정',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.bookmark, size: 22),
                  SizedBox(height: 2),
                ],
              ),
              label: '북마크',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.person, size: 22),
                  SizedBox(height: 2),
                ],
              ),
              label: '마이페이지',
            ),
          ],
        ),
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
                    child: const Icon(Icons.person, size: 20, color: Colors.orangeAccent)
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

  Widget _buildPostList() {
    return ListView.builder(
      itemCount: 3,
      padding: const EdgeInsets.only(bottom: 80),
      itemBuilder: (context, index) {
        return _buildPostCard(
          username: 'user$index',
          timeAgo: '${5 + index * 2}시간 전',
          content: '성수동에 핫한 대림창고 방문.\n넓은 창고를 현대적인 감성으로 재해석한 베이커리 카페로\n다양한 빵과 음료를 함께 할 수 있음.\n가격이 저렴한 편은 아니지만 방문해볼만함.',
          imageCount: index == 0 ? 6 : 3,
          location: '성수동 대림창고 갤러리',
        );
      },
    );
  }

  Widget _buildPostCard({
    required String username,
    required String timeAgo,
    required String content,
    required int imageCount,
    required String location,
  }) {
    final List<String> imageUrls = List.generate(
      imageCount,
          (i) => 'https://picsum.photos/seed/${username}_$i/400/300',
    );
    final showImages = imageUrls.take(4).toList();
    final moreCount = imageCount - 4;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 유저 정보
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.grey[200],
                child: const Icon(Icons.person, size: 14, color: Colors.orangeAccent)
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    const SizedBox(height: 0),
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

          // 이미지 그리드
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
                          child: Text(
                            '+$moreCount',
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 8),

          // 아이콘 + 위치
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
                child: Text(
                  location,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

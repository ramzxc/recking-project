import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';
import 'home_page.dart';
import '../widgets/custom_bottom_nav_bar.dart';


class CommunityHomePage extends StatefulWidget {
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
                  return Center(child: Text('에러 발생: \${snapshot.error}'));
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
          // mini: true,
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          child: const Icon(Icons.edit, size: 18, color: Colors.orangeAccent),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildStoryList() {
    return SizedBox(
      //height: 90,
      height: 115,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            //padding: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CircleAvatar(
                  //radius: 24,
                  radius: 30,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.person, size: 20, color: Colors.orangeAccent),
                ),
                //const SizedBox(height: 4),
                const SizedBox(height: 8),
                //Text('user\$index', style: const TextStyle(fontSize: 10)),
                Text('user\$index', style: const TextStyle(fontSize: 13)),
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
                          child: Text('+\$moreCount', style: const TextStyle(color: Colors.white, fontSize: 18)),
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

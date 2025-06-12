import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';


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
    'ENTJ', 'ENFJ', 'ESFP', 'INTP',
    'INFP', 'ESTP', 'ENTP', 'ENFP',
  ];

  final Map<String, List<Map<String, String>>> Places = {
    'ENFP': [
      {'title': '서울 시립 미술관', 'image': 'assets/seoul_museum.png'},
      {'title': '정동길', 'image': 'assets/jungdonggil.png'},
      {'title': '성수 옥상', 'image': 'assets/oksang.png'},
      {'title': '성수다락', 'image': 'assets/darak.png'},
    ],
    'ISTJ': [
      {'title': '서점 리스본', 'image': 'assets/bookstore.png'},
      {'title': '모키 문래', 'image': 'assets/moki.png'},
      {'title': '무신사 성수', 'image': 'assets/musinsa.png'},
      {'title': '누데이크', 'image': 'assets/nudake.png'},
    ],
    'INFP': [
      {'title': '로매지크', 'image': 'assets/leaumagique.png'},
      {'title': '텅플래닛', 'image': 'assets/tongueplanet.png'},
      {'title': '서울숲', 'image': 'assets/seoulforest.png'},
      {'title': '유니유', 'image': 'assets/uniu.png'},
    ],
    'ISFJ': [
      {'title': '아모레 성수', 'image': 'assets/amore.png'},
      {'title': '커먼 그라운드', 'image': 'assets/commonground.png'},
      {'title': '언더스탠드 에비뉴', 'image': 'assets/understand.png'},
      {'title': '페인트래빗', 'image': 'assets/paintrabbit.png'},
    ],
    'INFJ': [
      {'title': '무신사 성수', 'image': 'assets/musinsa.png'},
      {'title': '누데이크', 'image': 'assets/nudake.png'},
      {'title': '테니', 'image': 'assets/teni.png'},
      {'title': '이로우', 'image': 'assets/irrow.png'},
    ],
    'ENTJ': [
      {'title': '오브뉴', 'image': 'assets/ofnew.png'},
      {'title': '포도피자', 'image': 'assets/pizza.png'},
      {'title': '텅플래닛', 'image': 'assets/tongueplanet.png'},
      {'title': '리얼월드', 'image': 'assets/realworld.png'},
    ],
    'ESFP': [
      {'title': '서울숲', 'image': 'assets/seoulforest.png'},
      {'title': '유니유', 'image': 'assets/uniu.png'},
      {'title': '오뜨로부엔디아', 'image': 'assets/otro.png'},
      {'title': '카페포제', 'image': 'assets/poze.png'},
    ],
    'ESTP': [
      {'title': '레인리포트', 'image': 'assets/rainreport.png'},
      {'title': '뚝섬미술관', 'image': 'assets/museum.png'},
      {'title': '리스트 오브 띵즈', 'image': 'assets/listof.png'},
      {'title': '레트르 성수', 'image': 'assets/rettre.png'},
    ],
    'ENFJ': [
      {'title': '메이드바이', 'image': 'assets/madeby.png'},
      {'title': '리얼월드', 'image': 'assets/realworld.png'},
      {'title': '모센즈스위트', 'image': 'assets/sweets.png'},
      {'title': '바오 서울', 'image': 'assets/baoseoul.png'},
    ],
    'ENTP': [
      {'title': '성수 옥상', 'image': 'assets/oksang.png'},
      {'title': '성수다락', 'image': 'assets/darak.png'},
      {'title': '오브뉴', 'image': 'assets/ofnew.png'},
      {'title': '포도피자', 'image': 'assets/pizza.png'},
    ],
    'INTJ': [
      {'title': '오뜨로부엔디아', 'image': 'assets/otro.png'},
      {'title': '카페포제', 'image': 'assets/poze.png'},
      {'title': '로매지크', 'image': 'assets/leaumagique.png'},
      {'title': '텅플래닛', 'image': 'assets/tongueplanet.png'},
    ],
    'ISFP': [
      {'title': '모센즈스위트', 'image': 'assets/sweets.png'},
      {'title': '바오 서울', 'image': 'assets/baoseoul.png'},
      {'title': '레인리포트', 'image': 'assets/rainreport.png'},
      {'title': '누데이크', 'image': 'assets/nudake.png'},
    ],
    'ISTP': [
      {'title': '웨스턴챕터', 'image': 'assets/western.png'},
      {'title': '디뮤지엄', 'image': 'assets/demuseum.png'},
      {'title': '오뜨로부엔디아', 'image': 'assets/otro.png'},
      {'title': '레트르 성수', 'image': 'assets/rettre.png'},
    ],
    'INTP': [
      {'title': '언더스탠드 에비뉴', 'image': 'assets/understand.png'},
      {'title': '페인트래빗', 'image': 'assets/paintrabbit.png'},
      {'title': '서울숲', 'image': 'assets/seoulforest.png'},
      {'title': '유니유', 'image': 'assets/uniu.png'},
    ],
    'ESTJ': [
      {'title': '리스트 오브 띵즈', 'image': 'assets/listof.png'},
      {'title': '레트르 성수', 'image': 'assets/rettre.png'},
      {'title': '메이드바이', 'image': 'assets/madeby.png'},
      {'title': '리얼월드', 'image': 'assets/realworld.png'},
    ],
    'ESFJ': [
      {'title': '테니', 'image': 'assets/teni.png'},
      {'title': '이로우', 'image': 'assets/irrow.png'},
      {'title': '아모레 성수', 'image': 'assets/amore.png'},
      {'title': '커먼 그라운드', 'image': 'assets/commonground.png'}
    ],
  };
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
        bottomNavigationBar: CustomBottomNavBar(currentIndex: null),
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
    final mbti = selectedMbti!;
    final places = Places[mbti] ?? [];

    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(12),
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
                  style: const TextStyle(
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


// import 'package:flutter/material.dart';
// import '../widgets/custom_bottom_nav_bar.dart';
// import '../services/api_service.dart';
// import '../models/place.dart';

// class MbtiPage extends StatefulWidget {
//   const MbtiPage({super.key});

//   @override
//   State<MbtiPage> createState() => _MbtiPageState();
// }

// class _MbtiPageState extends State<MbtiPage> {
//   String? selectedMbti;
//   List<Place> mbtiPlaces = [];

//   final List<String> mbtiTypes = [
//     'ISTJ', 'ISFJ', 'INFJ', 'INTJ',
//     'ISTP', 'ISFP', 'INFP', 'INTP',
//     'ESTP', 'ESFP', 'ENFP', 'ENTP',
//     'ESTJ', 'ESFJ', 'ENFJ', 'ENTJ',
//   ];

//   final int _currentIndex = 2;

//   void _loadMbtiPlaces(String type) async {
//     final data = await ApiService.fetchMbtiPlaces(type);
//     setState(() {
//       mbtiPlaces = data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text('MBTI', style: TextStyle(color: Colors.black)),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         elevation: 1,
//       ),
//       body: Column(
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//             child: Row(
//               children: mbtiTypes.map((type) {
//                 final isSelected = selectedMbti == type;
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4),
//                   child: ChoiceChip(
//                     label: Text(type),
//                     selected: isSelected,
//                     onSelected: (_) {
//                       setState(() => selectedMbti = type);
//                       _loadMbtiPlaces(type);
//                     },
//                     selectedColor: Colors.cyan[200],
//                     backgroundColor: Colors.grey[200],
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Expanded(
//             child: selectedMbti == null
//                 ? _buildIntro()
//                 : _buildPlaceGrid(),
//           ),
//         ],
//       ),
//       bottomNavigationBar: const CustomBottomNavBar(currentIndex: null),
//     );
//   }

//   Widget _buildIntro() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 60,
//             backgroundColor: Colors.orange.shade300,
//             child: const Icon(Icons.play_arrow, color: Colors.white, size: 60),
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             '당신과 같은 MBTI를 가진 사람들이\n선호하는 놀거리를 추천합니다.',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 14, color: Colors.black87),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPlaceGrid() {
//     return GridView.count(
//       crossAxisCount: 2,
//       padding: const EdgeInsets.all(12),
//       crossAxisSpacing: 6,
//       mainAxisSpacing: 8,
//       childAspectRatio: 1,
//       children: mbtiPlaces.map((place) {
//         return Card(
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           clipBehavior: Clip.antiAlias,
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               Image.network(
//                 place.image,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) =>
//                     const Icon(Icons.broken_image, size: 48),
//               ),
//               Positioned(
//                 left: 8,
//                 bottom: 8,
//                 child: Text(
//                   place.title,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 13,
//                     shadows: [Shadow(color: Colors.black, blurRadius: 6)],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

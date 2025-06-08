import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../services/api_service.dart';
import '../models/place.dart';

class MbtiPage extends StatefulWidget {
  const MbtiPage({super.key});

  @override
  State<MbtiPage> createState() => _MbtiPageState();
}

class _MbtiPageState extends State<MbtiPage> {
  String? selectedMbti;
  List<Place> mbtiPlaces = [];

  final List<String> mbtiTypes = [
    'ISTJ', 'ISFJ', 'INFJ', 'INTJ',
    'ISTP', 'ISFP', 'INFP', 'INTP',
    'ESTP', 'ESFP', 'ENFP', 'ENTP',
    'ESTJ', 'ESFJ', 'ENFJ', 'ENTJ',
  ];

  final int _currentIndex = 2;

  void _loadMbtiPlaces(String type) async {
    final data = await ApiService.fetchMbtiPlaces(type);
    setState(() {
      mbtiPlaces = data;
    });
  }

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
                      _loadMbtiPlaces(type);
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
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: null),
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
      children: mbtiPlaces.map((place) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                place.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 48),
              ),
              Positioned(
                left: 8,
                bottom: 8,
                child: Text(
                  place.title,
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

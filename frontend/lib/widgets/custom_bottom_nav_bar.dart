import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int? currentIndex; // null이면 모든 아이콘 회색

  const CustomBottomNavBar({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final int safeIndex = (currentIndex != null && currentIndex! >= 0 && currentIndex! < 5)
        ? currentIndex!
        : -1; // -1이면 선택된 탭 없음

    return BottomNavigationBar(
      currentIndex: safeIndex >= 0 ? safeIndex : 0, // BottomNavigationBar는 -1 안 됨
      selectedItemColor: currentIndex != null ? Colors.black : Colors.grey[400],
      unselectedItemColor: Colors.grey[400],
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        // 이미 선택된 탭이면 아무 동작 없음
        if (currentIndex == index) return;

        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/community');
            break;
          case 2:
          // Navigator.pushReplacementNamed(context, '/calendar');
            break;
          case 3:
          // Navigator.pushReplacementNamed(context, '/bookmark');
            break;
          case 4:
          // Navigator.pushReplacementNamed(context, '/mypage');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: '커뮤니티'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: '내 일정'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: '북마크'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '마이페이지'),
      ],
    );
  }
}

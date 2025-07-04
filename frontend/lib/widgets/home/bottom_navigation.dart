import 'package:frontend/screens/community/community_screen.dart';
import 'package:flutter/material.dart';
import '../../screens/test/test_edah_screen.dart';
import '../../utils/colors.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/courses/courses_screen.dart';
import '../../screens/chat/chat_screen.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  
  const BottomNavigation({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            context,
            iconPath: 'assets/icons/nav_home.png',
            index: 0,
            onTap: () {
              if (currentIndex != 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              }
            },
          ),
          _buildNavItem(
            context,
            iconPath: 'assets/icons/nav_courses.png', // Book icon for courses
            index: 1,
            onTap: () {
              if (currentIndex != 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const CoursesScreen()),
                );
              }
            },
          ),
          _buildNavItem(
            context,
            iconPath: 'assets/icons/nav_community.png',
            index: 2,
            onTap: () {
              if (currentIndex != 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const CommunityScreen()),
                );
              }
            },
          ),
          _buildNavItem(
            context,
            iconPath: 'assets/icons/nav_help.png',
            index: 3,
            onTap: () {
              if (currentIndex != 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              }
            },
          ),
          _buildNavItem(
            context,
            iconPath: 'assets/icons/nav_test.png',
            index: 4,
            onTap: () {
              if (currentIndex != 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TestEdahScreen()),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required String iconPath,
    required int index,
    required VoidCallback onTap,
  }) {
    final isSelected = currentIndex == index;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32.0,
              height: 32.0,
              child: Image.asset(
                iconPath,
                //color: isSelected ? AppColors.primaryPurple : AppColors.textGray,
                width: 24.0,
                height: 24.0,
              ),
            ),
            const SizedBox(height: 4.0),
            Container(
              width: 4.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryPurple : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
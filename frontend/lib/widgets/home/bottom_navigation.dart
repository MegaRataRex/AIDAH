import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../screens/chat/chat_screen.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
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
          _buildNavItem(context, 0, 'assets/icons/nav_home.png'),
          _buildNavItem(context, 1, 'assets/icons/nav_courses.png'),
          _buildNavItem(context, 2, 'assets/icons/nav_community.png'),
          _buildNavItem(context, 3, 'assets/icons/nav_help.png'),
          _buildNavItem(context, 4, 'assets/icons/nav_test.png'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, String iconPath) {
    final isSelected = selectedIndex == index;
    
    return GestureDetector(
      onTap: () {
        if (index == 3) { // Help icon index
          // Navigate to chat screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatScreen(),
            ),
          );
        } else {
          onItemTapped(index);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightTeal.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Image.asset(
          iconPath,
          width: 24.0,
          height: 24.0,
          errorBuilder: (context, error, stackTrace) {
            // Fallback icon if image fails to load
            return Icon(
              Icons.circle,
              size: 24.0,
              color: isSelected ? AppColors.primaryPurple : AppColors.textGray,
            );
          },
        ),
      ),
    );
  }
}
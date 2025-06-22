import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/chat/chat_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Column(
          children: [
            // User profile section
            _buildUserProfile(),
            
            // Divider - reduced margin for consistent spacing
            Container(
              height: 1.0,
              color: AppColors.lighterPurple,
              margin: const EdgeInsets.symmetric(vertical: 12.0), // Reduced from 20.0
            ),
            
            // Menu options
            Expanded(
              child: _buildMenuOptions(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Reduced vertical padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Align everything to the right
        children: [
          // User info - right aligned
          Column(
            crossAxisAlignment: CrossAxisAlignment.end, // Right-align the text
            children: [
              const Text(
                'Maria',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              const SizedBox(height: 2.0), // Small spacing between name and handle
              const Text(
                '@mariapiedad',
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppColors.lightPurple,
                ),
              ),
            ],
          ),
          
          const SizedBox(width: 16.0),
          
          // Profile icon on the right
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/user_avatar.png',
                width: 50.0,
                height: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOptions(BuildContext context) {
    final menuItems = [
      {
        'title': 'Configuración',
        'icon': 'assets/icons/settings.png',
        'onTap': () {
          // TODO: Navigate to settings
          Navigator.pop(context);
          print('Configuración tapped');
        },
      },
      {
        'title': 'Ayuda',
        'icon': 'assets/icons/help.png',
        'onTap': () {
          // TODO: Navigate to help
          Navigator.pop(context);
          print('Ayuda tapped');
        },
      },
      {
        'title': 'Directorio de especialistas',
        'icon': 'assets/icons/directory.png',
        'onTap': () {
          // TODO: Navigate to specialists directory
          Navigator.pop(context);
          print('Directorio tapped');
        },
      },
      {
        'title': 'FAQ',
        'icon': 'assets/icons/faq.png',
        'onTap': () {
          // Navigate to chat screen for FAQ
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatScreen(),
            ),
          );
        },
      },
      {
        'title': 'Cerrar sesión',
        'icon': 'assets/icons/logout.png',
        'onTap': () {
          // Navigate to login screen
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false, // Remove all previous routes
          );
        },
      },
    ];

    return Column(
      children: [
        // Build menu items with separators
        for (int i = 0; i < menuItems.length; i++) ...[
          _buildMenuItem(
            title: menuItems[i]['title'] as String,
            iconPath: menuItems[i]['icon'] as String,
            onTap: menuItems[i]['onTap'] as VoidCallback,
          ),
          // Add separator line except for the last item
          if (i < menuItems.length - 1)
            Container(
              height: 1.0,
              color: AppColors.lighterPurple,
            ),
        ],
      ],
    );
  }

  Widget _buildMenuItem({
    required String title,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 12.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end, // Align content to the right
            children: [
              // Menu text - right aligned
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryPurple,
                ),
              ),
              
              const SizedBox(width: 16.0), // Space between text and icon
              
              // Menu icon
              Container(
                width: 36.0,
                height: 36.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Image.asset(
                    iconPath,
                    width: 36.0,
                    height: 36.0,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.circle,
                        size: 18.0,
                        color: AppColors.primaryPurple,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
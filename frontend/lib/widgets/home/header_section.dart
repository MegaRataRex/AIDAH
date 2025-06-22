import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class HeaderSection extends StatelessWidget {
  final String userName;

  const HeaderSection({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side - Greeting and date
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Hola, ',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      TextSpan(
                        text: '$userName.',
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryPurple,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  '06/06/2025',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
            
            // Right side - Notification and profile icons
            Row(
              children: [
                // Notification bell
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icons/bell.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
                const SizedBox(width: 12.0),
                // Profile icon - now clickable to open drawer
                GestureDetector(
                  onTap: () {
                    // Open the side drawer
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/profile.png',
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        
        // Add divider line
        const SizedBox(height: 16.0),
        Container(
          height: 1.0,
          color: AppColors.lightGray,
        ),
      ],
    );
  }
}
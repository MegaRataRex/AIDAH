import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/home/header_section.dart';
import '../../widgets/home/courses_section.dart';
import '../../widgets/home/specialists_section.dart';
import '../../widgets/home/community_section.dart';
import '../../widgets/home/bottom_navigation.dart';
import '../../widgets/home/side_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // Add the side drawer
      endDrawer: const SideDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Main content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    
                    // Header Section
                    const HeaderSection(userName: 'Maria'),
                    
                    const SizedBox(height: 24.0),
                    
                    // Courses Section
                    const CoursesSection(),
                    
                    const SizedBox(height: 32.0),
                    
                    // Specialists Section
                    const SpecialistsSection(),
                    
                    const SizedBox(height: 32.0),
                    
                    // Community Section
                    const CommunitySection(),
                    
                    const SizedBox(height: 20.0), // Reduced space since nav is now separate
                  ],
                ),
              ),
            ),
            
            // Bottom Navigation - now part of the body instead of bottomNavigationBar
            const BottomNavigation(currentIndex: 0), // Home screen index is 0
          ],
        ),
      ),
    );
  }
}
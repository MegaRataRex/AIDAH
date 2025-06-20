import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/home/header_section.dart';
import '../../widgets/home/courses_section.dart';
import '../../widgets/home/specialists_section.dart';
import '../../widgets/home/community_section.dart';
import '../../widgets/home/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                    
                    const SizedBox(height: 100.0), // Space for bottom nav
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
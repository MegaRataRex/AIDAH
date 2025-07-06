import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'new_user_screen.dart';
import 'existing_users_screen.dart';

class TestEdahScreen extends StatelessWidget {
  const TestEdahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button and title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: AppColors.lightPurple.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryPurple,
                        size: 20.0,
                      ),
                    ),
                  ),
                  // Centered title
                  Expanded(
                    child: const Text(
                      'TEST PREDIAGNÓSTICO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  // Spacer to balance the back button
                  const SizedBox(width: 40.0),
                ],
              ),
            ),
            
            // Main content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Large TEST EDAH title
                    const Text(
                      'TEST PREDIAGNÓSTICO',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    
                    const SizedBox(height: 16.0),
                    
                    // Subtitle
                    const Text(
                      'Realiza el test para un pre-diagnóstico',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.textGray,
                      ),
                    ),
                    
                    const SizedBox(height: 60.0),
                    
                    // Nuevo usuario button
                    SizedBox(
                      width: double.infinity,
                      height: 56.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewUserScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryPurple,
                          foregroundColor: AppColors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Nuevo usuario',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            // Place your custom icon here
                            Image.asset(
                              'assets/icons/user_add.png', // Replace with your icon path
                              width: 20.0,
                              height: 20.0,
                              color: AppColors.white,
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback icon if custom icon doesn't exist
                                return const Icon(
                                  Icons.person_add,
                                  size: 20.0,
                                  color: AppColors.white,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16.0),
                    
                    // Usuario existente button
                    SizedBox(
                      width: double.infinity,
                      height: 56.0,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExistingUsersScreen(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primaryPurple,
                          side: const BorderSide(
                            color: AppColors.primaryPurple,
                            width: 2.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Usuario existente',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            // Place your custom icon here
                            Image.asset(
                              'assets/icons/user_existing.png', // Replace with your icon path
                              width: 20.0,
                              height: 20.0,
                              color: AppColors.primaryPurple,
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback icon if custom icon doesn't exist
                                return const Icon(
                                  Icons.people,
                                  size: 20.0,
                                  color: AppColors.primaryPurple,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
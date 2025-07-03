import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'new_user_screen.dart';
import 'evaluation_history_screen.dart';

class ExistingUsersScreen extends StatefulWidget {
  const ExistingUsersScreen({Key? key}) : super(key: key);

  @override
  State<ExistingUsersScreen> createState() => _ExistingUsersScreenState();
}

class _ExistingUsersScreenState extends State<ExistingUsersScreen> {
  // Sample users data - you can replace this with actual data from your database
  final List<Map<String, dynamic>> _users = [
    {'name': 'Alex', 'color': AppColors.primaryPurple},
    {'name': 'Alejandra', 'color': AppColors.lightTeal},
    {'name': 'Rebeca', 'color': AppColors.lightPurple},
  ];

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
                  children: [
                    const SizedBox(height: 40.0),
                    
                    // Title
                    const Text(
                      'Usuarios',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    
                    const SizedBox(height: 12.0),
                    
                    // Subtitle
                    const Text(
                      'Usuarios guardados que realizaron el test',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.textGray,
                      ),
                    ),
                    
                    const SizedBox(height: 40.0),
                    
                    // Users list
                    Expanded(
                      child: Column(
                        children: [
                          // Existing users
                          ..._users.map((user) => _buildUserButton(
                            user['name'],
                            user['color'],
                            false,
                          )).toList(),
                          
                          const SizedBox(height: 16.0),
                          
                          // Add new user button
                          _buildUserButton('Agregar', AppColors.white, true),
                        ],
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

  Widget _buildUserButton(String name, Color color, bool isAddButton) {
    return Container(
      width: double.infinity,
      height: 56.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        onPressed: () {
          if (isAddButton) {
            // Navigate to new user screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewUserScreen(),
              ),
            );
          } else {
            // Navigate to evaluation history screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EvaluationHistoryScreen(userName: name),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: isAddButton ? AppColors.primaryPurple : AppColors.white,
          elevation: 0,
          side: isAddButton 
            ? const BorderSide(
                color: AppColors.primaryPurple,
                width: 2.0,
              )
            : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: isAddButton ? AppColors.primaryPurple : AppColors.white,
              ),
            ),
            if (isAddButton) ...[
              const SizedBox(width: 12.0),
              // Place your custom icon here
              Image.asset(
                'assets/icons/user_add.png', // Replace with your icon path
                width: 20.0,
                height: 20.0,
                color: AppColors.primaryPurple,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback icon if custom icon doesn't exist
                  return const Icon(
                    Icons.person_add,
                    size: 20.0,
                    color: AppColors.primaryPurple,
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
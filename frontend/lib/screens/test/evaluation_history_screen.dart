import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'test_instructions_screen.dart';

class EvaluationHistoryScreen extends StatefulWidget {
  final String userName;

  const EvaluationHistoryScreen({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  State<EvaluationHistoryScreen> createState() => _EvaluationHistoryScreenState();
}

class _EvaluationHistoryScreenState extends State<EvaluationHistoryScreen> {
  // Sample evaluation history - replace with actual data
  final List<Map<String, dynamic>> _evaluations = [
    {'date': '13/05/2024', 'result': 'Moderado'},
    {'date': '05/12/2024', 'result': 'Alto'},
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40.0),
                    
                    // User name
                    Text(
                      widget.userName,
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    
                    const SizedBox(height: 8.0),
                    
                    // Subtitle
                    const Text(
                      'Historial de evaluaciones',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.textGray,
                      ),
                    ),
                    
                    const SizedBox(height: 40.0),
                    
                    // Evaluations list
                    Expanded(
                      child: Column(
                        children: [
                          // Previous evaluations
                          ..._evaluations.map((evaluation) => 
                            _buildEvaluationItem(evaluation['date'])
                          ).toList(),
                          
                          const SizedBox(height: 16.0),
                          
                          // Add new evaluation button
                          _buildAddButton(),
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

  Widget _buildEvaluationItem(String date) {
    return Container(
      width: double.infinity,
      height: 56.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGray,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: () {
            // Navigate to evaluation details or results
            _showEvaluationDetails(date);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    date,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ),
                // Bookmark icon
                Image.asset(
                  'assets/icons/bookmark.png', // Place your bookmark icon here
                  width: 20.0,
                  height: 20.0,
                  color: AppColors.primaryPurple,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.bookmark,
                      size: 20.0,
                      color: AppColors.primaryPurple,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: double.infinity,
      height: 56.0,
      child: OutlinedButton(
        onPressed: () {
          // Navigate to instructions screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TestInstructionsScreen(userName: widget.userName),
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
              'Agregar',
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
              color: AppColors.primaryPurple,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.add,
                  size: 20.0,
                  color: AppColors.primaryPurple,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEvaluationDetails(String date) {
    // Show evaluation details or navigate to results screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Mostrando evaluación del $date'),
        backgroundColor: AppColors.primaryPurple,
      ),
    );
  }
}
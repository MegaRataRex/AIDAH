import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'test_question_screen.dart';

class TestInstructionsScreen extends StatelessWidget {
  final String userName;

  const TestInstructionsScreen({
    Key? key,
    required this.userName,
  }) : super(key: key);

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
                      'TEST EDAH',
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
                      'Instrucciones',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    
                    const SizedBox(height: 12.0),
                    
                    // Subtitle
                    const Text(
                      'ESTAS A PUNTO DE TOMAR EL TEST EDAH',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGray,
                        letterSpacing: 0.5,
                      ),
                    ),
                    
                    const SizedBox(height: 40.0),
                    
                    // Instructions list
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInstructionItem(
                            '1.-',
                            'Lee cada pregunta cuidadosamente.',
                          ),
                          const SizedBox(height: 24.0),
                          _buildInstructionItem(
                            '2.-',
                            'Responde con la mayor honestidad posible.',
                          ),
                          const SizedBox(height: 24.0),
                          _buildInstructionItem(
                            '3.-',
                            'Evalúa la frecuencia de cada comportamiento',
                          ),
                          const SizedBox(height: 24.0),
                          _buildInstructionItem(
                            '4.-',
                            'No te apresures, toma el tiempo necesario.',
                          ),
                          
                          const SizedBox(height: 40.0),
                          
                          // YOUR CUSTOM IMAGE GOES HERE
                          Expanded(
                            child: Center(
                              child: Container(
                                width: 250.0,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(
                                    'assets/images/test_instructions.png', // 👈 REPLACE WITH YOUR IMAGE PATH
                                    fit: BoxFit.contain, // or BoxFit.cover depending on your image
                                    errorBuilder: (context, error, stackTrace) {
                                      // Fallback illustration if your image doesn't load
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.lightPurple.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            // Person illustration placeholder
                                            Container(
                                              width: 80.0,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                color: AppColors.lightPurple,
                                                borderRadius: BorderRadius.circular(40.0),
                                              ),
                                              child: const Icon(
                                                Icons.person,
                                                size: 40.0,
                                                color: AppColors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 16.0),
                                            // Checklist illustration
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.primaryPurple,
                                                    borderRadius: BorderRadius.circular(4.0),
                                                  ),
                                                  child: const Icon(
                                                    Icons.check,
                                                    size: 14.0,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                                const SizedBox(width: 8.0),
                                                Container(
                                                  width: 60.0,
                                                  height: 3.0,
                                                  color: AppColors.textGray,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8.0),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.primaryPurple,
                                                    borderRadius: BorderRadius.circular(4.0),
                                                  ),
                                                  child: const Icon(
                                                    Icons.check,
                                                    size: 14.0,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                                const SizedBox(width: 8.0),
                                                Container(
                                                  width: 60.0,
                                                  height: 3.0,
                                                  color: AppColors.textGray,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Start button
                    SizedBox(
                      width: double.infinity,
                      height: 56.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestQuestionScreen(userName: userName),
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
                              'Empezar',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            // Arrow icon
                            Image.asset(
                              'assets/icons/arrow_right.png', // Replace with your icon path
                              width: 20.0,
                              height: 20.0,
                              color: AppColors.white,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.arrow_forward,
                                  size: 20.0,
                                  color: AppColors.white,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionItem(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16.0,
              color: AppColors.black,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'test_results_screen.dart';

class TestQuestionScreen extends StatefulWidget {
  final String userName;

  const TestQuestionScreen({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  State<TestQuestionScreen> createState() => _TestQuestionScreenState();
}

class _TestQuestionScreenState extends State<TestQuestionScreen> {
  int currentQuestionIndex = 0;
  int? selectedAnswer;
  List<int> answers = [];

  // Sample questions - replace with actual EDAH test questions
  final List<Map<String, dynamic>> questions = [
    {
      'question': '¿Le cuesta trabajo prestar atención a detalles o comete errores por descuido?',
      'options': ['Nunca', 'Poco', 'Bastante', 'Mucho'],
    },
    {
      'question': '¿Tiene dificultad para mantener la atención en tareas o actividades?',
      'options': ['Nunca', 'Poco', 'Bastante', 'Mucho'],
    },
    {
      'question': '¿Parece no escuchar cuando se le habla directamente?',
      'options': ['Nunca', 'Poco', 'Bastante', 'Mucho'],
    },
    // Add more questions as needed
  ];

  final List<Color> optionColors = [
    AppColors.lightPurple.withOpacity(0.7),
    AppColors.lightTeal,
    AppColors.lightTeal.withOpacity(0.8),
    AppColors.primaryPurple,
  ];

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    
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
                    const SizedBox(height: 60.0),
                    
                    // Question
                    Text(
                      currentQuestion['question'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                        height: 1.4,
                      ),
                    ),
                    
                    const SizedBox(height: 60.0),
                    
                    // Answer options
                    Expanded(
                      child: Column(
                        children: [
                          for (int i = 0; i < currentQuestion['options'].length; i++)
                            _buildAnswerOption(
                              currentQuestion['options'][i],
                              i,
                              optionColors[i],
                            ),
                        ],
                      ),
                    ),
                    
                    // Next button
                    SizedBox(
                      width: double.infinity,
                      height: 56.0,
                      child: OutlinedButton(
                        onPressed: selectedAnswer != null ? _handleNext : null,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: selectedAnswer != null 
                            ? AppColors.primaryPurple 
                            : AppColors.textGray,
                          side: BorderSide(
                            color: selectedAnswer != null 
                              ? AppColors.primaryPurple 
                              : AppColors.textGray,
                            width: 2.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Siguiente',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: selectedAnswer != null 
                                  ? AppColors.primaryPurple 
                                  : AppColors.textGray,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Icon(
                              Icons.arrow_forward,
                              size: 20.0,
                              color: selectedAnswer != null 
                                ? AppColors.primaryPurple 
                                : AppColors.textGray,
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

  Widget _buildAnswerOption(String text, int index, Color color) {
    final isSelected = selectedAnswer == index;
    
    return Container(
      width: double.infinity,
      height: 56.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedAnswer = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: AppColors.white,
          elevation: isSelected ? 4.0 : 0,
          shadowColor: color.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: isSelected 
              ? const BorderSide(color: AppColors.primaryPurple, width: 2.0)
              : BorderSide.none,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _handleNext() {
    if (selectedAnswer == null) return;
    
    // Save the answer
    answers.add(selectedAnswer!);
    
    // Check if this is the last question
    if (currentQuestionIndex < questions.length - 1) {
      // Move to next question
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
    } else {
      // Navigate to results screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TestResultsScreen(
            userName: widget.userName,
            answers: answers,
          ),
        ),
      );
    }
  }
}
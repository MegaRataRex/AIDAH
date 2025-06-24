import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class TestResultsScreen extends StatelessWidget {
  final String userName;
  final List<int> answers;

  const TestResultsScreen({
    Key? key,
    required this.userName,
    required this.answers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate results based on answers
    final results = _calculateResults();
    
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    
                    // Results card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: AppColors.lightGray,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Results header
                          const Text(
                            'Resultados:',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: AppColors.textGray,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Riesgo: ',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: '${results['riskLevel']}.',
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryPurple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Se sugiere evaluación profesional',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: AppColors.textGray,
                            ),
                          ),
                          
                          const SizedBox(height: 24.0),
                          
                          // Category results
                          const Text(
                            'Resultados por categoría:',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          
                          _buildCategoryResult('Inatención', results['inattention']['score'], results['inattention']['level']),
                          _buildCategoryResult('Hiperactividad', results['hyperactivity']['score'], results['hyperactivity']['level']),
                          _buildCategoryResult('Impulsividad', results['impulsivity']['score'], results['impulsivity']['level']),
                          
                          const SizedBox(height: 24.0),
                          
                          // Recommendations
                          const Text(
                            'Recomendaciones:',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          
                          _buildRecommendation('Realizar evaluación psicológica completa.'),
                          _buildRecommendation('Consultar con un profesional de la salud.'),
                          _buildRecommendation('Implementar estrategias de apoyo educativo.'),
                          _buildRecommendation('Considerar terapias de desarrollo.'),
                          
                          const SizedBox(height: 24.0),
                          
                          // Save message
                          const Center(
                            child: Text(
                              'Se guardó tu resultado en tu perfil',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: AppColors.textGray,
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 16.0),
                          
                          // Action buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildActionButton('Descargar', Icons.download, () => _downloadResults()),
                              _buildActionButton('Compartir', Icons.share, () => _shareResults()),
                              _buildActionButton('Repetir', Icons.refresh, () => _repeatTest(context)),
                              _buildActionButton('Eliminar', Icons.delete, () => _deleteResults()),
                            ],
                          ),
                        ],
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

  Widget _buildCategoryResult(String category, int score, String level) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              category,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '$score Puntos',
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.textGray,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              level,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendation(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4.0,
            height: 4.0,
            margin: const EdgeInsets.only(top: 8.0, right: 8.0),
            decoration: const BoxDecoration(
              color: AppColors.primaryPurple,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.black,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: AppColors.lightPurple.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(
              icon,
              size: 20.0,
              color: AppColors.primaryPurple,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10.0,
              color: AppColors.textGray,
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _calculateResults() {
    // Simple calculation based on answers
    // Replace with actual EDAH scoring algorithm
    int totalScore = answers.fold(0, (sum, answer) => sum + answer);
    
    return {
      'riskLevel': totalScore > 6 ? 'Moderado' : 'Bajo',
      'inattention': {'score': 25, 'level': 'Alto'},
      'hyperactivity': {'score': 23, 'level': 'Moderado'},
      'impulsivity': {'score': 24, 'level': 'Moderado'},
    };
  }

  void _downloadResults() {
    print('Downloading results...');
  }

  void _shareResults() {
    print('Sharing results...');
  }

  void _repeatTest(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  void _deleteResults() {
    print('Deleting results...');
  }
}
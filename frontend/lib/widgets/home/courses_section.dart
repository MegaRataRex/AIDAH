import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header with custom arrow
        Row(
          children: [
            const Text(
              'Cursos en proceso',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const SizedBox(width: 8.0),
            Image.asset(
              'assets/icons/arrow_right.png', // Your custom arrow icon
              width: 20.0,
              height: 20.0,
            ),
          ],
        ),
        
        const SizedBox(height: 16.0),
        
        // Course content - separate image and title
        GestureDetector(
          onTap: () {
            // TODO: Navigate to course details
            print('Course tapped');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course image - standalone with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/emotional_education.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Icon(
                          Icons.image,
                          size: 50.0,
                          color: AppColors.textGray,
                        ),
                      );
                    },
                  ),
                ),
              ),
              
              const SizedBox(height: 12.0),
              
              // Course title - separate from image
              const Text(
                'Estrategias de educación emocional',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
        
        // Add divider line
        const SizedBox(height: 24.0),
        Container(
          height: 1.0,
          color: AppColors.lightGray,
        ),
      ],
    );
  }
}
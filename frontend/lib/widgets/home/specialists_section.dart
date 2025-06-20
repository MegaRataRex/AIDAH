import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class SpecialistsSection extends StatelessWidget {
  const SpecialistsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header with custom arrow
        Row(
          children: [
            const Text(
              'Directorio de especialistas',
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
        
        const SizedBox(height: 8.0),
        
        // Subtitle
        const Text(
          'Conoce a todos los profesionales dispuestos a ayudarte',
          style: TextStyle(
            fontSize: 14.0,
            color: AppColors.textGray,
          ),
        ),
        
        const SizedBox(height: 16.0),
        
        // Horizontal carousel
        SizedBox(
          height: 320.0, // Increased height for new design
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _specialists.length,
            itemBuilder: (context, index) {
              final specialist = _specialists[index];
              return Container(
                width: 200.0,
                margin: const EdgeInsets.only(right: 16.0),
                child: _buildSpecialistCard(specialist),
              );
            },
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

  Widget _buildSpecialistCard(Map<String, String> specialist) {
    return Column(
      children: [
        // Profile image - circular and standalone
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightGray,
          ),
          child: ClipOval(
            child: Image.asset(
              specialist['image']!,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightTeal.withOpacity(0.3),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 50.0,
                    color: AppColors.primaryPurple,
                  ),
                );
              },
            ),
          ),
        ),
        
        const SizedBox(height: 12.0),
        
        // Information box - light gray background with left-aligned text
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Left-aligned text
              children: [
                // Profession - purple color
                Text(
                  specialist['profession']!,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryPurple,
                  ),
                ),
                
                const SizedBox(height: 6.0),
                
                // Name and age - light color
                Text(
                  specialist['name']!,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textGray,
                  ),
                ),
                
                const SizedBox(height: 8.0),
                
                // Description - dark color
                Expanded(
                  child: Text(
                    specialist['description']!,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: AppColors.black,
                      height: 1.3,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Sample data - replace with your actual data
  static final List<Map<String, String>> _specialists = [
    {
      'image': 'assets/images/psychologist1.png',
      'profession': 'Psicólogo especialista en pedagogía',
      'name': 'Luis - 35 años',
      'description': 'Estoy aquí para ayudarte! contactame sin compromiso',
    },
    {
      'image': 'assets/images/nutritionist1.png',
      'profession': 'Nutricionista en Trastorno de Déficit Atención y TEA',
      'name': 'Fernanda - 27 años',
      'description': 'Estoy aquí para ayudarte! contactame sin compromiso',
    },
    {
      'image': 'assets/images/psychologist1.png',
      'profession': 'Psicólogo especialista en pedagogía',
      'name': 'Luis - 35 años',
      'description': 'Estoy aquí para ayudarte! contactame sin compromiso',
    },
  ];
}
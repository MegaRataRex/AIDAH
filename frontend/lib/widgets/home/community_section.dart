import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CommunitySection extends StatelessWidget {
  const CommunitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        const Text(
          'Comunidad',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        
        const SizedBox(height: 16.0),
        
        // Horizontal carousel of posts - removed fixed height
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Align posts to top
            children: _communityPosts.asMap().entries.map((entry) {
              final post = entry.value;
              return Container(
                width: 280.0,
                margin: const EdgeInsets.only(right: 16.0),
                child: _buildCommunityPost(post),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCommunityPost(Map<String, String> post) {
    return IntrinsicHeight( // This makes the container fit its content
      child: Container(
        width: 280.0,
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: AppColors.lightGray,
            width: 1.0,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Take minimum space needed
          children: [
            // User info row
            Row(
              children: [
                // Profile image with fallback
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightGray,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      post['userImage']!,
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback when image fails to load
                        return Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lightTeal.withOpacity(0.3),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 20.0,
                            color: AppColors.primaryPurple,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                const SizedBox(width: 12.0),
                
                // User details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            post['userName']!,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Flexible(
                            child: Text(
                              post['userHandle']!,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: AppColors.lightPurple,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        post['date']!,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: AppColors.textGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12.0),
            
            // Post content - now expands to fit all content
            Text(
              post['content']!,
              style: const TextStyle(
                fontSize: 13.0,
                color: AppColors.black,
                height: 1.4,
              ),
              // Removed maxLines and overflow restrictions to show all content
            ),
          ],
        ),
      ),
    );
  }

  // Sample community posts data
  static final List<Map<String, String>> _communityPosts = [
    {
      'userImage': 'assets/images/laura.png',
      'userName': 'Laura',
      'userHandle': '@lauraproudmom',
      'date': '5 de Junio - Hace 2 horas',
      'content': '¡Hola a todos! Quería compartir algo que me ha funcionado mucho con mi hijo últimamente. Empezamos a implementar una rutina muy clara para las mañanas y horarios muy claros) y ha sido un cambio total 🙌 Antes batallámos mucho con las transiciones, como pasar del juego a tareas, y ahora todo fluye mejor. ¿Alguien más ha probado este tipo de herramientas? Me encantaría saber qué les ha servido en casa. 💛 #TDAH #TipsDeMamá #Rutinas #ApoyoFamiliar',
    },
    {
      'userImage': 'assets/images/psychologist1.png',
      'userName': 'Luis',
      'userHandle': '@luispapadh',
      'date': '5 de Junio',
      'content': 'Una rutina clara puede ayudar mucho. Nosotros incluyan horarios y actividades durante las comidas generan resultados. Si tienen dudas, aquí estamos para apoyarles. 🙏 #TDAH #Rutinas',
    },
  ];
}
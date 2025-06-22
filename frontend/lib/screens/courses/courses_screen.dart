import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/home/bottom_navigation.dart';
import '../../widgets/home/header_section.dart';
import '../../widgets/home/side_drawer.dart'; // Add this import

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // Add the side drawer to match home screen
      endDrawer: const SideDrawer(),
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
                    
                    // Header Section - now matches home screen exactly
                    const HeaderSection(userName: 'Maria'),
                    
                    const SizedBox(height: 24.0), // Match home screen spacing
                    
                    // Search bar
                    _buildSearchBar(),
                    
                    const SizedBox(height: 20.0),
                    
                    // Cursos en proceso section
                    _buildCoursesInProgressSection(),
                    
                    const SizedBox(height: 32.0),
                    
                    // Cursos en tendencia section
                    _buildTrendingCoursesSection(),
                    
                    const SizedBox(height: 32.0),
                    
                    // Artículos interesantes section
                    _buildInterestingArticlesSection(),
                    
                    const SizedBox(height: 20.0), // Match home screen spacing
                  ],
                ),
              ),
            ),
            
            // Bottom Navigation - matches home screen structure
            const BottomNavigation(currentIndex: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0), // Align with header padding
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: AppColors.lightGray,
          width: 1.0,
        ),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Buscar cursos...',
          hintStyle: const TextStyle(
            fontSize: 14.0,
            color: AppColors.textGray,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              'assets/icons/search.png',
              width: 20.0,
              height: 20.0,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
        ),
        onChanged: (value) {
          print('Searching for: $value');
        },
        onSubmitted: (value) {
          print('Search submitted: $value');
        },
      ),
    );
  }

  Widget _buildCoursesInProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header with arrow on the left
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0), // Align with header
          child: Row(
            children: [
              const Text(
                'Cursos en proceso',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              const SizedBox(width: 8.0), // Space between text and arrow
              Image.asset(
                'assets/icons/arrow_right.png',
                width: 32.0,
                height: 32.0,
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16.0),
        
        // Courses carousel
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 4.0), // Align with header
            itemCount: _getCoursesInProgress().length,
            itemBuilder: (context, index) {
              final course = _getCoursesInProgress()[index];
              return _buildCourseCard(course);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingCoursesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header with arrow on the left
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0), // Align with header
          child: Row(
            children: [
              const Text(
                'Cursos en tendencia',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              const SizedBox(width: 8.0), // Space between text and arrow
              Image.asset(
                'assets/icons/arrow_right.png',
                width: 32.0,
                height: 32.0,
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16.0),
        
        // Trending courses carousel
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 4.0), // Align with header
            itemCount: _getTrendingCourses().length,
            itemBuilder: (context, index) {
              final course = _getTrendingCourses()[index];
              return _buildCourseCard(course);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInterestingArticlesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header with arrow on the left
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0), // Align with header
          child: Row(
            children: [
              const Text(
                'Artículos interesantes',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              const SizedBox(width: 8.0), // Space between text and arrow
              Image.asset(
                'assets/icons/arrow_right.png',
                width: 32.0,
                height: 32.0,
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16.0),
        
        // Articles carousel - simplified with wider cards and no expansion
        SizedBox(
          height: 380.0, // Reduced height since no expansion needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 4.0), // Align with header
            itemCount: _getInterestingArticles().length,
            itemBuilder: (context, index) {
              final article = _getInterestingArticles()[index];
              return _buildArticleCard(article);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCourseCard(Map<String, dynamic> course) {
    return Container(
      width: 160.0,
      margin: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course image with tags
          Container(
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              // Add actual image with gradient fallback
              image: course['image'] != null 
                ? DecorationImage(
                    image: AssetImage(course['image']),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      // If image fails to load, the gradient will show
                    },
                  )
                : null,
              // Gradient fallback
              gradient: course['image'] == null 
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.lightGray,
                      AppColors.lightGray.withOpacity(0.8),
                    ],
                  )
                : null,
            ),
            child: Stack(
              children: [
                // Overlay gradient (always present for better text readability)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
                // Tags
                Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: Wrap(
                    spacing: 4.0,
                    children: (course['tags'] as List<Map<String, dynamic>>)
                        .map((tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                color: tag['color'],
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                tag['text'],
                                style: const TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 8.0),
          
          // Course title
          Text(
            course['title'],
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryPurple,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          
          const SizedBox(height: 4.0),
          
          // Course duration
          Text(
            course['duration'],
            style: const TextStyle(
              fontSize: 12.0,
              color: AppColors.lightPurple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(Map<String, dynamic> article) {
    return Container(
      width: 280.0, // Fixed expanded width for all articles
      height: 360.0, // Fixed height
      margin: const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Article preview with lines (simulating text content)
          Container(
            height: 100.0,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              color: AppColors.lightGray.withOpacity(0.1),
            ),
            child: Column(
              children: [
                // Simulate text lines
                for (int i = 0; i < 6; i++) ...[
                  Container(
                    height: 2.0,
                    width: i == 5 ? 100.0 : double.infinity, // Last line shorter
                    decoration: BoxDecoration(
                      color: AppColors.textGray.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(1.0),
                    ),
                  ),
                  if (i < 5) const SizedBox(height: 8.0),
                ],
              ],
            ),
          ),
          
          // Article content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Author info
                  Row(
                    children: [
                      // Use actual profile image instead of purple circle
                      CircleAvatar(
                        radius: 14.0,
                        backgroundImage: article['authorImage'] != null 
                          ? AssetImage(article['authorImage'])
                          : null,
                        backgroundColor: AppColors.lightPurple, // Fallback color
                        child: article['authorImage'] == null 
                          ? const Icon(
                              Icons.person,
                              size: 16.0,
                              color: AppColors.white,
                            )
                          : null,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article['authorName'],
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // Profession with icons aligned to the left
                            Row(
                              children: [
                                Text(
                                  article['authorProfession'],
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    color: AppColors.primaryPurple,
                                  ),
                                ),
                                const SizedBox(width: 6.0), // Space between text and icons
                                // Custom icons instead of purple squares
                                Image.asset(
                                  'assets/icons/crown.png', // Replace with your icon
                                  width: 12.0,
                                  height: 12.0,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Fallback to colored container if icon doesn't exist
                                    return Container(
                                      width: 12.0,
                                      height: 12.0,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightPurple,
                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(width: 2.0),
                                Image.asset(
                                  'assets/icons/verified.png', // Replace with your icon
                                  width: 12.0,
                                  height: 12.0,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Fallback to colored container if icon doesn't exist
                                    return Container(
                                      width: 12.0,
                                      height: 12.0,
                                      decoration: BoxDecoration(
                                        color: AppColors.lighterPurple,
                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 12.0),
                  
                  // Article title
                  Text(
                    article['title'],
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryPurple,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8.0),
                  
                  // Article description - now with more space and scrollable
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        article['description'],
                        style: const TextStyle(
                          fontSize: 11.0,
                          color: AppColors.black,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 12.0),
                  
                  // Page count
                  Text(
                    '${article['pages']} páginas',
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sample data methods - updated with actual image paths
  List<Map<String, dynamic>> _getCoursesInProgress() {
    return [
      {
        'image': 'assets/images/emotional_education.png', // Your actual image
        'title': 'Estrategias de educación emocional',
        'duration': '3:00 hrs',
        'tags': [
          {'text': 'Bienestar', 'color': AppColors.lightTeal},
          {'text': 'Crianza', 'color': AppColors.primaryPurple},
        ],
      },
      {
        'image': 'assets/images/cognitive_development.png', // Your actual image
        'title': 'Técnicas de desarrollo cognitivo para infantes con TDAH',
        'duration': '2:30 hrs',
        'tags': [
          {'text': 'Apoyo', 'color': AppColors.primaryPurple},
        ],
      },
    ];
  }

  List<Map<String, dynamic>> _getTrendingCourses() {
    return [
      {
        'image': 'assets/images/social_skills.png', // Your actual image
        'title': 'Actividades para desarrollar las capacidades sociales',
        'duration': '50 minutos',
        'tags': [
          {'text': 'Bienestar', 'color': AppColors.primaryPurple},
        ],
      },
      {
        'image': 'assets/images/brain_understanding.png', // Your actual image
        'title': 'Cerebros Únicos: Entendiendo el TDAH desde Casa',
        'duration': '2:00 hrs',
        'tags': [
          {'text': 'Apoyo', 'color': AppColors.primaryPurple},
        ],
      },
    ];
  }

  List<Map<String, dynamic>> _getInterestingArticles() {
    return [
      {
        'authorImage': 'assets/images/psychologist1.png', // Your actual profile image
        'authorName': 'Luis Hernandez Salazar',
        'authorProfession': 'Maestro en pedagogía',
        'title': 'Como funciona el cerebro de un niño con TDAH',
        'description': 'En este artículo exploraremos el cerebro de un infante neurodivergente para poder entender su comportamiento desde la raíz. Analizaremos las diferencias neurológicas, los patrones de pensamiento únicos y cómo estos afectan el aprendizaje y la conducta diaria. También veremos estrategias específicas para trabajar con estos niños de manera efectiva.',
        'pages': 50,
      },
      {
        'authorImage': 'assets/images/psychologist1.png', // Your actual profile image
        'authorName': 'Maria Rodriguez',
        'authorProfession': 'Terapeuta infantil',
        'title': 'Estrategias efectivas para el manejo del TDAH',
        'description': 'Descubre técnicas probadas para ayudar a niños con TDAH a desarrollar mejores hábitos de concentración y autocontrol. Incluye ejercicios prácticos, rutinas diarias y consejos para padres y educadores. Este artículo proporciona herramientas concretas que pueden implementarse inmediatamente.',
        'pages': 35,
      },
      {
        'authorImage': 'assets/images/psychologist1.png', // Your actual profile image
        'authorName': 'Carlos Martinez',
        'authorProfession': 'Psicólogo clínico',
        'title': 'Actividades para mejorar la concentración',
        'description': 'Una guía práctica con ejercicios y juegos diseñados específicamente para fortalecer la atención en niños. Cada actividad está respaldada por investigación científica y adaptada para diferentes edades. Incluye instrucciones paso a paso y variaciones para mantener el interés.',
        'pages': 42,
      },
    ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
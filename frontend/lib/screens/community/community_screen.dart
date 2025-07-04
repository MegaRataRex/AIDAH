import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/home/bottom_navigation.dart';
import '../../widgets/home/side_drawer.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      endDrawer: const SideDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    
                    // Header with back arrow and centered title
                    _buildHeader(),
                    
                    const SizedBox(height: 24.0),
                    
                    // Search bar
                    _buildSearchBar(),
                    
                    const SizedBox(height: 24.0),
                    
                    // Trending discussions section with separator line
                    _buildTrendingSection(),
                    
                    const SizedBox(height: 32.0),
                    
                    // Community posts
                    _buildCommunityPosts(),
                    
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
            const BottomNavigation(currentIndex: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // Add Expanded to center the title
        Expanded(
          child: Center(
            child: const Text(
              'Comunidad',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ),
        ),
        // Add invisible container to balance the back arrow
        Container(width: 40.0), // Same width as back arrow container
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
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
          hintText: 'Buscar en la comunidad...',
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
      ),
    );
  }

  Widget _buildTrendingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Discusiones en tendencia',
          style: TextStyle(
            fontSize: 16.0,
            fontStyle: FontStyle.italic,
            color: AppColors.textGray,
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            // Trending hashtags
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHashtagItem('#1. - TipsDeMamá', AppColors.lightTeal),
                  const SizedBox(height: 8.0),
                  _buildHashtagItem('#2. - ApoyoFamiliar', AppColors.lightPurple),
                  const SizedBox(height: 8.0),
                  _buildHashtagItem('#3. - ApoyoProfesional', AppColors.black),
                ],
              ),
            ),
            // Illustration
            Expanded(
              flex: 1,
              child: Container(
                height: 120.0,
                child: Image.asset(
                  'assets/images/community_illustration.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Icon(
                        Icons.image,
                        size: 40.0,
                        color: AppColors.textGray,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        // Add separator line
        const SizedBox(height: 24.0),
        Container(
          height: 1.0,
          color: AppColors.lightGray,
        ),
        const SizedBox(height: 8.0), // Adjust spacing after line
      ],
    );
  }

  Widget _buildHashtagItem(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  Widget _buildCommunityPosts() {
    return Column(
      children: _getCommunityPosts().map((post) => 
        Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: _buildPostCard(post),
        )
      ).toList(),
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add PUBLICIDAD label for sponsored posts
          if (post['isSponsored'] == true) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Text(
                'PUBLICIDAD',
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
          ],
          // User info row
          Row(
            children: [
              // Profile image
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
                      return Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lightTeal.withOpacity(0.3),
                        ),
                        child: const Icon(
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
                        Text(
                          post['userHandle']!,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: AppColors.lightPurple,
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
              // Three dots menu
              GestureDetector(
                onTap: () {
                  // Handle menu tap
                },
                child: Image.asset(
                  'assets/icons/three_dots.png',
                  width: 20.0,
                  height: 20.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          // Post content
          Text(
            post['content']!,
            style: const TextStyle(
              fontSize: 13.0,
              color: AppColors.black,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12.0),
          // Action buttons row with correct icons
          Row(
            children: [
              _buildActionButton('assets/icons/heart.png', post['likes'], 'like'),
              const SizedBox(width: 16.0),
              _buildActionButton('assets/icons/comment.png', post['comments'], 'comment'),
              const SizedBox(width: 16.0),
              _buildActionButton('assets/icons/share.png', '', 'share'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String iconPath, String count, String type) {
    return GestureDetector(
      onTap: () {
        // Handle different action types
        switch (type) {
          case 'like':
            print('Like tapped');
            break;
          case 'comment':
            print('Comment tapped');
            break;
          case 'share':
            print('Share tapped');
            break;
        }
      },
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 16.0,
            height: 16.0,
            errorBuilder: (context, error, stackTrace) {
              // Fallback icons based on type
              IconData fallbackIcon;
              switch (type) {
                case 'like':
                  fallbackIcon = Icons.favorite_border;
                  break;
                case 'comment':
                  fallbackIcon = Icons.chat_bubble_outline;
                  break;
                case 'share':
                  fallbackIcon = Icons.share_outlined;
                  break;
                default:
                  fallbackIcon = Icons.help_outline;
              }
              return Icon(
                fallbackIcon,
                size: 16.0,
                color: AppColors.textGray,
              );
            },
          ),
          if (count.isNotEmpty) ...[
            const SizedBox(width: 4.0),
            Text(
              count,
              style: const TextStyle(
                fontSize: 12.0,
                color: AppColors.textGray,
              ),
            ),
          ],
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getCommunityPosts() {
    return [
      {
        'userImage': 'assets/images/laura.png',
        'userName': 'Laura',
        'userHandle': '@lauraproudmom',
        'date': '5 de Junio - Hace 2 horas',
        'content': '¡Hola a todos! Quería compartir algo que me ha funcionado mucho con mi hijo últimamente. Empezamos a implementar una rutina muy clara para las mañanas y horarios muy claros) y ha sido un cambio total 🙌 Antes batallámos mucho con las transiciones, como pasar del juego a tareas, y ahora todo fluye mejor. ¿Alguien más ha probado este tipo de herramientas? Me encantaría saber qué les ha servido en casa. 💛 #TDAH #TipsDeMamá #Rutinas #ApoyoFamiliar',
        'likes': '12',
        'comments': '5',
        'isSponsored': false,
      },
      {
        'userImage': 'assets/images/psychologist1.png',
        'userName': 'Luis',
        'userHandle': '@luispapadh',
        'date': '3 de Junio',
        'content': 'Una rutina clara y consistente puede ayudar muchísimo a niños con TDAH. Incluyan horarios fijos y pausas activas durante tareas. Pequeños cambios generan grandes resultados. Si tienen dudas, estoy aquí para apoyarles. 🙏 #TDAH #Rutinas #ApoyoProfesional',
        'likes': '8',
        'comments': '3',
        'isSponsored': false,
      },
      {
        'userImage': 'assets/images/kumon_logo.png',
        'userName': 'KUMON',
        'userHandle': '@kumonoficial',
        'date': '5 de Junio',
        'content': 'AGENDA TU CITA EN KUMON, YA! YA! YA! PORFAVOR.\n\nPROGRAMAS DE MATEMÁTICAS, LECTURA E INGLÉS',
        'likes': '2',
        'comments': '1',
        'isSponsored': true, // This makes the PUBLICIDAD label appear
      },
    ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
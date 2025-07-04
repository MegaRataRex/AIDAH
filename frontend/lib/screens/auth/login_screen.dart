import 'package:flutter/material.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/social_login_button.dart';
import '../../utils/colors.dart';
import 'register_screen.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // Top section with pattern and bird - more compact
                    Flexible(
                      flex: 5,
                      child: Container(
                        height: screenHeight * 0.45, // Fixed height as percentage
                        child: Stack(
                          children: [
                            // Pattern in top left corner
                           
                            // Bird illustration centered
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 70),
                                child: Image.asset(
                                  'assets/images/bird.png', // Your hummingbird image
                                  width: screenWidth * 0.55, // Slightly smaller
                                  height: screenWidth * 0.55,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Welcome text - reduced spacing
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0), // Reduced margin
                      child: const Text(
                        '¡Bienvenid@!',
                        style: TextStyle(
                          fontSize: 26.0, // Slightly smaller
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryPurple,
                        ),
                      ),
                    ),
                    
                    // Form section - compact spacing
                    Flexible(
                      flex: 4,
                      child: Column(
                        children: [
                          // Email field
                          CustomTextField(
                            hintText: 'Correo',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          
                          // Password field
                          CustomTextField(
                            hintText: 'Contraseña',
                            controller: _passwordController,
                            isPassword: true,
                          ),
                          
                          const SizedBox(height: 12.0), // Reduced spacing
                          
                          // Continue button
                          CustomButton(
                            text: 'Continuar',
                            onPressed: () {
                              // Navigate to home screen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                              
                              // TODO: Add actual login validation when backend is ready
                            },
                          ),
                          
                          const SizedBox(height: 16.0), // Reduced spacing
                          
                          // Social login buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialLoginButton(
                                iconPath: 'assets/icons/apple.png',
                                onPressed: () {
                                  // TODO: Implement Apple login
                                  print('Apple login pressed');
                                },
                              ),
                              SocialLoginButton(
                                iconPath: 'assets/icons/email.png',
                                onPressed: () {
                                  // TODO: Implement email login
                                  print('Email login pressed');
                                },
                              ),
                              SocialLoginButton(
                                iconPath: 'assets/icons/google.png',
                                onPressed: () {
                                  // TODO: Implement Google login
                                  print('Google login pressed');
                                },
                              ),
                            ],
                          ),
                          
                          const Spacer(), // Flexible spacing
                          
                          // Register link
                          Container(
                            margin: const EdgeInsets.only(bottom: 16.0), // Reduced margin
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '¿No tienes cuenta? ',
                                  style: TextStyle(
                                    color: AppColors.textGray,
                                    fontSize: 14.0,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Navigate to register screen
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const RegisterScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Registrate',
                                    style: TextStyle(
                                      color: AppColors.primaryPurple,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
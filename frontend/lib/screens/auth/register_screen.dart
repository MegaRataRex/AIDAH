import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _acceptTerms = false;

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
                    const SizedBox(height: 40.0),
                    
                    // Bird illustration
                    Container(
                      height: screenHeight * 0.25,
                      child: Image.asset(
                        'assets/images/bird.png', // Your hummingbird image
                        width: screenWidth * 0.5,
                        height: screenWidth * 0.5,
                        fit: BoxFit.contain,
                      ),
                    ),
                    
                    const SizedBox(height: 20.0),
                    
                    // Register title
                    const Text(
                      'Registrate',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    
                    const SizedBox(height: 30.0),
                    
                    // Continue with subtitle
                    const Text(
                      'Continuar con',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.textGray,
                      ),
                    ),
                    
                    const SizedBox(height: 24.0),
                    
                    // Google button
                    _buildSocialButton(
                      iconPath: 'assets/icons/google.png',
                      text: 'Google',
                      onPressed: () {
                        // TODO: Implement Google registration
                        print('Google registration pressed');
                      },
                    ),
                    
                    const SizedBox(height: 12.0),
                    
                    // Apple button
                    _buildSocialButton(
                      iconPath: 'assets/icons/apple.png',
                      text: 'Apple',
                      onPressed: () {
                        // TODO: Implement Apple registration
                        print('Apple registration pressed');
                      },
                    ),
                    
                    const SizedBox(height: 12.0),
                    
                    // Email button
                    _buildSocialButton(
                      iconPath: 'assets/icons/email.png',
                      text: 'Email',
                      onPressed: () {
                        // TODO: Implement Email registration
                        print('Email registration pressed');
                      },
                    ),
                    
                    const SizedBox(height: 24.0),
                    
                    // Terms and conditions checkbox
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _acceptTerms,
                          onChanged: (bool? value) {
                            setState(() {
                              _acceptTerms = value ?? false;
                            });
                          },
                          activeColor: AppColors.primaryPurple,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _acceptTerms = !_acceptTerms;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Al registrarme acepto los Términos y condiciones',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: AppColors.textGray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const Spacer(),
                    
                    // Login link
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '¿Ya tienes cuenta? ',
                            style: TextStyle(
                              color: AppColors.textGray,
                              fontSize: 16.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                color: AppColors.primaryPurple,
                                fontSize: 16.0,
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
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String iconPath,
    required String text,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _acceptTerms ? onPressed : null, // Only enabled if terms accepted
        style: ElevatedButton.styleFrom(
          backgroundColor: _acceptTerms ? AppColors.primaryPurple : AppColors.textGray,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          elevation: 0,
        ),
        child: Row(
          children: [
            const SizedBox(width: 20.0),
            Image.asset(
              iconPath,
              width: 24.0,
              height: 24.0,
              color: AppColors.white, // This will make your icons white
              fit: BoxFit.contain,
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 44.0), // Balance the icon space
          ],
        ),
      ),
    );
  }
}
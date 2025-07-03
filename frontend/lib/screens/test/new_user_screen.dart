import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class NewUserScreen extends StatefulWidget {
  const NewUserScreen({Key? key}) : super(key: key);

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();

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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40.0),
                    
                    // Title
                    const Text(
                      'Registra un nuevo usuario',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    
                    const SizedBox(height: 12.0),
                    
                    // Subtitle
                    const Text(
                      'Llena la siguiente información con la información de el infante que realizará el test',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.textGray,
                        height: 1.4,
                      ),
                    ),
                    
                    const SizedBox(height: 40.0),
                    
                    // Nombre field
                    const Text(
                      'Nombre',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _buildTextField(_nameController, 'Nombre'),
                    
                    const SizedBox(height: 24.0),
                    
                    // Genero field
                    const Text(
                      'Genero',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _buildTextField(_genderController, 'Genero'),
                    
                    const SizedBox(height: 24.0),
                    
                    // Fecha de nacimiento field
                    const Text(
                      'Fecha de nacimiento',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _buildTextField(_birthDateController, 'Fecha de nacimiento'),
                    
                    const SizedBox(height: 24.0),
                    
                    // Relacion con la cuenta field
                    const Text(
                      'Relacion con la cuenta',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _buildTextField(_relationController, 'Relacion con la cuenta'),
                    
                    const SizedBox(height: 40.0),
                    
                    // Registrar button
                    SizedBox(
                      width: double.infinity,
                      height: 56.0,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle registration logic here
                          _handleRegistration();
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
                              'Registrar',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            // Place your custom icon here
                            Image.asset(
                              'assets/icons/user_check.png', // Replace with your icon path
                              width: 20.0,
                              height: 20.0,
                              color: AppColors.white,
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback icon if custom icon doesn't exist
                                return const Icon(
                                  Icons.check,
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

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: AppColors.lightGray,
          width: 1.5,
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: AppColors.textGray,
            fontSize: 14.0,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
        ),
      ),
    );
  }

  void _handleRegistration() {
    // Add your registration logic here
    print('Name: ${_nameController.text}');
    print('Gender: ${_genderController.text}');
    print('Birth Date: ${_birthDateController.text}');
    print('Relation: ${_relationController.text}');
    
    // For now, just show a success message and go back
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Usuario registrado exitosamente'),
        backgroundColor: AppColors.primaryPurple,
      ),
    );
    
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _birthDateController.dispose();
    _relationController.dispose();
    super.dispose();
  }
}
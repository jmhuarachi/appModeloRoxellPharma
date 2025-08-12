// lib/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/costants/app_colors.dart';
import 'package:flutter_application_1/screens/admin/dashboard_screen.dart';
import 'package:flutter_application_1/screens/auth/widgets/password_field.dart';
import 'package:flutter_application_1/screens/auth/widgets/custom_text_field.dart';
import 'package:flutter_application_1/widgets/loading_button.dart';
import 'package:flutter_application_1/screens/auth/widgets/company_logo.dart';
import 'package:flutter_application_1/screens/auth/widgets/decorative_graphics.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;
  String? _selectedBranch;
  List<String> branches = ['La Paz', 'Santa Cruz', 'Cochabamba'];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.orange100,
                  AppColors.orange200,
                  AppColors.orange300,
                ],
              ),
            ),
          ),
          
          const TopLeftGraphic(),
          const BottomRightGraphic(),
          
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CompanyLogo(),
                  const SizedBox(height: 40),
                  
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(25),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          if (branches.length > 1) ...[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Sucursal',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.gray700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                DropdownButtonFormField<String>(
                                  value: _selectedBranch ?? branches.first,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.home_outlined,
                                      size: 20,
                                      color: AppColors.gray400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: AppColors.orange500,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 14,
                                    ),
                                  ),
                                  items: branches.map((branch) {
                                    return DropdownMenuItem(
                                      value: branch,
                                      child: Text(branch),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedBranch = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                          ],
                          
                          CustomTextField(
                            controller: _emailController,
                            label: 'Correo Electrónico',
                            placeholder: 'admin@ejemplo.com',
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                          
                          PasswordField(
                            controller: _passwordController,
                            label: 'Contraseña',
                          ),
                          const SizedBox(height: 16),
                          
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                                activeColor: AppColors.orange600,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const Text(
                                'Recordarme',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.gray700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          
                          LoadingButton(
                            isLoading: _isLoading,
                            text: 'Iniciar Sesión',
                            onPressed: _submit,
                          ),
                          const SizedBox(height: 24),
                          
                          TextButton(
                            onPressed: () {},
                            child: RichText(
                              text: const TextSpan(
                                text: '¿No tienes cuenta? ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.gray600,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Regístrate aquí',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.orange600,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
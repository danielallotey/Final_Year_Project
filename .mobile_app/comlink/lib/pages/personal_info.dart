import 'package:flutter/material.dart';
import './biz_info_step1.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _navigateToNextStep() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const BizInfoStep1(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOutExpo;
            final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
    bool obscureText = false,
    VoidCallback? onToggleObscure,
    bool showToggle = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.black54,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: const BorderSide(color: Color(0xff707070)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: const BorderSide(color: Color(0xff707070)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: const BorderSide(color: Color(0xff3583bd), width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          suffixIcon: showToggle
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: onToggleObscure,
          )
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3583bd),
      body: SafeArea(
        child: Column(
          children: [
          // Back Top Bar - Simple implementation if BackTopBar component fails
          Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              const Expanded(
                child: Text(
                  'Personal Information',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 48), // Balance the back button
            ],
          ),
        ),

        // Main Content
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9.0),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                const Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    'Personal Information',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color(0xff3583bd),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.36,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Form
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildInputField(
                            label: 'Full Name',
                            controller: _fullNameController,
                            validator: (value) => _validateRequired(value, 'Full name'),
                            keyboardType: TextInputType.name,
                          ),

                          _buildInputField(
                            label: 'Phone',
                            controller: _phoneController,
                            validator: _validatePhone,
                            keyboardType: TextInputType.phone,
                          ),

                          _buildInputField(
                            label: 'Email Address',
                            controller: _emailController,
                            validator: _validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),

                          _buildInputField(
                            label: 'Password',
                            controller: _passwordController,
                            validator: _validatePassword,
                            obscureText: _obscurePassword,
                            showToggle: true,
                            onToggleObscure: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),

                          _buildInputField(
                            label: 'Confirm Password',
                            controller: _confirmPasswordController,
                            validator: _validateConfirmPassword,
                            obscureText: _obscureConfirmPassword,
                            showToggle: true,
                            onToggleObscure: () {
                              setState(() {
                                _obscureConfirmPassword = !_obscureConfirmPassword;
                              });
                            },
                          ),

                          const SizedBox(height: 30),

                          // Next Button
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: _navigateToNextStep,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xfff64743),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  side: const BorderSide(
                                    width: 1.0,
                                    color: Color(0xff707070),
                                  ),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  letterSpacing: 1.12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
          ]),
    ),
    );
  }
}
import 'package:flutter/material.dart';
import './step2.dart';
import '../components/back_top_bar.dart';

class BizInfoStep1 extends StatefulWidget {
  const BizInfoStep1({super.key});

  @override
  State<BizInfoStep1> createState() => _BizInfoStep1State();
}

class _BizInfoStep1State extends State<BizInfoStep1> {
  final _formKey = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();

  String? _selectedBusinessType;
  String? _selectedCategory;

  // Sample business types - replace with your actual data
  final List<String> _businessTypes = [
    'Sole Proprietorship',
    'Partnership',
    'Limited Liability Company (LLC)',
    'Corporation',
    'Non-Profit Organization',
    'Freelancer/Independent Contractor',
  ];

  // Sample categories - replace with your actual data
  final List<String> _categories = [
    'Technology & IT',
    'Healthcare & Medical',
    'Education & Training',
    'Construction & Home Services',
    'Food & Beverage',
    'Retail & E-commerce',
    'Professional Services',
    'Creative & Design',
    'Transportation & Logistics',
    'Financial Services',
    'Real Estate',
    'Entertainment & Events',
    'Beauty & Wellness',
    'Automotive',
    'Agriculture & Farming',
    'Manufacturing',
    'Other',
  ];

  @override
  void dispose() {
    _businessNameController.dispose();
    super.dispose();
  }

  void _navigateToNextStep() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const Step2(),
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

  void _navigateToLogin() {
    // Navigate to login screen - implement based on your routing
    // Navigator.pushNamed(context, '/login');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to login screen')),
    );
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? _validateDropdown(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please select $fieldName';
    }
    return null;
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        validator: validator,
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
          suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3583bd),
      body: Column(
        children: [
          // Back Top Bar
          const BackTopBar(),

          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                const Text(
                  'ACCESS A LARGER\nNETWORK OF LOCAL\nCUSTOMERS',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 27,
                    color: Colors.white,
                    letterSpacing: 1.08,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Local jobs to grow your business your way',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.white,
                    letterSpacing: 0.098,
                    height: 1.43,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Form Container
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 82),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9.0),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
              child: Column(
                children: [
                  // Title
                  const Text(
                    'Join Our Marketplace',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color(0xff3583bd),
                      letterSpacing: 0.36,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  // Form
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildInputField(
                              label: 'Name of Business',
                              controller: _businessNameController,
                              validator: (value) => _validateRequired(value, 'Business name'),
                              keyboardType: TextInputType.text,
                            ),

                            _buildDropdownField(
                              label: 'Type of Business',
                              value: _selectedBusinessType,
                              items: _businessTypes,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedBusinessType = newValue;
                                });
                              },
                              validator: (value) => _validateDropdown(value, 'business type'),
                            ),

                            _buildDropdownField(
                              label: 'Category',
                              value: _selectedCategory,
                              items: _categories,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCategory = newValue;
                                });
                              },
                              validator: (value) => _validateDropdown(value, 'category'),
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

                  // Bottom Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _navigateToLogin,
                        child: const Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              color: Colors.black,
                              letterSpacing: 0.11,
                              height: 1.82,
                            ),
                            children: [
                              TextSpan(text: 'Already have an account? '),
                              TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                  color: Color(0xff006ea2),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        'Step 1/2',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 11,
                          color: Colors.black,
                          letterSpacing: 0.11,
                          height: 1.82,
                        ),
                      ),
                    ],
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
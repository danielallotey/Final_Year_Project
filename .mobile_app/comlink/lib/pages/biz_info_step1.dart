import 'package:flutter/material.dart';
import './step2.dart';
import '../modules/business_registration_data.dart';

class BizInfoStep1 extends StatefulWidget {
  final BusinessRegistrationData registrationData;

  const BizInfoStep1({super.key, required this.registrationData});

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
      // Check if dropdowns are selected since we're hiding error messages
      if (_selectedBusinessType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a business type')),
        );
        return;
      }
      if (_selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a category')),
        );
        return;
      }

      widget.registrationData.businessName = _businessNameController.text;
      widget.registrationData.businessType = _selectedBusinessType;
      widget.registrationData.category = _selectedCategory;

      Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Step2(
              registrationData: widget.registrationData,
            ),
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
        isExpanded: true, // Prevent overflow
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
          errorStyle: const TextStyle(fontSize: 0, height: 0), // Hide error text
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
              overflow: TextOverflow.ellipsis,
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
      body: SafeArea(
        child: Column(
          children: [
            // Back Top Bar (Custom implementation)
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
                      'Business Information',
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

            // Header Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: const Column(
                children: [
                  Text(
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
                  SizedBox(height: 20),
                  Text(
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
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                        child: Column(
                          children: [
                            Expanded(
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
                                      validator: (value) => null, // Handle validation in _navigateToNextStep
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
                                      validator: (value) => null, // Handle validation in _navigateToNextStep
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

                            const SizedBox(height: 20),

                            // Bottom Section
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: GestureDetector(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
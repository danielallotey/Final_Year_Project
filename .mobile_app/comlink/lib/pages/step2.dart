import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './completed.dart';
import '../components/back_top_bar.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final _formKey = GlobalKey<FormState>();
  bool _ownsBusinessConfirmed = false;
  bool _termsAccepted = false;

  // Controllers for form fields
  final _businessDescController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _phone2Controller = TextEditingController();
  final _locationController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _businessDescController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _phone2Controller.dispose();
    _locationController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_ownsBusinessConfirmed) {
        _showSnackBar('Please confirm you own/manage this business');
        return;
      }
      if (!_termsAccepted) {
        _showSnackBar('Please accept Terms & Conditions and Privacy Policy');
        return;
      }

      // Navigate to completed page
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const Completed(),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutExpo,
              )),
              child: child,
            );
          },
        ),
      );
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.black,
            letterSpacing: 1.12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: Color(0xff707070)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: Color(0xff707070)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: Color(0xff3583bd), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Colors.black,
          letterSpacing: 1.12,
        ),
      ),
    );
  }

  Widget _buildCheckbox({
    required String text,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xff707070)),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Colors.black,
                letterSpacing: 0.08,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3583bd),
      body: Column(
        children: [
          const BackTopBar(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: const Color(0xff707070)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Profile Icon
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: SvgPicture.string(
                          _profileIconSvg,
                          width: 80,
                          height: 80,
                        ),
                      ),

                      // Form Fields
                      _buildFormField(
                        label: 'Business Description',
                        controller: _businessDescController,
                        maxLines: 3,
                        validator: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Business description is required';
                          }
                          return null;
                        },
                      ),

                      _buildFormField(
                        label: 'Email Address',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Email address is required';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),

                      _buildFormField(
                        label: 'Business Phone',
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Business phone is required';
                          }
                          return null;
                        },
                      ),

                      _buildFormField(
                        label: 'Business Phone #2 (Optional)',
                        controller: _phone2Controller,
                        keyboardType: TextInputType.phone,
                      ),

                      _buildFormField(
                        label: 'Location',
                        controller: _locationController,
                        validator: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Location is required';
                          }
                          return null;
                        },
                      ),

                      _buildFormField(
                        label: 'Business Address',
                        controller: _addressController,
                        maxLines: 2,
                        validator: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Business address is required';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // Checkboxes
                      _buildCheckbox(
                        text: 'I confirm I own/manage this business',
                        value: _ownsBusinessConfirmed,
                        onChanged: (value) {
                          setState(() {
                            _ownsBusinessConfirmed = value ?? false;
                          });
                        },
                      ),

                      _buildCheckbox(
                        text: 'By clicking "Submit" you agree to our Terms & Conditions and Privacy Policy.',
                        value: _termsAccepted,
                        onChanged: (value) {
                          setState(() {
                            _termsAccepted = value ?? false;
                          });
                        },
                      ),

                      const SizedBox(height: 30),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff64743),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: const BorderSide(color: Color(0xff707070)),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              letterSpacing: 1.12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Step indicator
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Step 2/2',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            color: Colors.black,
                            letterSpacing: 0.11,
                            height: 1.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _profileIconSvg = '''
<svg viewBox="0 0 104.7 104.7">
  <circle cx="52.35" cy="52.35" r="50.35" fill="none" stroke="#707070" stroke-width="2"/>
  <circle cx="52.35" cy="31.4" r="15.85" fill="#707070"/>
  <path d="M20.5 83.2c0-17.6 14.25-31.85 31.85-31.85s31.85 14.25 31.85 31.85" 
        fill="none" stroke="#707070" stroke-width="3" stroke-linecap="round"/>
</svg>
''';
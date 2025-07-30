import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './completed.dart';
import '../modules/business_registration_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Step2 extends StatefulWidget {
  final BusinessRegistrationData registrationData;

  const Step2({
    super.key,
    required this.registrationData,
  });

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final _formKey = GlobalKey<FormState>();
  bool _ownsBusinessConfirmed = false;
  bool _termsAccepted = false;
  bool _isSubmitting = false;

  // Controllers for form fields
  final _businessDescController = TextEditingController();
  final _bizemailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _phone2Controller = TextEditingController();
  final _locationController = TextEditingController();
  final _addressController = TextEditingController();

  // Focus nodes for better form navigation
  final _businessDescFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _phone2Focus = FocusNode();
  final _locationFocus = FocusNode();
  final _addressFocus = FocusNode();

  @override
  void dispose() {
    _businessDescController.dispose();
    _bizemailController.dispose();
    _phoneController.dispose();
    _phone2Controller.dispose();
    _locationController.dispose();
    _addressController.dispose();

    _businessDescFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _phone2Focus.dispose();
    _locationFocus.dispose();
    _addressFocus.dispose();
    super.dispose();
  }

  // Function to save data to text file for debugging
  Future<void> _saveDataToFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/registration_data_debug.txt');

      final timestamp = DateTime.now().toIso8601String();
      final data = '''
=== REGISTRATION DATA DEBUG - $timestamp ===

STEP 1 DATA (Service Selection):
- Service Type: ${widget.registrationData.serviceType ?? 'NULL'}

STEP 2 DATA (Personal Info):
- Full Name: ${widget.registrationData.fullName ?? 'NULL'}
- Phone: ${widget.registrationData.phone ?? 'NULL'}
- Email: ${widget.registrationData.email ?? 'NULL'}
- Password: ${widget.registrationData.password != null ? '[SET - Length: ${widget.registrationData.password!.length}]' : 'NULL'}

STEP 3 DATA (Business Info Step 1):
- Business Name: ${widget.registrationData.businessName ?? 'NULL'}
- Business Type: ${widget.registrationData.businessType ?? 'NULL'}
- Category: ${widget.registrationData.category ?? 'NULL'}

STEP 4 DATA (Business Info Step 2 - Current Form):
- Business Description: ${_businessDescController.text.trim()}
- Business Email: ${_bizemailController.text.trim()}
- Phone: ${_phoneController.text.trim()}
- Phone 2: ${_phone2Controller.text.trim()}
- Location: ${_locationController.text.trim()}
- Address: ${_addressController.text.trim()}

VALIDATION STATUS:
- Form Valid: ${_formKey.currentState?.validate() ?? false}
- Owns Business Confirmed: $_ownsBusinessConfirmed
- Terms Accepted: $_termsAccepted
- Registration Data Complete: ${widget.registrationData.isComplete}

MISSING DATA CHECK:
${_getMissingDataReport()}

COMPLETE REGISTRATION DATA OBJECT:
${widget.registrationData.toString()}

=== END DEBUG DATA ===

''';

      await file.writeAsString(data, mode: FileMode.append);
      print('Debug data saved to: ${file.path}');

      // Show user where file was saved
      _showSnackBar('Debug data saved to Documents folder', isError: false);

    } catch (e) {
      print('Error saving debug file: $e');
      _showSnackBar('Could not save debug file: $e', isError: true);
    }
  }

  String _getMissingDataReport() {
    List<String> missing = [];

    if (widget.registrationData.serviceType == null || widget.registrationData.serviceType!.isEmpty) {
      missing.add('Service Type');
    }
    if (widget.registrationData.fullName == null || widget.registrationData.fullName!.isEmpty) {
      missing.add('Full Name');
    }
    if (widget.registrationData.phone == null || widget.registrationData.phone!.isEmpty) {
      missing.add('Phone');
    }
    if (widget.registrationData.email == null || widget.registrationData.email!.isEmpty) {
      missing.add('Email');
    }
    if (widget.registrationData.password == null || widget.registrationData.password!.isEmpty) {
      missing.add('Password');
    }
    if (widget.registrationData.businessName == null || widget.registrationData.businessName!.isEmpty) {
      missing.add('Business Name');
    }
    if (widget.registrationData.businessType == null || widget.registrationData.businessType!.isEmpty) {
      missing.add('Business Type');
    }
    if (widget.registrationData.category == null || widget.registrationData.category!.isEmpty) {
      missing.add('Category');
    }

    if (missing.isEmpty) {
      return 'All required data from previous steps is present.';
    } else {
      return 'MISSING DATA: ${missing.join(', ')}';
    }
  }

  Future<void> _handleSubmit() async {
    // Save debug data first
    await _saveDataToFile();

    // Unfocus any active text field
    FocusScope.of(context).unfocus();

    if (_formKey.currentState?.validate() ?? false) {
      if (!_ownsBusinessConfirmed) {
        _showSnackBar('Please confirm you own/manage this business', isError: true);
        return;
      }
      if (!_termsAccepted) {
        _showSnackBar('Please accept Terms & Conditions and Privacy Policy', isError: true);
        return;
      }

      setState(() => _isSubmitting = true);

      try {
        // Update registration data with current form data
        widget.registrationData.businessDescription = _businessDescController.text.trim();
        widget.registrationData.bizemail = _bizemailController.text.trim();
        widget.registrationData.phone = _phoneController.text.trim();
        widget.registrationData.phone2 = _phone2Controller.text.trim();
        widget.registrationData.location = _locationController.text.trim();
        widget.registrationData.address = _addressController.text.trim();

        // Validate all required data from previous steps
        final email = widget.registrationData.email?.trim();
        final password = widget.registrationData.password?.trim();
        final businessName = widget.registrationData.businessName?.trim();
        final serviceType = widget.registrationData.serviceType?.trim();
        final fullName = widget.registrationData.fullName?.trim();
        final businessType = widget.registrationData.businessType?.trim();
        final category = widget.registrationData.category?.trim();

        // Check for missing data
        List<String> missingFields = [];
        if (email == null || email.isEmpty) missingFields.add('Email');
        if (password == null || password.isEmpty) missingFields.add('Password');
        if (businessName == null || businessName.isEmpty) missingFields.add('Business Name');
        if (serviceType == null || serviceType.isEmpty) missingFields.add('Service Type');
        if (fullName == null || fullName.isEmpty) missingFields.add('Full Name');
        if (businessType == null || businessType.isEmpty) missingFields.add('Business Type');
        if (category == null || category.isEmpty) missingFields.add('Category');

        if (missingFields.isNotEmpty) {
          throw Exception('Missing required data from previous steps: ${missingFields.join(', ')}');
        }

        print('Starting Firebase operations with email: $email'); // Debug log

        // Create Firebase user
        UserCredential userCredential;
        try {
          userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email!,
            password: password!,
          );
          print('Firebase user created successfully'); // Debug log
        } catch (authError) {
          print('Firebase Auth Error: $authError'); // Debug log
          if (authError is FirebaseAuthException) {
            switch (authError.code) {
              case 'email-already-in-use':
                throw Exception('This email is already registered. Please use a different email.');
              case 'weak-password':
                throw Exception('Password is too weak. Please choose a stronger password.');
              case 'invalid-email':
                throw Exception('Invalid email address format.');
              case 'operation-not-allowed':
                throw Exception('Email/password accounts are not enabled. Please contact support.');
              case 'network-request-failed':
                throw Exception('Network error. Please check your internet connection.');
              default:
                throw Exception('Authentication failed: ${authError.message ?? authError.code}');
            }
          }
          throw Exception('Authentication failed: ${authError.toString()}');
        }

        final uid = userCredential.user?.uid;
        if (uid == null) {
          throw Exception('User creation failed - no user ID returned');
        }

        print('User created with UID: $uid'); // Debug log

        // Prepare business data
        final businessData = {
          'businessName': businessName,
          'serviceType': serviceType,
          'businessType': businessType,
          'category': category,
          'fullName': fullName,
          'phoneNumber': widget.registrationData.phone,
          'whatsappNumber': widget.registrationData.phone2?.isNotEmpty == true
              ? widget.registrationData.phone2
              : null,
          'location': widget.registrationData.location,
          'gpsAddress': widget.registrationData.address,
          'email': widget.registrationData.bizemail,
          'businessDescription': widget.registrationData.businessDescription,
          'createdAt': FieldValue.serverTimestamp(),
          'ownerId': uid,
          'isActive': true,
          'isVerified': false,
        };

        print('Business data prepared: ${businessData.keys.join(', ')}'); // Debug log

        // Create business document
        DocumentReference businessRef;
        try {
          businessRef = await FirebaseFirestore.instance.collection('businesses').add(businessData);
          print('Business document created with ID: ${businessRef.id}'); // Debug log
        } catch (firestoreError) {
          print('Firestore Business Error: $firestoreError'); // Debug log
          // If business creation fails, delete the user account
          try {
            await userCredential.user?.delete();
          } catch (deleteError) {
            print('Error deleting user after business creation failure: $deleteError');
          }

          if (firestoreError.toString().contains('network')) {
            throw Exception('Network error while creating business profile. Please check your connection.');
          } else if (firestoreError.toString().contains('permission')) {
            throw Exception('Permission denied. Please contact support.');
          } else {
            throw Exception('Failed to create business profile: ${firestoreError.toString()}');
          }
        }

        // Create user document
        final userData = {
          'email': email,
          'fullName': fullName,
          'businessId': businessRef.id,
          'createdAt': FieldValue.serverTimestamp(),
          'isEmailVerified': false,
        };

        try {
          await FirebaseFirestore.instance.collection('users').doc(uid).set(userData);
          print('User document created'); // Debug log
        } catch (firestoreError) {
          print('Firestore User Error: $firestoreError'); // Debug log
          // Clean up: delete business document and user account
          try {
            await businessRef.delete();
            await userCredential.user?.delete();
          } catch (cleanupError) {
            print('Error during cleanup: $cleanupError');
          }
          throw Exception('Failed to create user profile: ${firestoreError.toString()}');
        }

        // Send email verification
        try {
          await userCredential.user?.sendEmailVerification();
          print('Email verification sent'); // Debug log
        } catch (emailError) {
          print('Email verification error: $emailError'); // Debug log
          // Don't fail the entire process if email verification fails
        }

        if (!mounted) return;

        _showSnackBar('Registration successful! Please check your email for verification.', isError: false);

        // Navigate to completed page
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const Completed(),
            transitionDuration: const Duration(milliseconds: 1000),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const curve = Curves.easeInOutExpo;
              final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                  .chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );

      } catch (e) {
        print('Registration error: $e'); // Debug log
        String errorMessage = 'Registration failed. Please try again.';

        // Provide more specific error messages
        String errorString = e.toString();
        if (errorString.contains('network') || errorString.contains('connection')) {
          errorMessage = 'Network error. Please check your internet connection and try again.';
        } else if (errorString.contains('email')) {
          errorMessage = errorString.replaceFirst('Exception: ', '');
        } else if (errorString.contains('password')) {
          errorMessage = errorString.replaceFirst('Exception: ', '');
        } else if (errorString.contains('Missing required data')) {
          errorMessage = errorString.replaceFirst('Exception: ', '');
        } else if (errorString.contains('permission')) {
          errorMessage = 'Permission denied. Please contact support.';
        }

        _showSnackBar(errorMessage, isError: true);
      } finally {
        if (mounted) {
          setState(() => _isSubmitting = false);
        }
      }
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
        ),
        backgroundColor: isError ? Colors.red[600] : Colors.green[600],
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        duration: Duration(seconds: isError ? 5 : 3),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    FocusNode? focusNode,
    FocusNode? nextFocus,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    int maxLines = 1,
    int? maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Semantics(
        label: label,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          maxLength: maxLength,
          textInputAction: nextFocus != null ? TextInputAction.next : TextInputAction.done,
          onFieldSubmitted: (_) {
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              _handleSubmit();
            }
          },
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.black,
            letterSpacing: 1.12,
          ),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.black87,
              letterSpacing: 1.12,
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
            counterText: maxLength != null ? null : "",
          ),
          enabled: !_isSubmitting,
        ),
      ),
    );
  }

  Widget _buildCheckbox({
    required String text,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Semantics(
        label: text,
        checked: value,
        child: InkWell(
          onTap: () => onChanged(!value),
          borderRadius: BorderRadius.circular(7.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: value ? const Color(0xff3583bd) : Colors.white,
                  border: Border.all(
                    color: value ? const Color(0xff3583bd) : const Color(0xff707070),
                    width: value ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: value
                    ? const Icon(
                  Icons.check,
                  size: 14,
                  color: Colors.white,
                )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.black87,
                    letterSpacing: 0.098,
                    height: 1.43,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validatePhone(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(value!.trim())) {
      return 'Please enter a valid phone number';
    }
    if (value.replaceAll(RegExp(r'[\s\-\(\)]'), '').length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    return null;
  }

  String? _validateOptionalPhone(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return null;
    }
    return _validatePhone(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3583bd),
      body: SafeArea(
        child: Column(
          children: [
            // Custom Top Bar
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
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 1.12,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 48), // Balance the back button
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
                child: Form(
                  key: _formKey,
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

                      // Form Fields
                      Expanded(
                        child: SingleChildScrollView(
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

                              _buildFormField(
                                label: 'Business Description',
                                controller: _businessDescController,
                                focusNode: _businessDescFocus,
                                nextFocus: _emailFocus,
                                maxLines: 3,
                                maxLength: 500,
                                validator: (value) {
                                  if (value?.trim().isEmpty ?? true) {
                                    return 'Business description is required';
                                  }
                                  if (value!.trim().length < 10) {
                                    return 'Please provide a more detailed description (at least 10 characters)';
                                  }
                                  return null;
                                },
                              ),

                              _buildFormField(
                                label: 'Email Address',
                                controller: _bizemailController,
                                focusNode: _emailFocus,
                                nextFocus: _phoneFocus,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value?.trim().isEmpty ?? true) {
                                    return 'Email address is required';
                                  }
                                  if (!RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$').hasMatch(value!.trim())) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),

                              _buildFormField(
                                label: 'Business Phone',
                                controller: _phoneController,
                                focusNode: _phoneFocus,
                                nextFocus: _phone2Focus,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[\d\s\-\(\)\+]')),
                                ],
                                validator: _validatePhone,
                              ),

                              _buildFormField(
                                label: 'Business Phone #2 (Optional)',
                                controller: _phone2Controller,
                                focusNode: _phone2Focus,
                                nextFocus: _locationFocus,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[\d\s\-\(\)\+]')),
                                ],
                                validator: _validateOptionalPhone,
                              ),

                              _buildFormField(
                                label: 'Location',
                                controller: _locationController,
                                focusNode: _locationFocus,
                                nextFocus: _addressFocus,
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
                                focusNode: _addressFocus,
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

                              // Debug Button (remove in production)
                              SizedBox(
                                width: double.infinity,
                                height: 35,
                                child: OutlinedButton.icon(
                                  onPressed: _saveDataToFile,
                                  icon: const Icon(Icons.bug_report, size: 16),
                                  label: const Text(
                                    'Save Debug Data',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.grey[600],
                                    side: BorderSide(color: Colors.grey[400]!),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 15),

                              // Submit Button
                              SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: _isSubmitting ? null : _handleSubmit,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _isSubmitting
                                        ? Colors.grey[400]
                                        : const Color(0xfff64743),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      side: const BorderSide(color: Color(0xff707070)),
                                    ),
                                    elevation: 0,
                                    disabledBackgroundColor: Colors.grey[400],
                                    disabledForegroundColor: Colors.white,
                                  ),
                                  child: _isSubmitting
                                      ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                      : const Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      letterSpacing: 1.12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Step Indicator
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Step 2/2',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    color: Colors.black,
                                    letterSpacing: 0.11,
                                    height: 1.82,
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
            ),
          ],
        ),
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'dart:io';
import './completed.dart';
import '../modules/business_registration_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

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

  // Add this method to check network connectivity
  Future<bool> _checkNetworkConnectivity() async {
    try {
      // Check connectivity status
      final connectivityResult = await Connectivity().checkConnectivity();
      // ignore: unrelated_type_equality_checks
      if (connectivityResult == ConnectivityResult.none) {
        return false;
      }

      // Additional check: try to reach a reliable server
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Network connectivity check failed: $e');
      }
      return false;
    }
  }

  Future<void> _handleSubmit() async {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (!_ownsBusinessConfirmed) {
      _showSnackBar('Please confirm you own/manage this business', isError: true);
      return;
    }
    if (!_termsAccepted) {
      _showSnackBar('Please accept Terms & Conditions and Privacy Policy',
          isError: true);
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      // 🔧 CHECK NETWORK CONNECTIVITY FIRST
      if (kDebugMode) {
        debugPrint('Checking network connectivity...');
      }
      final hasNetwork = await _checkNetworkConnectivity();
      if (!hasNetwork) {
        _showSnackBar('No internet connection. Please check your network and try again.',
            isError: true);
        return;
      }
      if (kDebugMode) {
        debugPrint('Network connectivity confirmed');
      }

      // 1️⃣ Extract and validate payload
      final email = widget.registrationData.email?.trim();
      final password = widget.registrationData.password?.trim();

      if (kDebugMode) {
        debugPrint('Email from registration data: $email');
        debugPrint('Password length: ${password?.length ?? 0}');
      }

      if (email == null || email.isEmpty) {
        _showSnackBar('Email is missing from previous step', isError: true);
        return;
      }

      if (password == null || password.isEmpty) {
        _showSnackBar('Password is missing from previous step', isError: true);
        return;
      }

      if (password.length < 6) {
        _showSnackBar('Password must be at least 6 characters long', isError: true);
        return;
      }

      // 2️⃣ Validate email format before proceeding
      if (!RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
        _showSnackBar('Invalid email format', isError: true);
        return;
      }

      // 3️⃣ Check for duplicate email with timeout
      try {
        if (kDebugMode) {
          debugPrint('Checking for existing email...');
        }
        final signInMethods = await FirebaseAuth.instance
            .fetchSignInMethodsForEmail(email)
            .timeout(const Duration(seconds: 10));
        if (signInMethods.isNotEmpty) {
          _showSnackBar('An account with this email already exists', isError: true);
          return;
        }
        if (kDebugMode) {
          debugPrint('Email check passed');
        }
      } on TimeoutException catch (e) {
        if (kDebugMode) {
          debugPrint('Email check timeout: $e');
        }
        _showSnackBar('Request timeout. Please check your internet connection.', isError: true);
        return;
      } catch (e) {
        if (kDebugMode) {
          debugPrint('Could not check existing email: $e');
        }
        // Continue anyway - the createUser call will handle this
      }

      // 4️⃣ Validate required business data
      if (widget.registrationData.fullName?.trim().isEmpty ?? true) {
        _showSnackBar('Full name is missing from previous step', isError: true);
        return;
      }

      if (widget.registrationData.businessName?.trim().isEmpty ?? true) {
        _showSnackBar('Business name is missing from previous step', isError: true);
        return;
      }

      if (kDebugMode) {
        debugPrint('About to create user with email: $email');
      }

      // 5️⃣ Create Firebase Auth user with timeout
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .timeout(const Duration(seconds: 30));

      final uid = userCredential.user?.uid;
      if (uid == null) {
        _showSnackBar('Failed to create user account', isError: true);
        return;
      }

      if (kDebugMode) {
        debugPrint('User created successfully with UID: $uid');
      }

      // 6️⃣ Prepare Firestore data
      final firestore = FirebaseFirestore.instance;
      final batch = firestore.batch();

      // User document
      final userDoc = firestore.collection('users').doc(uid);
      final userData = {
        'fullName': widget.registrationData.fullName?.trim() ?? '',
        'email': email,
        'phone': widget.registrationData.phone?.trim() ?? '',
        'createdAt': FieldValue.serverTimestamp(),
        'role': 'business',
      };

      if (kDebugMode) {
        debugPrint('User data to save: $userData');
      }
      batch.set(userDoc, userData);

      // Business document
      final businessDoc = firestore.collection('businesses').doc(uid);
      final businessData = {
        'businessName': widget.registrationData.businessName?.trim() ?? '',
        'serviceType': widget.registrationData.serviceType?.trim() ?? '',
        'businessType': widget.registrationData.businessType?.trim() ?? '',
        'category': widget.registrationData.category?.trim() ?? '',
        'businessDescription': _businessDescController.text.trim(),
        'bizEmail': _bizemailController.text.trim(),
        'businessPhone': _phoneController.text.trim(),
        'businessPhone2': _phone2Controller.text.trim(),
        'location': _locationController.text.trim(),
        'address': _addressController.text.trim(),
        'ownerId': uid,
        'createdAt': FieldValue.serverTimestamp(),
      };

      if (kDebugMode) {
        debugPrint('Business data to save: $businessData');
      }
      batch.set(businessDoc, businessData);

      // 7️⃣ Commit to Firestore with timeout
      await batch.commit().timeout(const Duration(seconds: 30));
      if (kDebugMode) {
        debugPrint('Firestore batch committed successfully');
      }

      // 8️⃣ Send verification email (non-blocking)
      try {
        await userCredential.user?.sendEmailVerification()
            .timeout(const Duration(seconds: 10));
        if (kDebugMode) {
          debugPrint('Verification email sent');
        }
      } catch (e) {
        if (kDebugMode) {
          debugPrint('Failed to send verification email: $e');
        }
        // Don't fail the entire process for this
      }

      // 9️⃣ Navigate to completion screen
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const Completed(),
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (_, anim, __, child) => SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
              CurvedAnimation(parent: anim, curve: Curves.easeInOutExpo),
            ),
            child: child,
          ),
        ),
            (route) => false, // Clear entire stack
      );

    } on TimeoutException catch (e) {
      if (kDebugMode) {
        debugPrint('Timeout error: $e');
      }
      _showSnackBar('Request timeout. Please check your internet connection and try again.',
          isError: true);
    } on SocketException catch (e) {
      if (kDebugMode) {
        debugPrint('Socket error: $e');
      }
      _showSnackBar('Network error. Please check your internet connection.',
          isError: true);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        debugPrint('FirebaseAuthException: ${e.code} - ${e.message}');
      }
      String msg;
      switch (e.code) {
        case 'email-already-in-use':
          msg = 'This email is already registered. Please use a different email.';
          break;
        case 'weak-password':
          msg = 'The password is too weak. Please choose a stronger password.';
          break;
        case 'invalid-email':
          msg = 'The email address is invalid. Please check and try again.';
          break;
        case 'operation-not-allowed':
          msg = 'Email/password accounts are not enabled. Please contact support.';
          break;
        case 'network-request-failed':
          msg = 'Network connection failed. Please check your internet and try again.';
          break;
        case 'too-many-requests':
          msg = 'Too many failed attempts. Please wait a moment and try again.';
          break;
        default:
          msg = 'Sign-up failed: ${e.message ?? 'Unknown error'}';
      }
      _showSnackBar(msg, isError: true);
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        debugPrint('FirebaseException: ${e.code} - ${e.message}');
      }
      if (e.code == 'unavailable') {
        _showSnackBar('Service temporarily unavailable. Please try again later.',
            isError: true);
      } else {
        _showSnackBar('Database error: ${e.message ?? 'Unknown error'}', isError: true);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Unexpected error: $e');
      }
      _showSnackBar('Unexpected error: ${e.toString()}', isError: true);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
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
        duration: const Duration(seconds: 5), // Longer duration for error messages
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
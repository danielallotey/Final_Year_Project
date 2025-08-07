// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart'; // Commented out temporarily
import '../components/regular_top_bar.dart';
import './sign_up_regular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn(); // Commented out temporarily

  // Loading states
  bool _isLoading = false;
  bool _isGoogleLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3583BD),
      body: Column(
        children: [
          // Top bar with fixed height
          SizedBox(
            height: 65,
            child: const RegularTopBar(),
          ),
          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 31.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      _buildTitle(),
                      const SizedBox(height: 60),
                      _buildEmailField(),
                      const SizedBox(height: 20),
                      _buildPasswordField(),
                      const SizedBox(height: 15),
                      _buildForgotPasswordLink(),
                      const SizedBox(height: 30),
                      _buildSubmitButton(),
                      const SizedBox(height: 30),
                      _buildOrDivider(),
                      const SizedBox(height: 30),
                      _buildGoogleButton(),
                      const SizedBox(height: 60),
                      _buildSignUpButton(),
                      const SizedBox(height: 40),
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

  Widget _buildTitle() {
    return Text(
      'Log in',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 25,
        color: Colors.white,
        letterSpacing: 1,
        fontWeight: FontWeight.w600,
        shadows: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEmailField() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: const Color(0xFF707070)),
      ),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Colors.black,
          letterSpacing: 1.12,
        ),
        decoration: const InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Color(0xFFB8AAAA),
            letterSpacing: 1.12,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: const Color(0xFF707070)),
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Colors.black,
          letterSpacing: 1.12,
        ),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Color(0xFFB8AAAA),
            letterSpacing: 1.12,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: const Color(0xFF707070),
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildForgotPasswordLink() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: _handleForgotPassword,
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Colors.white,
            letterSpacing: 1.12,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF64743),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
            side: const BorderSide(color: Color(0xFF707070)),
          ),
          elevation: 0,
        ),
        child: _isLoading
            ? const SizedBox(
          height: 20,
          width: 20,
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
            color: Colors.white,
            letterSpacing: 1.12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return const Text(
      'or',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Colors.white,
        letterSpacing: 1.12,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: OutlinedButton.icon(
        onPressed: _isGoogleLoading ? null : _handleGoogleSignIn,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFF707070)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
        icon: _isGoogleLoading
            ? const SizedBox(
          height: 16,
          width: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        )
            : const Icon(
          Icons.person_outline,
          size: 16,
          color: Colors.black,
        ),
        label: const Text(
          'Continue With Google',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.black,
            letterSpacing: 1.12,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 43,
      child: OutlinedButton(
        onPressed: _navigateToSignUp,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white.withValues(alpha: 0.34),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          shadowColor: Colors.black.withValues(alpha: 0.16),
          elevation: 3,
        ),
        child: const Text(
          "Don't have Account",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.white,
            letterSpacing: 1.12,
          ),
        ),
      ),
    );
  }

  // Authentication Methods
  Future<void> _handleSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final credential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

        if (credential.user != null) {
          // Login successful - navigate to home page or dashboard
          if (mounted) {
            _showSnackBar('Login successful!', Colors.green);
            // Navigate to your main app screen
            // Navigator.of(context).pushReplacementNamed('/home');

            // For now, just show success message
            print('Login successful for user: ${credential.user!.email}');
          }
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        switch (e.code) {
          case 'user-not-found':
            errorMessage = 'No user found for that email.';
            break;
          case 'wrong-password':
            errorMessage = 'Wrong password provided.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;
          case 'user-disabled':
            errorMessage = 'This user account has been disabled.';
            break;
          case 'too-many-requests':
            errorMessage = 'Too many failed attempts. Try again later.';
            break;
          case 'invalid-credential':
            errorMessage = 'The email or password is incorrect.';
            break;
          default:
            errorMessage = 'An error occurred. Please try again.';
        }

        if (mounted) {
          _showSnackBar(errorMessage, Colors.red);
        }
      } catch (e) {
        if (mounted) {
          _showSnackBar('An unexpected error occurred.', Colors.red);
        }
        print('Login error: $e');
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isGoogleLoading = true;
    });

    // Temporarily show a message that Google Sign-In needs setup
    _showSnackBar('Google Sign-In setup in progress...', Colors.orange);

    setState(() {
      _isGoogleLoading = false;
    });

    /* TODO: Uncomment this when Google Sign-In is properly configured
    try {
      // Create a new GoogleSignIn instance
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        setState(() {
          _isGoogleLoading = false;
        });
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Check if we have the necessary tokens
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw Exception('Failed to get authentication tokens');
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google user credential
      final userCredential = await _auth.signInWithCredential(credential);

      if (userCredential.user != null && mounted) {
        _showSnackBar('Google Sign-In successful!', Colors.green);
        // Navigate to your main app screen
        // Navigator.of(context).pushReplacementNamed('/home');

        print('Google Sign-In successful for user: ${userCredential.user!.email}');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'account-exists-with-different-credential':
          errorMessage = 'An account already exists with a different sign-in method.';
          break;
        case 'invalid-credential':
          errorMessage = 'The credential is malformed or has expired.';
          break;
        default:
          errorMessage = 'Google Sign-In failed. Please try again.';
      }

      if (mounted) {
        _showSnackBar(errorMessage, Colors.red);
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('Google Sign-In failed. Please try again.', Colors.red);
      }
      print('Google Sign-In error: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isGoogleLoading = false;
        });
      }
    }
    */
  }

  Future<void> _handleForgotPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showSnackBar('Please enter your email first.', Colors.orange);
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      if (mounted) {
        _showSnackBar('Password reset email sent! Check your inbox.', Colors.green);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        default:
          errorMessage = 'Failed to send password reset email.';
      }

      if (mounted) {
        _showSnackBar(errorMessage, Colors.red);
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('An error occurred. Please try again.', Colors.red);
      }
    }
  }

  void _navigateToSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpRegular(),
      ),
    );
  }

  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
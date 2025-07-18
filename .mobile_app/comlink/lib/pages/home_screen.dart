import 'package:flutter/material.dart';
import '../pages/social_amenities.dart';
import '../pages/search_results_page.dart';
import '../components/service_needed_input.dart';
import '../components/community_input.dart';
import '../components/regular_top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controllers for input fields
  final _serviceController = TextEditingController();
  final _communityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // UI Constants
  static const Color _primaryBlue = Color(0xFF3583BD);
  static const Color _primaryRed = Color(0xFFF64743);
  static const Color _shadowColor = Color(0x29000000);
  static const Color _buttonOverlay = Color(0x57FFFFFF);
  static const Color _borderColor = Color(0xFF707070);

  static const double _horizontalPadding = 31.0;
  static const double _buttonHeight = 45.0;
  static const double _socialButtonHeight = 43.0;
  static const double _borderRadius = 7.0;
  static const double _socialButtonRadius = 22.0;

  @override
  void dispose() {
    _serviceController.dispose();
    _communityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const RegularTopBar(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: _primaryBlue,
                border: Border(
                  top: BorderSide(width: 1.0, color: _borderColor),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: _horizontalPadding,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 40),
                          _buildMainTitle(),
                          const SizedBox(height: 40),
                          _buildSubtitle(),
                          const SizedBox(height: 60),
                          ServiceNeededInput(controller: _serviceController),
                          const SizedBox(height: 20),
                          CommunityInput(controller: _communityController),
                          const SizedBox(height: 20),
                          _buildSearchButton(),
                          const SizedBox(height: 40),
                          _buildSocialAmenitiesButton(),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainTitle() {
    return const Text(
      'Find Someone\nNear You\nTo Do It For You',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 35,
        color: Colors.white,
        letterSpacing: 1.4,
        fontWeight: FontWeight.w600,
        height: 1.43,
        shadows: [
          Shadow(
            color: _shadowColor,
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitle() {
    return const Text(
      'Get connected to a local\nprofessional - fast, easy, and\ncommitment-free.',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Colors.white,
        letterSpacing: 1.12,
        height: 1.25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSearchButton() {
    return Semantics(
      label: 'Search for services',
      button: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleSearch,
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Container(
            height: _buttonHeight,
            decoration: BoxDecoration(
              color: _primaryRed,
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            child: const Center(
              child: Text(
                'Search',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 1.12,
                  height: 1.25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialAmenitiesButton() {
    return Semantics(
      label: 'Browse social amenities',
      button: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _navigateToSocialAmenities,
          borderRadius: BorderRadius.circular(_socialButtonRadius),
          child: Container(
            height: _socialButtonHeight,
            decoration: BoxDecoration(
              color: _buttonOverlay,
              borderRadius: BorderRadius.circular(_socialButtonRadius),
              boxShadow: const [
                BoxShadow(
                  color: _shadowColor,
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Browse Social Amenities',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Colors.white,
                  letterSpacing: 1.05,
                  height: 1.27,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleSearch() {
    final service = _serviceController.text.trim();
    final community = _communityController.text.trim();

    // Validate input
    if (service.isEmpty && community.isEmpty) {
      _showErrorMessage('Please enter a service or select a community');
      return;
    }

    if (service.isEmpty) {
      _showErrorMessage('Please enter a service you need');
      return;
    }

    // Navigate to search results
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SearchResults(
              service: service,
              community: community,
            ),
        transitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );
          return FadeTransition(
            opacity: curvedAnimation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.3),
                end: Offset.zero,
              ).animate(curvedAnimation),
              child: child,
            ),
          );
        },
      ),
    );
  }

  void _navigateToSocialAmenities() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        const SocialAmenities(),
        transitionDuration: const Duration(milliseconds: 800),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          );
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          );
        },
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: _primaryRed,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
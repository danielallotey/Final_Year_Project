import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/login_page.dart';
import '../pages/business_signup.dart';
import '../pages/social_amenities.dart';
import '../pages/home_screen.dart';

class RtbToggle extends StatelessWidget {
  const RtbToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          _buildHeader(context),

          // Menu Items
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 35),
                  _buildMenuItem(
                    icon: _buildLocationIcon(),
                    text: 'Find A Service',
                    onTap: () => _navigateToPage(context, const HomeScreen()),
                  ),
                  const SizedBox(height: 10),
                  _buildMenuItem(
                    icon: _buildMenuIcon(),
                    text: 'Social Amenities',
                    onTap: () => _navigateToPage(context, const SocialAmenities()),
                  ),
                  const SizedBox(height: 10),
                  _buildMenuItem(
                    icon: _buildContactIcon(),
                    text: 'About US',
                    onTap: () {
                      // Add About US navigation
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildMenuItem(
                    icon: _buildAddIcon(),
                    text: 'Join Our Network',
                    onTap: () => _navigateToPage(context, const BusinessSignup()),
                  ),
                  const SizedBox(height: 20),
                  _buildSignInButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Color(0xff3583bd),
        boxShadow: [
          BoxShadow(
            color: Color(0x33000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                  children: [
                    TextSpan(text: 'Com'),
                    TextSpan(
                      text: 'Link',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),

              // Close Button
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: SvgPicture.string(
                    _closeIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required Widget icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 12),
              Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.black,
                  letterSpacing: 0.36,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToPage(context, const LoginPage()),
      child: Container(
        width: 138,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0xff3583bd),
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'Sign In',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Colors.white,
              letterSpacing: 0.36,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddIcon() {
    return SvgPicture.string(
      _addIcon,
      width: 20,
      height: 20,
    );
  }

  Widget _buildContactIcon() {
    return SvgPicture.string(
      _contactIcon,
      width: 20,
      height: 20,
    );
  }

  Widget _buildMenuIcon() {
    return SvgPicture.string(
      _menuIcon,
      width: 20,
      height: 20,
    );
  }

  Widget _buildLocationIcon() {
    return SvgPicture.string(
      _locationIcon,
      width: 20,
      height: 20,
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const curve = Curves.easeInOutExpo;
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
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
}

// SVG Icons
const String _addIcon = '''
<svg viewBox="0 0 24 24">
  <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z" fill="#000000"/>
</svg>
''';

const String _contactIcon = '''
<svg viewBox="0 0 24 24">
  <path d="M19 3H18V1h-2v2H8V1H6v2H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm6 12H6v-1c0-2 4-3.1 6-3.1s6 1.1 6 3.1v1z" fill="#000000"/>
</svg>
''';

const String _menuIcon = '''
<svg viewBox="0 0 24 24">
  <path d="M4 15h16v-2H4v2zm0 4h16v-2H4v2zm0-8h16V9H4v2zm0-6v2h16V5H4z" fill="#000000"/>
</svg>
''';

const String _locationIcon = '''
<svg viewBox="0 0 24 24">
  <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z" fill="#000000"/>
</svg>
''';

const String _closeIcon = '''
<svg viewBox="0 0 24 24">
  <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z" fill="#ffffff"/>
</svg>
''';
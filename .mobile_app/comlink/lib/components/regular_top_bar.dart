import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/login_page.dart';
import '../pages/about_us.dart';
import '../pages/business_signup.dart';
import '../pages/social_amenities.dart';
import '../pages/home_screen.dart';

class RegularTopBar extends StatefulWidget {
  const RegularTopBar({super.key});

  @override
  State<RegularTopBar> createState() => _RegularTopBarState();
}

class _RegularTopBarState extends State<RegularTopBar>
    with SingleTickerProviderStateMixin {
  bool _isMenuOpen = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _closeMenu();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    if (_isMenuOpen) {
      _closeMenu();
    } else {
      _openMenu();
    }
  }

  void _openMenu() {
    setState(() {
      _isMenuOpen = true;
    });

    _overlayEntry = OverlayEntry(
      builder: (context) => _buildOverlayMenu(),
    );

    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  void _closeMenu() {
    if (_overlayEntry != null) {
      _animationController.reverse().then((_) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      });
    }

    setState(() {
      _isMenuOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildTopBar();
  }

  Widget _buildTopBar() {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAppTitle(),
              _buildMenuButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppTitle() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 25,
          color: Colors.black,
          letterSpacing: 1.0,
          height: 1.2,
        ),
        children: [
          TextSpan(text: 'Com'),
          TextSpan(
            text: 'Link',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _toggleMenu,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          child: SvgPicture.string(
            _hamburgerIcon,
            width: 24,
            height: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildOverlayMenu() {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                // Header
                _buildMenuHeader(),

                // Menu Items
                Expanded(
                  child: Container(
                    color: const Color(0xFFF5F5F5), // Light grey background
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          _buildMenuItem(
                            icon: _buildLocationIcon(),
                            text: 'Find A Service',
                            onTap: () => _navigateToPage(context, const HomeScreen()),
                          ),
                          const SizedBox(height: 15),
                          _buildMenuItem(
                            icon: _buildMenuIcon(),
                            text: 'Social Amenities',
                            onTap: () => _navigateToPage(context, const SocialAmenities()),
                          ),
                          const SizedBox(height: 15),
                          _buildMenuItem(
                            icon: _buildContactIcon(),
                            text: 'About US',
                            onTap: () => _navigateToPage(context, const AboutUs()),

                           /* onTap: () {
                              _closeMenu();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('About US page coming soon!')),
                              );
                            },
                            */
                          ),
                          const SizedBox(height: 15),
                          _buildMenuItem(
                            icon: _buildAddIcon(),
                            text: 'Join Our Network',
                            onTap: () => _navigateToPage(context, const BusinessSignup()),
                          ),
                          const SizedBox(height: 30),
                          _buildSignInButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuHeader() {
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
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _closeMenu,
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    child: SvgPicture.string(
                      _closeIcon,
                      width: 24,
                      height: 24,
                    ),
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Color(0x1A000000),
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                icon,
                const SizedBox(width: 16),
                Text(
                  text,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Colors.black,
                    letterSpacing: 0.36,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _navigateToPage(context, const LoginPage()),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 150,
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xff3583bd),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
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
      ),
    );
  }

  // Icon builder methods
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
    _closeMenu(); // Close the menu first
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(milliseconds: 600),
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

// SVG Icons - Fixed hamburger icon with fill instead of stroke
const String _hamburgerIcon = '''
<svg viewBox="0 0 24 18" xmlns="http://www.w3.org/2000/svg">
  <rect x="0" y="1" width="24" height="2" fill="#000000"/>
  <rect x="0" y="8" width="24" height="2" fill="#000000"/>
  <rect x="0" y="15" width="24" height="2" fill="#000000"/>
</svg>
''';

const String _closeIcon = '''
<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z" fill="#ffffff"/>
</svg>
''';

const String _addIcon = '''
<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z" fill="#000000"/>
</svg>
''';

const String _contactIcon = '''
<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <path d="M19 3H18V1h-2v2H8V1H6v2H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm6 12H6v-1c0-2 4-3.1 6-3.1s6 1.1 6 3.1v1z" fill="#000000"/>
</svg>
''';

const String _menuIcon = '''
<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <path d="M4 15h16v-2H4v2zm0 4h16v-2H4v2zm0-8h16V9H4v2zm0-6v2h16V5H4z" fill="#000000"/>
</svg>
''';

const String _locationIcon = '''
<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z" fill="#000000"/>
</svg>
''';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'rtbtoggle.dart';

class RegularTopBar extends StatefulWidget {
  const RegularTopBar({super.key});

  @override
  State<RegularTopBar> createState() => _RegularTopBarState();
}

class _RegularTopBarState extends State<RegularTopBar> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Top Bar + Page Content
        Column(
          children: [
            Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x33000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // App title
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Com',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 25,
                              color: Colors.black,
                              letterSpacing: 1,
                            ),
                          ),
                          TextSpan(
                            text: 'Link',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Hamburger icon
                  IconButton(
                    icon: SvgPicture.string(_hamburgerIcon),
                    onPressed: _toggleMenu,
                  ),
                ],
              ),
            ),
            // Placeholder for body content
            Expanded(
              child: Center(child: Text('Main content goes here')),
            ),
          ],
        ),

        /// Overlay Menu (Full screen top menu)
        if (_isMenuOpen)
          Positioned.fill(
            child: Material(
              color: Colors.black.withAlpha(102),
              child: Stack(
                children: [
                  RtbToggle(),

                  // Close button on top right
                  Positioned(
                    top: 20,
                    right: 23,
                    child: GestureDetector(
                      onTap: _toggleMenu,
                      child: SvgPicture.string(_svg_zqs),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// SVGs
const String _hamburgerIcon = '''
<svg viewBox="0 0 30 18" width="30" height="18" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#000" stroke-width="3">
    <path d="M0 1.5H30"/>
    <path d="M0 9H30"/>
    <path d="M0 16.5H30"/>
  </g>
</svg>
''';
// ignore: constant_identifier_names
const String _svg_zqs = '''
<svg viewBox="322.0 22.0 30.0 30.0">
<path transform="translate(317.0, 17.0)"
d="M 35 8.021 L 31.978 5.000 L 20.000 16.979 L 8.021 5.000 L 5.000 8.021 
L 16.979 20.000 L 5.000 31.979 L 8.021 35.000 L 20.000 23.021 
L 31.979 35.000 L 35.000 31.979 L 23.021 20.000 L 35.000 8.021 Z"
fill="#ffffff"/>
</svg>
''';

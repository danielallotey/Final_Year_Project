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
        _buildTopBar(),
        if (_isMenuOpen) _buildOverlayMenu(),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x33000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAppTitle(),
          _buildMenuButton(),
        ],
      ),
    );
  }

  Widget _buildAppTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Com',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            const TextSpan(
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
    );
  }

  Widget _buildMenuButton() {
    return IconButton(
      icon: SvgPicture.string(_hamburgerIcon),
      onPressed: _toggleMenu,
    );
  }

  Widget _buildOverlayMenu() {
    return Positioned.fill(
      child: Material(
        color: Colors.black.withValues(alpha: 0.4),
        child: Stack(
          children: [
            const RtbToggle(),
            _buildCloseButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return Positioned(
      top: 20,
      right: 23,
      child: GestureDetector(
        onTap: _toggleMenu,
        child: SvgPicture.string(_closeIcon),
      ),
    );
  }
}

// SVG Icons
const String _hamburgerIcon = '''
<svg viewBox="0 0 30 18" width="30" height="18" xmlns="http://www.w3.org/2000/svg">
  <g fill="none" stroke="#000" stroke-width="3">
    <path d="M0 1.5H30"/>
    <path d="M0 9H30"/>
    <path d="M0 16.5H30"/>
  </g>
</svg>
''';

const String _closeIcon = '''
<svg viewBox="0 0 30 30" width="30" height="30" xmlns="http://www.w3.org/2000/svg">
  <path d="M 25 8.021 L 21.978 5.000 L 15.000 11.979 L 8.021 5.000 L 5.000 8.021 
           L 11.979 15.000 L 5.000 21.979 L 8.021 25.000 L 15.000 18.021 
           L 21.979 25.000 L 25.000 21.979 L 18.021 15.000 L 25.000 8.021 Z"
        fill="#ffffff"/>
</svg>
''';
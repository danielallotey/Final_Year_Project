// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import '../components/back_top_bar.dart'; // Commented out for testing

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'About Us',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCompanyInfo(),
              const SizedBox(height: 24),
              _buildDivider(),
              const SizedBox(height: 24),
              _buildContactSection(),
              const SizedBox(height: 24),
              _buildDivider(),
              const SizedBox(height: 24),
              _buildLinksSection(),
              const SizedBox(height: 24),
              _buildDivider(),
              const SizedBox(height: 32),
              _buildCopyright(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ComLink Inc.',
          style: _titleTextStyle(),
        ),
        const SizedBox(height: 8),
        Text(
          'Version 1.2025.1.0',
          style: _subtitleTextStyle(),
        ),
      ],
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: _titleTextStyle(),
        ),
        const SizedBox(height: 12),
        Text(
          'We do like to know your thoughts about this app.',
          style: _bodyTextStyle(),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLinkText('Contact us'),
            const SizedBox(height: 4),
            _buildLinkText('Rate the App'),
          ],
        ),
      ],
    );
  }

  Widget _buildLinksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLinkText('Help Center'),
        const SizedBox(height: 8),
        _buildLinkText('Licenses'),
        const SizedBox(height: 8),
        _buildLinkText('Terms and Privacy Policy'),
      ],
    );
  }

  Widget _buildCopyright() {
    return Text(
      '2025 @ Comlink Inc.',
      style: _bodyTextStyle(),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 0.5,
      color: const Color(0xFFBBB6B6),
    );
  }

  Widget _buildLinkText(String text) {
    return GestureDetector(
      onTap: () => _handleLinkTap(text),
      child: Text(
        text,
        style: _linkTextStyle(),
      ),
    );
  }

  // Text Styles
  TextStyle _titleTextStyle() {
    return const TextStyle(
      fontFamily: 'Segoe UI',
      fontSize: 22,
      color: Colors.black,
      letterSpacing: 0.88,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle _subtitleTextStyle() {
    return const TextStyle(
      fontFamily: 'Segoe UI',
      fontSize: 14,
      color: Color(0xFF757474),
      letterSpacing: 0.56,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle _bodyTextStyle() {
    return const TextStyle(
      fontFamily: 'Segoe UI',
      fontSize: 12,
      color: Colors.black,
      letterSpacing: 0.48,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle _linkTextStyle() {
    return const TextStyle(
      fontFamily: 'Segoe UI',
      fontSize: 12,
      color: Color(0xFF1592E6),
      letterSpacing: 0.48,
      fontWeight: FontWeight.w600,
    );
  }

  // Handle link taps
  void _handleLinkTap(String linkText) {
    // TODO: Implement navigation or actions for each link
    print('Tapped: $linkText');
  }
}
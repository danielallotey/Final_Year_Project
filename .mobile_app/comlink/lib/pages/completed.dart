import 'package:flutter/material.dart';
import '../components/regular_top_bar.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3583BD), // Blue background like in the image
      body: Column(
        children: [
          // Top bar with blue background
          Container(
            color: const Color(0xFF3583BD),
            child: const RegularTopBar(),
          ),

          // Main content
          Expanded(
            child: Container(
              color: const Color(0xFF3583BD),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 40.0),

                  // Main headline in white
                  _buildHeadline(),

                  const SizedBox(height: 16.0),

                  // Subtitle in white
                  _buildSubtitle(),

                  const SizedBox(height: 40.0),

                  // White success message container
                  _buildSuccessContainer(),

                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline() {
    return const Text(
      'ACCESS A LARGER\nNETWORK OF LOCAL\nCUSTOMERS',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        color: Colors.white,
        letterSpacing: 1.0,
        height: 1.2,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitle() {
    return const Text(
      'Local jobs to grow your business your way',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        color: Colors.white,
        height: 1.4,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSuccessContainer() {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 0.0),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success message in black
            const Text(
              "You're on your way to new customers!",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40.0),

            // Main success message in blue
            const Text(
              'A rep will reach\nout to you soon!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 28,
                color: Color(0xFF3583BD),
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
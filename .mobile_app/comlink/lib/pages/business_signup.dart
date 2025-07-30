import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './personal_info.dart';
import '../components/regular_top_bar.dart';
import '../modules/business_registration_data.dart';

class BusinessSignup extends StatefulWidget {
  const BusinessSignup({super.key});

  @override
  State<BusinessSignup> createState() => _BusinessSignupState();
}

class _BusinessSignupState extends State<BusinessSignup> {
  String? selectedService;
  final List<String> services = ['Plumbing', 'Painter'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7F6),
      body: Column(
        children: [
          // Top bar
          const RegularTopBar(),

          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 31.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 49.0), // Spacing after top bar

                  // Main headline
                  _buildHeadline(),

                  const SizedBox(height: 60.0),

                  // Service question
                  _buildServiceQuestion(),

                  const SizedBox(height: 24.0),

                  // Service input dropdown
                  _buildServiceDropdown(),

                  const SizedBox(height: 32.0),

                  // Get Started button
                  _buildGetStartedButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline() {
    return Text.rich(
      TextSpan(
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 27,
          color: Colors.black,
          letterSpacing: 1.08,
          height: 1.3,
          fontWeight: FontWeight.w700,
        ),
        children: [
          const TextSpan(text: 'Find '),
          const TextSpan(
            text: 'customers\n',
            style: TextStyle(color: Color(0xFF3583BD)),
          ),
          const TextSpan(text: 'looking '),
          const TextSpan(
            text: 'to hire',
            style: TextStyle(color: Color(0xFF3583BD)),
          ),
          const TextSpan(text: ' and\ngrow your business'),
        ],
      ),
    );
  }

  Widget _buildServiceQuestion() {
    return Row(
      children: [
        Container(
          width: 7.0,
          height: 7.0,
          decoration: const BoxDecoration(
            color: Color(0xFFF64743),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 17.0),
        const Text(
          'What service do you provide?',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.black,
            letterSpacing: 0.32,
            fontWeight: FontWeight.w600,
            height: 1.25,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceDropdown() {
    return Container(
      height: 45.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: const Color(0xFF707070)),
      ),
      child: InkWell(
        onTap: _showServiceSelector,
        borderRadius: BorderRadius.circular(7.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text(
                selectedService ?? 'Service Provided',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: selectedService != null
                      ? Colors.black
                      : const Color(0xFFB8AAAA),
                  letterSpacing: 1.12,
                  height: 1.25,
                ),
              ),
              const Spacer(),
              SvgPicture.string(
                _dropdownArrowSvg,
                width: 9.2,
                height: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.0,
      child: ElevatedButton(
        onPressed: () {
          final registrationData = BusinessRegistrationData(
            serviceType: selectedService,
          );

          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  PersonalInfo(registrationData: registrationData),
              transitionDuration: const Duration(seconds: 1),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOutExpo,
                  )),
                  child: child,
                );
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF64743),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
            side: const BorderSide(color: Color(0xFF707070)),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            letterSpacing: 1.12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _showServiceSelector() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _ServiceSelectionScreen(
          services: services,
          selectedService: selectedService,
          onServiceSelected: (service) {
            setState(() {
              selectedService = service;
            });
          },
        ),
      ),
    );
  }
}

// Full screen service selection screen
class _ServiceSelectionScreen extends StatelessWidget {
  final List<String> services;
  final String? selectedService;
  final Function(String) onServiceSelected;

  const _ServiceSelectionScreen({
    required this.services,
    required this.selectedService,
    required this.onServiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Select Service',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What service do you provide?',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Choose the service that best describes your business',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Color(0xFF666666),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 40.0),

            // Service options
            Expanded(
              child: ListView.separated(
                itemCount: services.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12.0),
                itemBuilder: (context, index) {
                  final service = services[index];
                  final isSelected = selectedService == service;

                  return GestureDetector(
                    onTap: () {
                      onServiceSelected(service);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF3583BD)
                              : const Color(0xFFE5E5E5),
                          width: isSelected ? 2.0 : 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10.0,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Service icon
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF3583BD).withValues(alpha: 0.1)
                                  : const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Icon(
                              _getServiceIcon(service),
                              color: isSelected
                                  ? const Color(0xFF3583BD)
                                  : const Color(0xFF666666),
                              size: 24.0,
                            ),
                          ),
                          const SizedBox(width: 16.0),

                          // Service name
                          Expanded(
                            child: Text(
                              service,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? const Color(0xFF3583BD)
                                    : Colors.black,
                              ),
                            ),
                          ),

                          // Check icon
                          if (isSelected)
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFF3583BD),
                              size: 24.0,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getServiceIcon(String service) {
    switch (service.toLowerCase()) {
      case 'plumbing':
        return Icons.plumbing;
      case 'painter':
        return Icons.format_paint;
      default:
        return Icons.work;
    }
  }
}

// SVG icon for dropdown arrow
const String _dropdownArrowSvg = '''
<svg viewBox="0 0 9.2 18.0">
  <path d="M 4.6 5.83 L 7.77 9 L 9.18 7.59 L 4.6 3 L 0.01 7.59 L 1.42 9 L 4.6 5.83 Z M 4.6 18.17 L 1.42 15 L 0.01 16.41 L 4.6 21 L 9.19 16.41 L 7.77 15 L 4.6 18.17 Z" fill="#95989a"/>
</svg>
''';
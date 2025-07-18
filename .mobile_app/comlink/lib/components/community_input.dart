import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommunityInput extends StatefulWidget {
  final TextEditingController controller;

  const CommunityInput({
    super.key,
    required this.controller,
  });

  @override
  State<CommunityInput> createState() => _CommunityInputState();
}

class _CommunityInputState extends State<CommunityInput> {
  String? _selectedCommunity;
  final List<String> _communities = [
    'Kumasi',
    'Accra',
    'Tamale',
    'Takoradi',
    'Cape Coast',
    'Tema',
    'Koforidua',
    'Sunyani',
    'Ho',
    'Wa',
  ];

  @override
  void initState() {
    super.initState();
    // Initialize selected community from controller if it has a value
    if (widget.controller.text.isNotEmpty) {
      _selectedCommunity = widget.controller.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCommunity,
          hint: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Community',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: const Color(0xffb8aaaa),
                letterSpacing: 1.12,
                height: 1.25,
              ),
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.string(
              _dropdownIcon,
              width: 12,
              height: 18,
            ),
          ),
          isExpanded: true,
          items: _communities.map((String community) {
            return DropdownMenuItem<String>(
              value: community,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  community,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Colors.black87,
                    letterSpacing: 1.12,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCommunity = newValue;
              // Update the controller with the selected value
              widget.controller.text = newValue ?? '';
            });
          },
          dropdownColor: Colors.white,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.black87,
            letterSpacing: 1.12,
          ),
          menuMaxHeight: 200,
        ),
      ),
    );
  }
}

const String _dropdownIcon = '''
<svg viewBox="0 0 12 18" width="12" height="18">
  <path d="M 6 3.83 L 9.17 7 L 10.58 5.59 L 6 1 L 1.41 5.59 L 2.83 7 L 6 3.83 Z M 6 14.17 L 2.83 11 L 1.42 12.41 L 6 17 L 10.59 12.41 L 9.17 11 L 6 14.17 Z" 
        fill="#95989a"/>
</svg>
''';
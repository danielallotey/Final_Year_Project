import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String specialty;
  final int bookmarks;
  final String? avatarPath;

  const ProductCard({
    super.key,
    this.name = 'Mohammed Muniru',
    this.specialty = 'Dentist Specialist',
    this.bookmarks = 543,
    this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 0.5, color: Colors.black),
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 35,
            backgroundImage: avatarPath != null
                ? AssetImage(avatarPath!)
                : const AssetImage('assets/images/avatar.png'),
          ),
          const SizedBox(width: 16),

          // Doctor Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xff215066),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  specialty,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color(0xff215066),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 8,
                      color: Color(0xff215066),
                    ),
                    children: [
                      TextSpan(
                        text: '$bookmarks',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(text: ' Bookmarks'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
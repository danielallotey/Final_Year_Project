import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/product_page.dart';
import '../components/regular_top_bar.dart';

class SocialAmenities extends StatefulWidget {
  const SocialAmenities({super.key});

  @override
  State<SocialAmenities> createState() => _SocialAmenitiesState();
}

class _SocialAmenitiesState extends State<SocialAmenities> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = '';

  static const List<String> _categories = [
    'Plumber',
    'Electrician',
    'Painter',
    'Carpenter'
  ];

  // Sample data - replace with actual data source
  final List<Map<String, dynamic>> _serviceProviders = [
    {
      'name': 'John Doe',
      'service': 'Electrician',
      'distance': '3.5km away',
      'rating': 4.5,
    },
    {
      'name': 'Jane Smith',
      'service': 'Plumber',
      'distance': '2.1km away',
      'rating': 4.8,
    },
    {
      'name': 'Mike Wilson',
      'service': 'Painter',
      'distance': '1.8km away',
      'rating': 4.2,
    },
    {
      'name': 'Sarah Johnson',
      'service': 'Carpenter',
      'distance': '4.2km away',
      'rating': 4.7,
    },
    {
      'name': 'David Brown',
      'service': 'Electrician',
      'distance': '5.0km away',
      'rating': 4.1,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredProviders {
    return _serviceProviders.where((provider) {
      final matchesSearch = _searchController.text.isEmpty ||
          provider['name'].toString().toLowerCase().contains(_searchController.text.toLowerCase()) ||
          provider['service'].toString().toLowerCase().contains(_searchController.text.toLowerCase());

      final matchesCategory = _selectedCategory.isEmpty ||
          provider['service'] == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const RegularTopBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 16),
                  _buildCategories(),
                  const SizedBox(height: 16),
                  _buildResultsHeader(),
                  const SizedBox(height: 8),
                  Expanded(child: _buildResults()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.string(
            _searchIcon,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                hintText: 'Search for a service...',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == category;

          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected
                  ? const Color(0xfff64743)
                  : const Color(0xfff2f2f2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              elevation: isSelected ? 2 : 0,
            ),
            onPressed: () {
              setState(() {
                _selectedCategory = isSelected ? '' : category;
              });
            },
            child: Text(
              category,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildResultsHeader() {
    final count = _filteredProviders.length;
    return Text(
      '$count service${count != 1 ? 's' : ''} found',
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildResults() {
    if (_filteredProviders.isEmpty) {
      return const Center(
        child: Text(
          'No services found',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: _filteredProviders.length,
      itemBuilder: (context, index) {
        return _buildServiceCard(_filteredProviders[index]);
      },
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> provider) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProductPage(),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xfff2f2f2),
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider['name'],
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${provider['service']} • ${provider['distance']}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          provider['rating'].toString(),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle phone call
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Calling ${provider['name']}...'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xff3583bd),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: SvgPicture.string(
                    _phoneIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SVG Icons
const String _phoneIcon = '''
<svg viewBox="0.0 0.0 21.1 21.1">
  <path fill="#FFFFFF" d="M16.4 13.7q.3-.3.7-.3t.7.3l2.1 2.1q.3.3.3.7t-.3.7l-1.4 1.4q-1 .9-2.3.9-1.2 0-2.8-.7-2.9-1.3-5.3-3.7T3.7 9.1q-1.4-2.3-2-4T1.2 3q0-1.3 1-2.3l1.3-1.3q.3-.3.7-.3t.7.3L6.9 2q.3.3.3.7t-.3.7L5.4 5.1q-.2.2-.2.5 0 .1.1.3 1 2.2 2.7 4 1.7 1.7 3.9 2.8.1.1.3.1.3 0 .5-.2l1.8-1.8q.3-.3.7-.3t.7.3l2.1 2.1z"/>
</svg>
''';

const String _searchIcon = '''
<svg viewBox="0 0 24 24" width="24" height="24">
  <path fill="#666666" d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
</svg>
''';
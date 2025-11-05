import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/dashboard_app_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7FB),
        body: DashboardAppBar(const SearchContent()),
      ),
    );
  }
}

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SearchHeader(),
          const SizedBox(height: 24),
          const _SearchBar(),
          const SizedBox(height: 24),
          _UserGrid(),
        ],
      ),
    );
  }
}

class _SearchHeader extends StatelessWidget {
  const _SearchHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 30.0,
            autoPlay: true,
            viewportFraction: 0.3,
            scrollDirection: Axis.horizontal,
            padEnds: false, // remove default padding at the ends
            enableInfiniteScroll: false,
            enlargeCenterPage: false,
          ),
          items: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'μlearners',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('Mentors', style: TextStyle(color: Colors.grey[600])),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Campuses',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Find & Connect',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Find and connect with like-minded students based on skills, interests, or institution. Collaborate, learn, and grow together in a vibrant community of peers.',
          style: TextStyle(color: Colors.blue[400], height: 1.5),
        ),
        const SizedBox(height: 4),
        Text(
          '*Only public profiles will be displayed here',
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search public profiles',
        hintStyle: TextStyle(color: Colors.grey[400]),
        prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 239, 239, 239),
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}

class _UserGrid extends StatelessWidget {
  final List<Map<String, dynamic>> users = const [
    {
      'name': 'ARCHIT RAVIKUMAR',
      'username': 'architravikumar@mulearn',
      'karma': '58,571',
      'imageUrl': 'https://picsum.photos/200',
      'tags': ['Entrepreneurship', 'Web Development', 'Strategic Leadership'],
    },
    {
      'name': 'Arjun C Vinod',
      'username': 'arjuncvinod@mulearn',
      'karma': '53,836',
      'imageUrl': 'https://picsum.photos/201',
      'tags': ['Web Development', 'Blockchain'],
    },
    {
      'name': 'Agnivesh P S',
      'username': 'agniveshos-1@mulearn',
      'karma': '53,026',
      'imageUrl': 'https://picsum.photos/202',
      'tags': ['Entrepreneurship', 'UI Ux', 'Project Management'],
    },
    {
      'name': 'K H Arjun',
      'username': 'arjunkh@mulearn',
      'karma': '52,649',
      'imageUrl': 'https://picsum.photos/203',
      'tags': ['UI Ux', 'AI', 'Web Development'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _UserCard(
              name: user['name'] as String,
              username: user['username'] as String,
              karma: user['karma'] as String,
              imageUrl: user['imageUrl'] as String,
              tags: (user['tags'] as List).cast<String>(),
            ),
          );
        },
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  final String name;
  final String username;
  final String karma;
  final String imageUrl;
  final List<String> tags;

  const _UserCard({
    required this.name,
    required this.username,
    required this.karma,
    required this.imageUrl,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                username,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text(
                    'Karma : ',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  Text(
                    karma,
                    style: const TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: tags.map((tag) => _TagChip(label: tag)).toList(),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({required this.label});

  Color _getTagColor() {
    switch (label.toLowerCase()) {
      case 'entrepreneurship':
        return Colors.pink[100]!;
      case 'web development':
        return Colors.green[100]!;
      case 'strategic leadership':
        return Colors.blue[100]!;
      case 'blockchain':
        return Colors.green[100]!;
      case 'ui ux':
        return Colors.pink[100]!;
      case 'project management':
        return Colors.blue[100]!;
      case 'ai':
        return Colors.purple[100]!;
      default:
        return Colors.grey[100]!;
    }
  }

  Color _getTextColor() {
    switch (label.toLowerCase()) {
      case 'entrepreneurship':
        return Colors.pink[900]!;
      case 'web development':
        return Colors.green[900]!;
      case 'strategic leadership':
        return Colors.blue[900]!;
      case 'blockchain':
        return Colors.green[900]!;
      case 'ui ux':
        return Colors.pink[900]!;
      case 'project management':
        return Colors.blue[900]!;
      case 'ai':
        return Colors.purple[900]!;
      default:
        return Colors.grey[900]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getTagColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(color: _getTextColor(), fontSize: 10),
      ),
    );
  }
}

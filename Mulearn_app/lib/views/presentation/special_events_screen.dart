import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/dashboard_app_bar.dart';

class SpecialEventsScreen extends StatelessWidget {
  const SpecialEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: DashboardAppBar(const SpecialEventsContent())),
    );
  }
}

class SpecialEventsContent extends StatelessWidget {
  const SpecialEventsContent({super.key});

  static const _images = [
    'https://app.mulearn.org/assets/top-100-EHBhEfQo.webp',
    'https://s3.ap-south-1.amazonaws.com/cdn.mulearn/src/modules/Public/Home/assets/launchpad.webp',
    'https://app.mulearn.org/assets/trivialideas-C5iEdCK7.webp',
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // cardWidth responsive: 320 on wide screens, otherwise ~ (width - padding)/1
    final cardWidth = width > 1000 ? 320.0 : (width - 48);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Special Events',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2D3A45),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Discover exclusive events designed to inspire innovation, enhance skills, and foster meaningful connections across technology, management, and creativity.',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF5B6B7A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          // Cards: use Wrap so they wrap on small screens
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: _images.map((img) => _eventCard(img, cardWidth)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _eventCard(String imageUrl, double cardWidth) {
    return SizedBox(
      width: cardWidth,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            // image area
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                alignment: Alignment.center,
                errorBuilder: (c, e, s) => Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            // Positioned button at bottom with pill shape
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Read More',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

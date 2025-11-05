import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/auth/login_screen.dart';
import 'package:flutter_application_1/views/auth/signup_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        endDrawer: Drawer(
          width: 250,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
            children: [
              ListTile(
                title: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.pop(context),
                dense: true,
                visualDensity: const VisualDensity(vertical: -1),
              ),
              ListTile(
                title: Text(
                  'Why μLearn?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.pop(context),
                dense: true,
                visualDensity: const VisualDensity(vertical: -1),
              ),
              ListTile(
                title: Text(
                  'Be A Part of Us',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.pop(context),
                dense: true,
                visualDensity: const VisualDensity(vertical: -1),
              ),
              ListTile(
                title: Text(
                  'Mentorship',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.pop(context),
                dense: true,
                visualDensity: const VisualDensity(vertical: -1),
              ),
              ListTile(
                title: Text(
                  'Learning',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.pop(context),
                dense: true,
                visualDensity: const VisualDensity(vertical: -1),
              ),
              ListTile(
                title: Text(
                  'Donate',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.pop(context),
                dense: true,
                visualDensity: const VisualDensity(vertical: -1),
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              // increase the AppBar height so header content sits taller
              toolbarHeight: 80,
              // ensure the leading area has enough horizontal space for a larger logo
              leadingWidth: 110,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  width: 60,
                  height: 20,
                  child: Image.asset(
                    'lib/assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              title: const SizedBox.shrink(),
              centerTitle: true,
              actions: [
                // Login pill button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 8.0,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF4B7CFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // Menu icon opens the endDrawer
                Builder(
                  builder: (ctx) => IconButton(
                    icon: Icon(
                      Icons.menu_rounded,
                      color: Colors.grey[700],
                      size: 30,
                    ),
                    onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                  ),
                ),
                const SizedBox(width: 6),
              ],
            ),
          ],
          body: const _HomeHero(),
        ),
      ),
    );
  }
}

class _HomeHero extends StatelessWidget {
  const _HomeHero();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        // calculate a responsive hero height
        final heroHeight = (constraints.maxHeight * 0.2).clamp(
          350.0,
          constraints.maxHeight,
        );

        return ListView(
          children: [
            // Hero stack with gradient, anchored illustration and centered title/button
            SizedBox(
              height: heroHeight,
              child: Stack(
                children: [
                  // gradient background
                  Container(
                    height: heroHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.blueGrey[50]!],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),

                  // anchored illustration at the bottom; scale to fit width
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'lib/assets/landing_page.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                  // centered headline near the top
                  Positioned(
                    top: 36,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Your Ultimate Gateway\n to ',
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        height: 1.4, // increased line spacing
                                      ),
                                ),
                                TextSpan(
                                  text: 'Peer-Led Growth',
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF4B7CFF),
                                        height: 1.4, // increased line spacing
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'An open community for learners, makers, and innovators',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4B7CFF),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Join μLearn',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      children: [
                        const TextSpan(text: 'What '),
                        TextSpan(
                          text: 'µLearn',
                          style: TextStyle(color: Colors.blue[400]),
                        ),
                        const TextSpan(text: ' offers'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'µLearn offers a wide range of features and opportunities that help you learn, grow, and upskill yourself in a fun and engaging way. Here are some of the key features that µLearn offers.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(
                    height: 300,
                    width: 400,
                    child: Swiper(
                      itemCount: 6,
                      pagination: const SwiperPagination(),
                      control: const SwiperControl(),
                      itemBuilder: (context, index) {
                        final List<Map<String, String>> featureTitles = [
                          {
                            'Community': 'Join 60,000+ learners & innovators.',
                            'color': 'blue',
                          },
                          {
                            'Mentors':
                                'Learn from those ahead of you, mentor those behind you.',
                            'color': 'orange',
                          },
                          {
                            'Interest Groups':
                                'Connect with like-minded people who share your interests',
                            'color': 'green',
                          },
                          {
                            'Roadmaps':
                                'Structured learning paths for skill mastery.',
                            'color': 'yellow',
                          },
                          {
                            'Challenges':
                                'Engage in real-world problem-solving.',
                            'color': 'purple',
                          },
                          {
                            'Opportunities':
                                'Discover Gigs, Jobs, and best opportunities around you.',
                            'color': 'turquoise',
                          },
                        ];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.all(16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: featureTitles[index]['color'] == 'blue'
                                    ? Colors.blue[50]
                                    : featureTitles[index]['color'] == 'green'
                                    ? Colors.green[50]
                                    : featureTitles[index]['color'] == 'orange'
                                    ? Colors.orange[50]
                                    : featureTitles[index]['color'] == 'purple'
                                    ? Colors.purple[50]
                                    : featureTitles[index]['color'] == 'yellow'
                                    ? Colors.yellow[50]
                                    : const Color.fromARGB(255, 188, 250, 248),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    featureTitles[index].keys.first,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    featureTitles[index].values.first,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.only(top: 8),
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      children: [
                        const TextSpan(text: 'Understand μLearn with a '),
                        TextSpan(
                          text: 'Story',
                          style: TextStyle(color: Colors.blue[400]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Meet Aami, an eager learner hungry for growth! Join her voyage through the captivating µVerse, where she seizes opportunities, builds learning circles, and immerses herself in events, emerging industry-ready with newfound skills and confidence.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Special Events',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Discover exclusive events designed to inspire innovation, enhance skills, and foster meaningful connections across technology, management, and creativity.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 24),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 800,
                      ),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: [
                      Card(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://app.mulearn.org/assets/top-100-EHBhEfQo.webp',
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                              ),
                            ),
                            const SizedBox(height: 8),
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
                      Card(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://s3.ap-south-1.amazonaws.com/cdn.mulearn/src/modules/Public/Home/assets/launchpad.webp',
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                              ),
                            ),
                            const SizedBox(height: 8),
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
                      Card(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://app.mulearn.org/assets/trivialideas-C5iEdCK7.webp',
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                              ),
                            ),
                            const SizedBox(height: 8),
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
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Footer
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey[300]!, width: 1),
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 28,
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Quick Links
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Quick Links
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Quick Links',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.centerLeft,
                                      ),
                                      child: Text(
                                        'Blog',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.centerLeft,
                                      ),
                                      child: Text(
                                        'Team',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.centerLeft,
                                      ),
                                      child: Text(
                                        'Career Labs',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.centerLeft,
                                      ),
                                      child: Text(
                                        'Interest Groups',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Legal
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Legal  ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Terms and Conditions',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Privacy Policy',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            // Follow Us
                            Text(
                              'Follow Us',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.link),
                                  color: Colors.grey[800],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.camera_alt),
                                  color: Colors.grey[800],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.play_arrow),
                                  color: Colors.grey[800],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.facebook),
                                  color: Colors.grey[800],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Bottom centered copyright / contact block
                        Column(
                          children: [
                            Text(
                              'μLearn Foundation | Copyright © 2025 All rights reserved.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Technopark Phase 1, Thiruvananthapuram, Kerala - 695581',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('info@mulearn.org'),
                                ),
                                const Text(
                                  '|',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('+91 89436 47000'),
                                ),
                                const Text(
                                  '|',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('www.mulearn.org'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

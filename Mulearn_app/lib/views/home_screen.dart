import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/auth/login_screen.dart';
import 'package:flutter_application_1/views/auth/signup_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Use an endDrawer so the menu icon opens a right-side sidebar like the design
        endDrawer: Drawer(
          width: 250,
          child: SafeArea(
            child: Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
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
          body: _HomeHero(),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class _HomeHero extends StatelessWidget {
  const _HomeHero({Key? key}) : super(key: key);

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

            // White content area that follows the hero
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
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

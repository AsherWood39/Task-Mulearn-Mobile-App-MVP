import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_screen.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../../widgets/dashboard_app_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static String currentMenu = 'Home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', User 👋',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CODER', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.blue[400]!),
                    ),
                    child: PopupMenuButton(
                      icon: Icon(Icons.person, color: Colors.blue[400]),
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.black87),
                            title: Text('Profile'),
                            onTap: () {
                              Navigator.pop(
                                context,
                              ); // Close the popup menu first
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(), // Temporarily redirecting to HomeScreen
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'logout',
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the popup menu
                              // Handle logout
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawerIconColor: Colors.black87,
            ),
          ),
          slider: _SidebarMenu(),
          child: _DashboardContent(),
        ),
      ),
    );
  }
}

class _SidebarMenu extends StatelessWidget {
  const _SidebarMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Image.asset('lib/assets/logo.png', height: 36),
          ),
          const SizedBox(height: 12),
          _menuItem(context, Icons.home, 'Home', () {
            _updateContent(context, 'Home', _DashboardContent());
          }),
          _menuItem(context, Icons.person, 'Profile', () {
            _updateContent(context, 'Profile', const ProfileScreen());
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }),
          _menuItem(context, Icons.timeline, 'μJourney', () {
            _updateContent(context, 'μJourney', const JourneyScreen());
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JourneyScreen()),
            );
          }),
          _menuItem(context, Icons.group, 'Interest Groups', () {
            _updateContent(
              context,
              'Interest Groups',
              const Center(child: Text('Interest Groups')),
            );
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InterestGroupsScreen(),
              ),
            );
          }),
          _menuItem(context, Icons.people, 'Learning Circle', () {
            _updateContent(
              context,
              'Learning Circle',
              const Center(child: Text('Learning Circle')),
            );
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LearningCircleScreen(),
              ),
            );
          }),
          _menuItem(context, Icons.search, 'Search', () {
            _updateContent(context, 'Search', const SearchScreen());
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            );
          }),
          _menuItem(context, Icons.emoji_events, 'Leaderboard', () {
            _updateContent(
              context,
              'Leaderboard',
              const Center(child: Text('Leaderboard')),
            );
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LeaderboardScreen(),
              ),
            );
          }),
          _menuItem(context, Icons.rocket_launch, 'Launchpad', () {
            _updateContent(
              context,
              'Launchpad',
              const Center(child: Text('Launchpad')),
            );
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LaunchpadScreen()),
            );
          }),
          _menuItem(context, Icons.event, 'Special Events', () {
            _updateContent(
              context,
              'Special Events',
              const Center(child: Text('Special Events')),
            );
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SpecialEventsScreen(),
              ),
            );
          }),
          _menuItem(context, Icons.menu_book, 'Courses', () {
            _updateContent(
              context,
              'Courses',
              const Center(child: Text('Courses')),
            );
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CoursesScreen()),
            );
          }),
          const Spacer(),
          _menuItem(context, Icons.settings, 'Account Setting', () {
            _updateContent(context, 'Account Setting', SettingsScreen());
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          }),
          const SizedBox(height: 8),
          _menuItem(context, Icons.logout, 'Logout', () {
            // Handle logout
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
          }),
        ],
      ),
    );
  }

  void _updateContent(BuildContext context, String menuName, Widget content) {
    DashboardScreen.currentMenu = menuName;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
    final sliderState = context.findAncestorStateOfType<SliderDrawerState>();
    sliderState?.closeSlider();
  }

  Widget _menuItem(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) => InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: DashboardScreen.currentMenu == label
            ? Colors.blue.withOpacity(0.1)
            : Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: DashboardScreen.currentMenu == label
                ? Colors.blue
                : Colors.grey[800],
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: DashboardScreen.currentMenu == label
                  ? Colors.blue
                  : Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF3B76FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome User 👋',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This dashboard is being updated. Expect improvements and possible bugs. Thanks for your patience!',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Start Learning'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Join Learning',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Learning Circles',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Flutter Developers',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Join us to explore \nFlutter development!',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'View Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const SizedBox(height: 18),

              // Right sidebar cards
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Karma Earners',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: const Color.fromARGB(255, 145, 145, 145),
                      ),
                    ),
                    color: const Color.fromARGB(154, 192, 253, 253),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Highest Karma Earner (Student)',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'shiyas ps\nshiyasps@mulearn',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Karma: 22214',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: const Color.fromARGB(255, 145, 145, 145),
                      ),
                    ),
                    color: const Color.fromARGB(107, 201, 252, 228),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Highest Karma Earner (College/Organization)',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Mar Baselios College of Engineering and Technology',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Karma: 109203',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Interest groups in coder',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Show more >',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: const Color.fromARGB(255, 174, 173, 173),
                      ),
                    ),
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        leading: CircleAvatar(child: Icon(Icons.person)),
                        title: Text('DEVOPS'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.blue[800],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: const Color.fromARGB(255, 174, 173, 173),
                      ),
                    ),
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        leading: CircleAvatar(child: Icon(Icons.person)),
                        title: Text('GAME DEV'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.blue[800],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: const Color.fromARGB(255, 174, 173, 173),
                      ),
                    ),
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        leading: CircleAvatar(child: Icon(Icons.person)),
                        title: Text('CYBER SECURITY'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.blue[800],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: const Color.fromARGB(255, 174, 173, 173),
                      ),
                    ),
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        leading: CircleAvatar(child: Icon(Icons.person)),
                        title: Text('WEB DEVELOPMENT'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.blue[800],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', User 👋',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CODER', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.blue[400]!),
                    ),
                    child: PopupMenuButton(
                      icon: Icon(Icons.person, color: Colors.blue[400]),
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.black87),
                            title: Text('Profile'),
                            onTap: () {
                              Navigator.pop(
                                context,
                              ); // Close the popup menu first
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(), // Temporarily redirecting to HomeScreen
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'logout',
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the popup menu
                              // Handle logout
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawerIconColor: Colors.black87,
            ),
          ),
          slider: _SidebarMenu(),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _ProfileCard(),
              const SizedBox(height: 24),
              _ProfileTabBar(),
              const SizedBox(height: 24),
              _StatsSection(),
              const SizedBox(height: 24),
              _InterestGroupSection(),
              const SizedBox(height: 24),
              _ContributionHeatmap(),
              const SizedBox(height: 24),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _ProfileSettings(),
                    const SizedBox(height: 24),
                    _ExistingRoles(),
                    const SizedBox(height: 24),
                    _KarmaDistribution(),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(flex: 2, child: _RecentActivity()),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(decoration: BoxDecoration(color: Colors.blueGrey)),
        Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.blueGrey),
                color: Colors.blue[50],
              ),
              child: Icon(Icons.person, size: 50, color: Colors.blueGrey),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'User (USR)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'user@mulearn',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    'LEVEL 1',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _ProfileTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _TabButton(label: 'Basic Details', isSelected: true, onTap: () {}),
          _TabButton(label: 'Karma History', isSelected: false, onTap: () {}),
          _TabButton(label: 'Mu Voyage', isSelected: false, onTap: () {}),
          _TabButton(label: 'Achievements', isSelected: false, onTap: () {}),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.grey[600],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            if (isSelected) Container(height: 2, width: 40, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}

class _StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatCard(
            icon: Icons.workspace_premium,
            value: '8.19K',
            label: 'Karma',
          ),
          _StatCard(
            icon: Icons.show_chart,
            value: '390',
            label: 'Avg.Karma/Month',
          ),
          _StatCard(icon: Icons.military_tech, value: '531', label: 'Rank'),
          _StatCard(icon: Icons.percent, value: '0.75', label: 'Percentile'),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }
}

class _InterestGroupSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Interest Groups',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _InterestChip(label: 'Data Structures and Algorithm', value: '0'),
              _InterestChip(label: 'Mobile Development', value: '2.0K'),
              _InterestChip(label: 'UI Ux', value: '1.1K'),
            ],
          ),
        ],
      ),
    );
  }
}

class _InterestChip extends StatelessWidget {
  final String label;
  final String value;

  const _InterestChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _getChipColor(label),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: _getTextColor(label),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: _getBadgeColor(label),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getChipColor(String label) {
    if (label.contains('Data Structures')) return Colors.orange[50]!;
    if (label.contains('Mobile')) return Colors.pink[50]!;
    return Colors.cyan[50]!;
  }

  Color _getTextColor(String label) {
    if (label.contains('Data Structures')) return Colors.orange;
    if (label.contains('Mobile')) return Colors.pink;
    return Colors.cyan;
  }

  Color _getBadgeColor(String label) {
    if (label.contains('Data Structures')) return Colors.orange;
    if (label.contains('Mobile')) return Colors.pink;
    return Colors.cyan;
  }
}

class _ContributionHeatmap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Contribution Heatmap',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('2024', style: TextStyle(fontSize: 12)),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      '2025',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildHeatmapGrid(),
        ],
      ),
    );
  }

  Widget _buildHeatmapGrid() {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final days = ['Mon', 'Wed', 'Fri'];

    return Column(
      children: [
        // Month labels
        Row(
          children: [
            const SizedBox(width: 40),
            ...months.map(
              (month) => Expanded(
                child: Text(
                  month,
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Grid with day labels
        ...List.generate(3, (rowIndex) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    days[rowIndex],
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  ),
                ),
                ...List.generate(52, (colIndex) {
                  final hasActivity =
                      (rowIndex == 1 &&
                      (colIndex == 5 ||
                          colIndex == 18 ||
                          colIndex == 25 ||
                          colIndex == 30));
                  return Expanded(
                    child: Container(
                      height: 12,
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: hasActivity ? Colors.green : Colors.grey[200],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _ProfileSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Profile Settings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _SettingsSwitch(title: 'Switch to public profile', value: true),
          _SettingsSwitch(title: 'Open to work', value: false),
          _SettingsSwitch(title: 'Open to gigs', value: true),
        ],
      ),
    );
  }
}

class _SettingsSwitch extends StatefulWidget {
  final String title;
  final bool value;

  const _SettingsSwitch({required this.title, required this.value});

  @override
  State<_SettingsSwitch> createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<_SettingsSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title),
          Switch(
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class _ExistingRoles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Existing Roles',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Student, Command Ninja, Scratch Mastery, Git Lord',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class _KarmaDistribution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Karma Distribution',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: Row(
              children: [
                Expanded(flex: 3, child: _PieChart()),
                Expanded(flex: 2, child: _PieChartLegend()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(200, 200), painter: _PieChartPainter());
  }
}

class _PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()..style = PaintingStyle.fill;

    final data = [
      {'color': Colors.blue, 'percentage': 0.445},
      {'color': Colors.pink, 'percentage': 0.218},
      {'color': Colors.green, 'percentage': 0.17},
      {'color': Colors.orange, 'percentage': 0.167},
    ];

    double startAngle = -1.57; // Start from top
    for (var item in data) {
      final sweepAngle = (item['percentage'] as double) * 2 * 3.14159;
      paint.color = item['color'] as Color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PieChartLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LegendItem(
          color: Colors.blue,
          label: 'General Enablement',
          percentage: '44.5%',
        ),
        _LegendItem(
          color: Colors.pink,
          label: 'Mobile Development',
          percentage: '21.8%',
        ),
        _LegendItem(color: Colors.green, label: 'UI/UX', percentage: '17%'),
        _LegendItem(color: Colors.orange, label: 'Other', percentage: '16.7%'),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String percentage;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(label, style: const TextStyle(fontSize: 11))),
          Text(
            percentage,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Activity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text('View More')),
            ],
          ),
          const SizedBox(height: 16),
          _ActivityItem(
            icon: Icons.emoji_events,
            title: '400 awarded for 30 Days Coding Challenge.',
            time: '3 months ago',
          ),
          _ActivityItem(
            icon: Icons.emoji_events,
            title: '400 awarded for Google AI Pro Student Pack Free.',
            time: '3 months ago',
          ),
          _ActivityItem(
            icon: Icons.emoji_events,
            title: '200 awarded for Flutter Bootcamp.',
            time: '4 months ago',
          ),
          _ActivityItem(
            icon: Icons.emoji_events,
            title: '400 awarded for Lock and Key.',
            time: '4 months ago',
          ),
          _ActivityItem(
            icon: Icons.emoji_events,
            title: '400 awarded for Lock and Key.',
            time: '4 months ago',
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;

  const _ActivityItem({
    required this.icon,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.blue, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder for EditProfileScreen
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: const Center(child: Text('Edit Profile Screen')),
    );
  }
}

class JourneyScreen extends StatelessWidget {
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', User 👋',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CODER', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.blue[400]!),
                    ),
                    child: PopupMenuButton(
                      icon: Icon(Icons.person, color: Colors.blue[400]),
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.black87),
                            title: Text('Profile'),
                            onTap: () {
                              Navigator.pop(
                                context,
                              ); // Close the popup menu first
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(), // Temporarily redirecting to HomeScreen
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'logout',
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the popup menu
                              // Handle logout
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawerIconColor: Colors.black87,
            ),
          ),
          slider: _SidebarMenu(),
          child: Container(
            color: const Color(0xFFF6F7FB),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 50.0,
                      viewportFraction:
                          0.33, // show more items per screen to reduce gaps
                      padEnds: false, // remove default padding at the ends
                      enableInfiniteScroll: false,
                      enlargeCenterPage: false,
                    ),
                    items: [
                      _JourneyTabButton(
                        isSelected: false,
                        label: 'Become Expert',
                        onPressed: () {},
                      ),
                      _JourneyTabButton(
                        isSelected: false,
                        label: 'Event',
                        onPressed: () {},
                      ),
                      _JourneyTabButton(
                        isSelected: true,
                        label: 'Start Journey',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      _LevelSection(
                        level: 'Level 1',
                        subtitle: 'Fundamentals and OnBoarding',
                        tasks: [
                          _Task(
                            status: 'completed',
                            title: 'Self Introduction',
                            description:
                                'This karma is for submitting introductio...',
                            interestGroup: 'General Tasks',
                            karma: 20,
                            hashtag: '#ge-self-intro',
                          ),
                          _Task(
                            status: 'pending',
                            title: 'Discord Guide',
                            description:
                                'Welcome to your first adventure on our p...',
                            interestGroup: 'General Tasks',
                            karma: 100,
                            hashtag: '#ge-discord-guide',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _JourneyTabButton extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback onPressed;

  const _JourneyTabButton({
    required this.isSelected,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFF3B76FF) : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black87,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelected ? Colors.transparent : Colors.grey[300]!,
          ),
        ),
      ),
      child: Text(label),
    );
  }
}

class _LevelSection extends StatelessWidget {
  final String level;
  final String subtitle;
  final List<_Task> tasks;

  const _LevelSection({
    required this.level,
    required this.subtitle,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          level,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        const SizedBox(height: 16),
        ...tasks
            .map(
              (task) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: _TaskCard(task: task),
              ),
            )
            .toList(),
      ],
    );
  }
}

class _Task {
  final String status;
  final String title;
  final String description;
  final String interestGroup;
  final int karma;
  final String hashtag;

  const _Task({
    required this.status,
    required this.title,
    required this.description,
    required this.interestGroup,
    required this.karma,
    required this.hashtag,
  });
}

class _TaskCard extends StatelessWidget {
  final _Task task;

  const _TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: task.status == 'completed'
                        ? const Color(0xFFE8F5E9)
                        : const Color(0xFFFFF8E1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    task.status,
                    style: TextStyle(
                      color: task.status == 'completed'
                          ? Colors.green[700]
                          : Colors.orange[800],
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  task.description,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Interest Group:',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      task.interestGroup,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Karma:',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      task.karma.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Hashtag:',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(width: 4),
                    Text(task.hashtag, style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[200]!)),
            ),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF3B76FF),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: const RoundedRectangleBorder(),
              ),
              child: const Text('View'),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7FB),
        body: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', User 👋',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CODER', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.blue[400]!),
                    ),
                    child: PopupMenuButton(
                      icon: Icon(Icons.person, color: Colors.blue[400]),
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.black87),
                            title: Text('Profile'),
                            onTap: () {
                              Navigator.pop(
                                context,
                              ); // Close the popup menu first
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(), // Temporarily redirecting to HomeScreen
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'logout',
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the popup menu
                              // Handle logout
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawerIconColor: Colors.black87,
            ),
          ),
          slider: _SidebarMenu(),
          child: Padding(
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
          ),
        ),
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
            color: Colors.black.withOpacity(0.05),
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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', User 👋',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CODER', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.blue[400]!),
                    ),
                    child: PopupMenuButton(
                      icon: Icon(Icons.person, color: Colors.blue[400]),
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.black87),
                            title: Text('Profile'),
                            onTap: () {
                              Navigator.pop(
                                context,
                              ); // Close the popup menu first
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(), // Temporarily redirecting to HomeScreen
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'logout',
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the popup menu
                              // Handle logout
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawerIconColor: Colors.black87,
            ),
          ),
          slider: _SidebarMenu(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Change Password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter your current password, then a new password, and confirm it to change.',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 24),
                _PasswordField(
                  label: 'Current Password',
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                _PasswordField(label: 'New Password', onChanged: (value) {}),
                const SizedBox(height: 16),
                _PasswordField(
                  label: 'Confirm New Password',
                  onChanged: (value) {},
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B76FF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Change Password'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatefulWidget {
  final String label;
  final ValueChanged<String> onChanged;

  const _PasswordField({required this.label, required this.onChanged});

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey[600],
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}

class InterestGroupsScreen extends StatelessWidget {
  const InterestGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', User 👋',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CODER', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.blue[400]!),
                    ),
                    child: PopupMenuButton(
                      icon: Icon(Icons.person, color: Colors.blue[400]),
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.black87),
                            title: Text('Profile'),
                            onTap: () {
                              Navigator.pop(
                                context,
                              ); // Close the popup menu first
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(), // Temporarily redirecting to HomeScreen
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'logout',
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the popup menu
                              // Handle logout
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawerIconColor: Colors.black87,
            ),
          ),
          backgroundColor: Colors.white,
          slider: _SidebarMenu(),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: const Center(
              child: Text(
                'Nothing to show here yet!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LearningCircleScreen extends StatelessWidget {
  const LearningCircleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', User 👋',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CODER', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.blue[400]!),
                    ),
                    child: PopupMenuButton(
                      icon: Icon(Icons.person, color: Colors.blue[400]),
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.black87),
                            title: Text('Profile'),
                            onTap: () {
                              Navigator.pop(
                                context,
                              ); // Close the popup menu first
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(), // Temporarily redirecting to HomeScreen
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'logout',
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the popup menu
                              // Handle logout
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawerIconColor: Colors.black87,
            ),
          ),
          backgroundColor: Colors.white,
          slider: _SidebarMenu(),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: const Center(
              child: Text(
                'Nothing to show here yet!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', User 👋',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CODER', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.blue[400]!),
                    ),
                    child: PopupMenuButton(
                      icon: Icon(Icons.person, color: Colors.blue[400]),
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.black87),
                            title: Text('Profile'),
                            onTap: () {
                              Navigator.pop(
                                context,
                              ); // Close the popup menu first
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(), // Temporarily redirecting to HomeScreen
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'logout',
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the popup menu
                              // Handle logout
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawerIconColor: Colors.black87,
            ),
          ),
          backgroundColor: Colors.white,
          slider: _SidebarMenu(),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: const Center(
              child: Text(
                'Nothing to show here yet!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LaunchpadScreen extends StatelessWidget {
  const LaunchpadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', User 👋',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CODER', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.blue[400]!),
                    ),
                    child: PopupMenuButton(
                      icon: Icon(Icons.person, color: Colors.blue[400]),
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.black87),
                            title: Text('Profile'),
                            onTap: () {
                              Navigator.pop(
                                context,
                              ); // Close the popup menu first
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(), // Temporarily redirecting to HomeScreen
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'logout',
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the popup menu
                              // Handle logout
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawerIconColor: Colors.black87,
            ),
          ),
          backgroundColor: Colors.white,
          slider: _SidebarMenu(),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: const Center(
              child: Text(
                'Nothing to show here yet!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SpecialEventsScreen extends StatelessWidget {
  const SpecialEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', User 👋',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CODER', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.blue[400]!),
                    ),
                    child: PopupMenuButton(
                      icon: Icon(Icons.person, color: Colors.blue[400]),
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.black87),
                            title: Text('Profile'),
                            onTap: () {
                              Navigator.pop(
                                context,
                              ); // Close the popup menu first
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(), // Temporarily redirecting to HomeScreen
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'logout',
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the popup menu
                              // Handle logout
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawerIconColor: Colors.black87,
            ),
          ),
          backgroundColor: Colors.white,
          slider: _SidebarMenu(),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: const Center(
              child: Text(
                'Nothing to show here yet!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ', User 👋',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CODER', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.blue[400]!),
                    ),
                    child: PopupMenuButton(
                      icon: Icon(Icons.person, color: Colors.blue[400]),
                      onSelected: (value) {
                        // Handle menu item selection
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.black87),
                            title: Text('Profile'),
                            onTap: () {
                              Navigator.pop(
                                context,
                              ); // Close the popup menu first
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen(), // Temporarily redirecting to HomeScreen
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'logout',
                          child: ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the popup menu
                              // Handle logout
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawerIconColor: Colors.black87,
            ),
          ),
          backgroundColor: Colors.white,
          slider: _SidebarMenu(),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: const Center(
              child: Text(
                'Nothing to show here yet!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

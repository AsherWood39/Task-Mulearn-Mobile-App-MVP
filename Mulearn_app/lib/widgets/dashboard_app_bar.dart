import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/presentation/courses_screen.dart';
import 'package:flutter_application_1/views/presentation/interest_group_screen.dart';
import 'package:flutter_application_1/views/presentation/journey_screen.dart';
import 'package:flutter_application_1/views/presentation/dashboard_screen.dart';
import 'package:flutter_application_1/views/presentation/launchpad_screen.dart';
import 'package:flutter_application_1/views/presentation/leaderborad_screen.dart';
import 'package:flutter_application_1/views/presentation/learning_circle_screen.dart';
import 'package:flutter_application_1/views/presentation/profile_screen.dart';
import 'package:flutter_application_1/views/presentation/search_screen.dart';
import 'package:flutter_application_1/views/presentation/settings_screen.dart';
import 'package:flutter_application_1/views/presentation/special_events_screen.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../views/home_screen.dart';

class DashboardAppBar extends StatelessWidget {
  final Widget widget;
  const DashboardAppBar(this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building DashboardAppBar'); // Debug print
    try {
      return SliderDrawer(
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
                    backgroundColor: MaterialStatePropertyAll(Colors.blue[400]),
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
                                    ProfileScreen(), // Temporarily redirecting to ProfileScreen
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
                                builder: (context) => HomeScreen(),
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
        child: widget,
      );
    } catch (e) {
      debugPrint('Error building DashboardAppBar: $e');
      return AppBar(
        backgroundColor: Colors.white,
        title: const Text('Dashboard'),
        iconTheme: const IconThemeData(color: Colors.black87),
      );
    }
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
            _updateContent(context, 'Home', DashboardContent());
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
            ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
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

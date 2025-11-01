import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../views/home_screen.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building DashboardAppBar'); // Debug print
    try {
      return SliderAppBar(
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
                          Navigator.pop(context); // Close the popup menu first
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

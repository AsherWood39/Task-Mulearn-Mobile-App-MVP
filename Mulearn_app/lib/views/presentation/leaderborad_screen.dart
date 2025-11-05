import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/dashboard_app_bar.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: DashboardAppBar(const LeaderboardContent())),
    );
  }
}

class LeaderboardContent extends StatelessWidget {
  const LeaderboardContent({super.key});

  final List<Map<String, dynamic>> _rows = const [
    {'rank': 4, 'name': 'AYSHA SALIHA', 'karma': 601},
    {'rank': 5, 'name': 'anandhithaa.k', 'karma': 600},
    {'rank': 6, 'name': 'Bharath Krishna A B', 'karma': 600},
    {'rank': 7, 'name': 'Fabin Jacob', 'karma': 570},
    {'rank': 8, 'name': 'Muhammed Humraz', 'karma': 561},
    {'rank': 9, 'name': 'Chris Thomas Abraham', 'karma': 553},
    {'rank': 10, 'name': 'Suhaif Subair', 'karma': 450},
    {'rank': 11, 'name': 'Jushya Johnse', 'karma': 450},
    {'rank': 12, 'name': 'Alvin Dennis', 'karma': 448},
    {'rank': 13, 'name': 'Karthik Krishnan', 'karma': 404},
    {'rank': 14, 'name': 'Ansa Biju', 'karma': 400},
    {'rank': 15, 'name': 'Kalyani M G', 'karma': 400},
    {'rank': 16, 'name': 'Sooraj D S', 'karma': 400},
    {'rank': 17, 'name': 'Neha Reji Thomas', 'karma': 400},
    {'rank': 18, 'name': 'Adwaith Ramesh', 'karma': 400},
    {'rank': 19, 'name': 'Mohit Pillai', 'karma': 400},
    {'rank': 20, 'name': 'Ananda Gopan B S', 'karma': 332},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top controls: Tabs (Monthly/Overall) and role dropdown
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            children: [
              // Simple tabs imitation
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    _buildTab(context, 'Monthly', true),
                    _buildTab(context, 'Overall', false),
                  ],
                ),
              ),
              const Spacer(),
              // Role dropdown (Student)
              DropdownButton<String>(
                value: 'Student',
                items: const [
                  DropdownMenuItem(value: 'Student', child: Text('Student')),
                  DropdownMenuItem(value: 'All', child: Text('All')),
                ],
                onChanged: (_) {},
                underline: const SizedBox.shrink(),
              ),
            ],
          ),
        ),

        // Top 3 spotlight
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTopUser(
                  'Sadhika Dinesh',
                  '850 Karma pts',
                  'Gold',
                  Colors.amber,
                ),
                const SizedBox(width: 20),
                _buildTopUser(
                  'shiyas ps',
                  '1,774 Karma pts',
                  'Diamond',
                  Colors.cyan,
                ),
                const SizedBox(width: 20),
                _buildTopUser(
                  'THOMAS JACOB',
                  '602 Karma pts',
                  'Silver',
                  Colors.blueGrey,
                ),
              ],
            ),
          ),
        ),

        const Divider(height: 1),

        // Column headers
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            children: const [
              SizedBox(
                width: 40,
                child: Text(
                  'Rank',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  'Monthly Karma',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),

        const Divider(height: 1),

        // Leaderboard list
        Expanded(
          child: ListView.separated(
            itemCount: _rows.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = _rows[index];
              return ListTile(
                leading: SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      '${item['rank']}',
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: const NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPO5CvTL79PoqndYQgx3k34A2ETEmkZGCxfg&s',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(child: Text(item['name'])),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${item['karma']}',
                      style: const TextStyle(color: Colors.green),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_drop_up, color: Colors.green),
                  ],
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTab(BuildContext context, String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.blue.withAlpha(30) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.blue : Colors.black,
          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildTopUser(
    String name,
    String karma,
    String badge,
    Color badgeColor,
  ) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: const NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtKo3DRYU85GpZIcgefsrYnWNY2im4xLtJyQ&s',
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 2),
        Text(
          karma,
          style: const TextStyle(fontSize: 11, color: Colors.black54),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: badgeColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            badge,
            style: TextStyle(
              color: badgeColor,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

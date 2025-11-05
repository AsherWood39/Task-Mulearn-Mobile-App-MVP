import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/dashboard_app_bar.dart';

class InterestGroupsScreen extends StatelessWidget {
  const InterestGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: DashboardAppBar(const InterestGroupsContent())),
    );
  }
}

class InterestGroupsContent extends StatelessWidget {
  const InterestGroupsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1000 ? 4 : (width > 700 ? 3 : 2);

    final groups = <_InterestGroup>[
      _InterestGroup('UI/UX Design', 'Creative design', 5600, [
        Color(0xFF0f172a),
        Color(0xFF5b21b6),
      ]),
      _InterestGroup('Web Development', 'Frontend & Backend', 10227, [
        Color(0xFF6d28d9),
        Color(0xFF7c3aed),
      ]),
      _InterestGroup('Cyber Security', 'SecOps & Tools', 8307, [
        Color(0xFF0ea5a4),
        Color(0xFF06b6d4),
      ]),
      _InterestGroup('Game Development', 'Gameplay & Engines', 64, [
        Color(0xFF7c2d12),
        Color(0xFFb91c1c),
      ]),
      _InterestGroup(
        'Internet Of Things (IOT) And Robotics',
        'Embedded & Robotics',
        3209,
        [Color(0xFF0f172a), Color(0xFF0ea5a4)],
      ),
      _InterestGroup('Digital Marketing', 'Growth & Ads', 35, [
        Color(0xFF7c3aed),
        Color(0xFFa78bfa),
      ]),
      _InterestGroup('Cloud And DevOps', 'Infra & CI/CD', 1113, [
        Color(0xFF16a34a),
        Color(0xFF059669),
      ]),
      _InterestGroup('Product Management', 'Roadmaps & Strategy', 2216, [
        Color(0xFF0f172a),
        Color(0xFF0891b2),
      ]),
      _InterestGroup('Entrepreneurship', 'Startups & Founders', 2520, [
        Color(0xFF312e81),
        Color(0xFF4338ca),
      ]),
      _InterestGroup('AR/VR', 'Immersive tech', 806, [
        Color(0xFF5b21b6),
        Color(0xFF7c3aed),
      ]),
      _InterestGroup('Data Science', 'ML & Analytics', 4100, [
        Color(0xFF0369a1),
        Color(0xFF0891b2),
      ]),
      _InterestGroup('Mobile Development', 'iOS & Android', 1500, [
        Color(0xFF7c3aed),
        Color(0xFF6d28d9),
      ]),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text(
            'Discover Interest Groups',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Join communities that share your passion',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search interest groups...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: groups.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              final g = groups[index];
              return _InterestCard(group: g);
            },
          ),
        ],
      ),
    );
  }
}

class _InterestGroup {
  final String title;
  final String subtitle;
  final int members;
  final List<Color> colors;
  const _InterestGroup(this.title, this.subtitle, this.members, this.colors);
}

class _InterestCard extends StatelessWidget {
  final _InterestGroup group;
  const _InterestCard({required this.group});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // gradient header
            Container(
              height: 88,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: group.colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  group.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // content area
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      group.subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.group, size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(
                          '${group.members} members',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

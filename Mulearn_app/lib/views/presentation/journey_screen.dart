import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/dashboard_app_bar.dart';

class JourneyScreen extends StatelessWidget {
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: DashboardAppBar(const JourneyContent())),
    );
  }
}

class JourneyContent extends StatelessWidget {
  const JourneyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(12),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
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
                  isSelected: true,
                  label: 'Start Journey',
                  onPressed: () {},
                ),
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF3B76FF) : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.grey[400],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Center(child: Text(label, style: const TextStyle(fontSize: 10))),
      ),
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
            color: Colors.black.withAlpha(12),
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

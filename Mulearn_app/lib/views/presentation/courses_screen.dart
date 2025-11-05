import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/dashboard_app_bar.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: DashboardAppBar(const CoursesContent())),
    );
  }
}

class CoursesContent extends StatelessWidget {
  const CoursesContent({super.key});

  final List<Map<String, String>> _courses = const [
    {
      'title': 'Effective Speaking and Listening Skills',
      'desc':
          '"Effective Speaking and Listening Skills" is a comprehensive program that enhances your communicatio...',
      'duration': 'Duration: 9.75hrs',
    },
    {
      'title': 'Impactful Writing Skills',
      'desc':
          'This writing course focuses on improving written communication skills. It begins with the basics of ...',
      'duration': 'Duration: 5.75hrs',
    },
    {
      'title': 'Self-Presentation',
      'desc':
          'In this course, you will learn how to make a great first impression, communicate without using words...',
      'duration': 'Duration: 3hrs',
    },
    {
      'title': 'Self-Management',
      'desc':
          'In this course, you will learn about managing yourself effectively...',
      'duration': 'Duration: 4hrs',
    },
    {
      'title': 'Interpersonal Skills',
      'desc':
          'In this course, you will learn about dealing with people and building relationships...',
      'duration': 'Duration: 6hrs',
    },
    {
      'title': 'Problem Solving & Innovation',
      'desc':
          'In this course, you will learn about thinking creatively and solving problems...',
      'duration': 'Duration: 7hrs',
    },
  ];

  // Data for the OpenGrad section (as shown in the image)
  final List<Map<String, String>> _openGradCourses = const [
    {'title': 'MBA Bundle', 'subtitle': '', 'action': 'Checkout Course'},
    {
      'title': 'CAT (Malayalam)',
      'subtitle': '17 lessons',
      'action': 'Checkout Course',
    },
    {
      'title': 'CUET UG (Malayalam)',
      'subtitle': '60 lessons',
      'action': 'Checkout Course',
    },
    {
      'title': 'CUET UG Questions & Mocks',
      'subtitle': '',
      'action': 'Checkout Course',
    },
  ];

  Widget _buildCourseCard(BuildContext context, Map<String, String> course) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            course['title'] ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF324A5F),
            ),
          ),
          const SizedBox(height: 12),
          // Removed Expanded to work inside a vertical ListView
          Text(
            course['desc'] ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Text(
            course['duration'] ?? '',
            style: TextStyle(color: Colors.grey[500]),
          ),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                // TODO: hook up enroll action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B6FF0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                elevation: 4,
                shadowColor: Colors.blue.withOpacity(0.25),
              ),
              child: const Text(
                'Enroll',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpenGradCard(BuildContext context, Map<String, String> item) {
    // A compact card similar to the image: small image area, title, subtitle, button
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          // Image placeholder area
          SizedBox(
            height: 100,
            child: Center(
              child: Icon(Icons.school, size: 80, color: Colors.green[700]),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            item['title'] ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.blue[700]),
          ),
          if ((item['subtitle'] ?? '').isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              item['subtitle'] ?? '',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: navigate to checkout/course detail
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B6FF0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 2,
            ),
            child: Text(
              item['action'] ?? 'Checkout',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpenGradSection(BuildContext context, double maxWidth) {
    // responsive columns
    int crossAxisCount = 1;
    if (maxWidth >= 1000) {
      crossAxisCount = 3;
    } else if (maxWidth >= 700) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 1;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Center(
          child: Text(
            'OpenGrad Courses',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[800],
            ),
          ),
        ),
        const SizedBox(height: 18),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _openGradCourses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (context, index) {
            return _buildOpenGradCard(context, _openGradCourses[index]);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = 20;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 24,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hot Trending Courses!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Discover our top-tier selection of trending bootcamps. Stay ahead in your field with the latest and most sought-after bootcamps.',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 28),
              Center(
                child: Text(
                  'Wadhwani Foundation Courses',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Replaced GridView with a vertical ListView
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _courses.length,
                separatorBuilder: (_, __) => const SizedBox(height: 18),
                itemBuilder: (context, index) =>
                    _buildCourseCard(context, _courses[index]),
              ),
              const SizedBox(height: 30),

              // New OpenGrad section (as requested)
              _buildOpenGradSection(context, constraints.maxWidth),

              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}

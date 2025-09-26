import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/portfolio_provider.dart';
import 'animated_card.dart';

class ProjectsSection extends StatelessWidget {
  final bool isWeb;
  const ProjectsSection({super.key, required this.isWeb});

  @override
  Widget build(BuildContext context) {
    final projects = context.watch<PortfolioProvider>().projects;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isWeb ? 80 : 20, vertical: isWeb ? 80 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Projects",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          const SizedBox(height: 32),
          Column(
            children: projects.asMap().entries.map((entry) {
              int index = entry.key;
              final project = entry.value;

              return AnimatedCard(
                delay: Duration(milliseconds: index * 150),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.indigo.withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon / Accent bar
                        Container(
                          width: 6,
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.indigo, Colors.purple],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Project Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                project.desc,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Optional icon for project type
                        const SizedBox(width: 16),
                        // const Icon(Icons.arrow_forward_ios, color: Colors.indigo),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

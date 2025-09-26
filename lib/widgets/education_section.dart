import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/portfolio_provider.dart';
import 'animated_card.dart';

class EducationSection extends StatelessWidget {
  final bool isWeb;
  const EducationSection({super.key, required this.isWeb});

  @override
  Widget build(BuildContext context) {
    final education = context.watch<PortfolioProvider>().education;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isWeb ? 80 : 20, vertical: isWeb ? 80 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Education",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 40),
          Column(
            children: education.asMap().entries.map((entry) {
              int index = entry.key;
              final edu = entry.value;

              return AnimatedCard(
                delay: Duration(milliseconds: index * 150),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 2,
                          height: index == 0 ? 20 : 40,
                          color: index == 0 ? Colors.transparent : Colors.deepPurple.withOpacity(0.3),
                        ),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepPurple.withOpacity(0.3),
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 100,
                          color: index == education.length - 1 ? Colors.transparent : Colors.deepPurple.withOpacity(0.3),
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    // Education card
                    Expanded(
                      child: AnimatedCard(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          margin: const EdgeInsets.only(bottom: 40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                edu.degree,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                edu.institution,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                edu.year,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              // if (edu.description != null && edu.description.isNotEmpty)
                              //   Padding(
                              //     padding: const EdgeInsets.only(top: 12),
                              //     child: Text(
                              //       edu.description,
                              //       style: const TextStyle(fontSize: 14, color: Colors.black87),
                              //     ),
                              //   ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

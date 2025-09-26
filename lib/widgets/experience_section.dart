import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/portfolio_provider.dart';
import 'animated_card.dart';

class ExperienceSection extends StatelessWidget {
  final bool isWeb;
  const ExperienceSection({super.key, required this.isWeb});

  @override
  Widget build(BuildContext context) {
    final experiences = context.watch<PortfolioProvider>().experiences;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isWeb ? 80 : 20, vertical: isWeb ? 80 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Experience",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
          const SizedBox(height: 32),
          Column(
            children: experiences.asMap().entries.map((entry) {
              int index = entry.key;
              final exp = entry.value;
              bool isLeft = index % 2 == 0; // Alternate sides for web layout

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: isWeb
                      ? (isLeft ? MainAxisAlignment.start : MainAxisAlignment.end)
                      : MainAxisAlignment.start,
                  children: [
                    if (!isLeft && isWeb) const Spacer(),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Vertical line
                        Positioned(
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 2,
                            color: Colors.deepPurple.withOpacity(0.2),
                          ),
                        ),
                        // Timeline Dot
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.deepPurple,
                              Colors.indigo
                            ]),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.deepPurple.withOpacity(0.5),
                                  blurRadius: 6,
                                  spreadRadius: 1)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: AnimatedCard(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepPurple.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exp.role,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${exp.company} | ${exp.period}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                exp.description,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black87, height: 1.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (isLeft && isWeb) const Spacer(),
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


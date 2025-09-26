import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../providers/portfolio_provider.dart';

class AboutSection extends StatelessWidget {
  final bool isWeb;
  const AboutSection({super.key, required this.isWeb});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<PortfolioProvider>();

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isWeb ? 80 : 20, vertical: isWeb ? 80 : 40),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.purple.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: isWeb
            ? Row(
          children: [
            // Left: Text
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About Me",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            "I am a passionate Flutter and Node.js developer with 2+ years of experience in building mobile and web applications. "
                                "I enjoy crafting clean UI/UX and scalable backend systems. "
                                "I love solving complex problems and turning ideas into functional, beautiful apps.",
                            speed: const Duration(milliseconds: 50),
                          ),
                        ],
                        repeatForever: false,
                        pause: const Duration(milliseconds: 1000),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40),
            // Right: Decorative element / avatar
            Expanded(
              flex: 2,
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/images/about.png',height: 100,)
                  ],
                ),
              ),
            ),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "About Me",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            const SizedBox(height: 24),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.6,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    "I am a passionate Flutter and Node.js developer with 2+ years of experience in building mobile and web applications. "
                        "I enjoy crafting clean UI/UX and scalable backend systems. "
                        "I love solving complex problems and turning ideas into functional, beautiful apps.",
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                repeatForever: false,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ),
            const SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}

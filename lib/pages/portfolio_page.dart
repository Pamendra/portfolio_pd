import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/portfolio_provider.dart';
import '../widgets/experience_section.dart';
import '../widgets/header_widget.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/education_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> with TickerProviderStateMixin {
  late AnimationController floatController;

  @override
  void initState() {
    super.initState();
    floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    floatController.addListener(() {
      Provider.of<PortfolioProvider>(context, listen: false)
          .setFloatValue(15 * floatController.value);
    });
  }

  @override
  void dispose() {
    floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(isWeb: isWeb),
            const SizedBox(height: 20),
            AboutSection(isWeb: isWeb),
            const SizedBox(height: 20),
            SkillsSection(isWeb: isWeb),
            const SizedBox(height: 20),
            EducationSection(isWeb: isWeb),
            const SizedBox(height: 20),
            ExperienceSection(isWeb: isWeb),
            const SizedBox(height: 20),
            ProjectsSection(isWeb: isWeb),
            const SizedBox(height: 20),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}

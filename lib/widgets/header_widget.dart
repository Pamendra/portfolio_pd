import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/portfolio_provider.dart';

class HeaderWidget extends StatelessWidget {
  final bool isWeb;
  const HeaderWidget({super.key, required this.isWeb});

  @override
  Widget build(BuildContext context) {
    final floatValue = context.watch<PortfolioProvider>().floatValue;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: isWeb ? 80 : 20, vertical: isWeb ? 80 : 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo.shade400, Colors.purpleAccent.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: isWeb
          ? Row(
        children: [
          Expanded(child: _headerText(context)),
          const SizedBox(width: 40),
          _floatingProfileImage(floatValue, 120),
        ],
      )
          : Column(
        children: [
          _floatingProfileImage(floatValue, 100),
          const SizedBox(height: 24),
          _headerText(context),
        ],
      ),
    );
  }

  Widget _headerText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hello, I'm",
          style: TextStyle(color: Colors.white70, fontSize: 20),
        ),
        const SizedBox(height: 8),
        Text(
          "Pamendra Singh Dhurwe",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 44,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Flutter & Node.js Developer",
          style: TextStyle(color: Colors.white70, fontSize: 22),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          children: [
            _socialIcon(FontAwesomeIcons.flutter, Colors.white, onTap: () {}),
            _socialIcon(FontAwesomeIcons.nodeJs, Colors.white, onTap: () {}),
            _socialIcon(FontAwesomeIcons.mapLocationDot, Colors.white, onTap: () {}),
          ],
        ),
      ],
    );
  }

  Widget _socialIcon(IconData icon, Color color, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.2),
        ),
        child: Icon(icon, color: color),
      ),
    );
  }

  Widget _floatingProfileImage(double floatValue, double size) {
    return Transform.translate(
      offset: Offset(0, -floatValue),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: size + 4,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: size,
            backgroundImage: const NetworkImage(
                "https://media.licdn.com/dms/image/v2/D4D03AQFKd5ptlIQenA/profile-displayphoto-shrink_400_400/B4DZVkOVmfGcAg-/0/1741143240944?e=1761782400&v=beta&t=1DRMszN1sP2v5hNnBhwmEfqFBUTvYyVc6iBnMe4qLec"),
          ),
        ),
      ),
    );
  }
}

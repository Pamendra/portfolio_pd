import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pages/portfolio_page.dart';
import 'providers/portfolio_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PortfolioProvider()),
      ],
      child: const PortfolioApp(),
    ),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pamendra Singh Dhurwe Portfolio",
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: const PortfolioPage(),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
//
// void main() {
//   runApp(const PortfolioApp());
// }
//
// class PortfolioApp extends StatelessWidget {
//   const PortfolioApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Pamendra Singh Dhurwe Portfolio",
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         primarySwatch: Colors.indigo,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const PortfolioPage(),
//     );
//   }
// }
//
// class PortfolioPage extends StatefulWidget {
//   const PortfolioPage({super.key});
//
//   @override
//   State<PortfolioPage> createState() => _PortfolioPageState();
// }
//
// class _PortfolioPageState extends State<PortfolioPage>
//     with TickerProviderStateMixin {
//   late AnimationController floatController;
//   late Animation<double> floatAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     floatController =
//     AnimationController(vsync: this, duration: const Duration(seconds: 3))
//       ..repeat(reverse: true);
//     floatAnimation = Tween<double>(begin: 0, end: 15).animate(
//       CurvedAnimation(parent: floatController, curve: Curves.easeInOut),
//     );
//   }
//
//   @override
//   void dispose() {
//     floatController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final isWeb = MediaQuery.of(context).size.width > 800;
//
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _header(isWeb),
//             const SizedBox(height: 40),
//             _aboutSection(isWeb),
//             const SizedBox(height: 40),
//             _skillsSection(isWeb),
//             const SizedBox(height: 40),
//             _educationSection(isWeb),
//             const SizedBox(height: 40),
//             _projectsSection(isWeb),
//             const SizedBox(height: 40),
//             _contactSection(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _header(bool isWeb) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: isWeb ? 80 : 20, vertical: isWeb ? 80 : 40),
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.indigo, Colors.deepPurple],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: isWeb
//           ? Row(
//         children: [
//           Expanded(child: _headerText()),
//           const SizedBox(width: 40),
//           _floatingProfileImage(150),
//         ],
//       )
//           : Column(
//         children: [
//           _floatingProfileImage(100),
//           const SizedBox(height: 20),
//           _headerText(),
//         ],
//       ),
//     );
//   }
//
//   Widget _headerText() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Hello, I'm",
//             style: TextStyle(color: Colors.white70, fontSize: 20)),
//         const SizedBox(height: 8),
//         Text("Pamendra Singh Dhurwe",
//             style: GoogleFonts.poppins(
//                 color: Colors.white,
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold)),
//         const SizedBox(height: 8),
//         const Text("Flutter & Node.js Developer",
//             style: TextStyle(color: Colors.white70, fontSize: 22)),
//       ],
//     );
//   }
//
//   Widget _floatingProfileImage(double size) {
//     return AnimatedBuilder(
//       animation: floatAnimation,
//       builder: (context, child) {
//         return Transform.translate(
//           offset: Offset(0, -floatAnimation.value),
//           child: CircleAvatar(
//             radius: size,
//             backgroundImage: const NetworkImage(
//                 "https://media.licdn.com/dms/image/v2/D4D03AQFKd5ptlIQenA/profile-displayphoto-shrink_400_400/B4DZVkOVmfGcAg-/0/1741143240944?e=1761782400&v=beta&t=1DRMszN1sP2v5hNnBhwmEfqFBUTvYyVc6iBnMe4qLec"), // Replace with your photo
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _aboutSection(bool isWeb) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: isWeb ? 80 : 20, vertical: isWeb ? 80 : 40),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         elevation: 4,
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "About Me",
//                 style: TextStyle(
//                   fontSize: isWeb ? 28 : 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 width: double.infinity,
//                 child: DefaultTextStyle(
//                   style: TextStyle(
//                     fontSize: isWeb ? 18 : 16,
//                     color: Colors.black87,
//                     height: 1.5,
//                   ),
//                   child: AnimatedTextKit(
//                     animatedTexts: [
//                       TyperAnimatedText(
//                         "I am a passionate Flutter and Node.js developer with 2+ years of experience in building mobile and web applications. "
//                             "I enjoy crafting clean UI/UX and scalable backend systems. "
//                             "I love solving complex problems and turning ideas into functional, beautiful apps.",
//                         speed: const Duration(milliseconds: 50),
//                       ),
//                     ],
//                     repeatForever: false,
//                     pause: const Duration(milliseconds: 1000),
//                     displayFullTextOnTap: true,
//                     stopPauseOnTap: true,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _skillsSection(bool isWeb) {
//     final skills = [
//       "Flutter",
//       "Dart",
//       "Node.js",
//       "MongoDB",
//       "PostgreSQL",
//       "Firebase",
//       "REST API",
//       "GraphQL"
//     ];
//
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: isWeb ? 80 : 20, vertical: isWeb ? 80 : 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Skills",
//             style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.indigo),
//           ),
//           const SizedBox(height: 24),
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: skills.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: isWeb ? 6 : 2,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               childAspectRatio: 2.5,
//             ),
//             itemBuilder: (context, index) {
//               final skill = skills[index];
//               return AnimatedCard(
//                 delay: Duration(milliseconds: index * 100),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   elevation: 4,
//                   shadowColor: Colors.indigo.withOpacity(0.3),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//                     child: Center(
//                       child: Text(
//                         skill,
//                         style: const TextStyle(
//                           color: Colors.indigo,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//
//
//   Widget _educationSection(bool isWeb) {
//     final education = [
//       {
//         "degree": "B.Tech in Computer Science",
//         "year": "2018 - 2022",
//         "institution": "ABC University"
//       },
//       {
//         "degree": "High School",
//         "year": "2016 - 2018",
//         "institution": "XYZ School"
//       },
//     ];
//
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: isWeb ? 80 : 20, vertical: isWeb ? 80 : 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const Text(
//             "Education",
//             style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.deepPurple),
//           ),
//           const SizedBox(height: 24),
//           Wrap(
//             spacing: 20,
//             runSpacing: 20,
//             children: education.asMap().entries.map((entry) {
//               int index = entry.key;
//               var edu = entry.value;
//               return AnimatedCard(
//                 delay: Duration(milliseconds: index * 150),
//                 child: SizedBox(
//                   width: isWeb ? 400 : double.infinity,
//                   child: Card(
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                     elevation: 5,
//                     shadowColor: Colors.deepPurple.withOpacity(0.3),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(Icons.school, color: Colors.deepPurple),
//                               const SizedBox(width: 10),
//                               Text(
//                                 edu["degree"]!,
//                                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Text(edu["institution"]!,
//                               style: const TextStyle(fontSize: 16, color: Colors.black87)),
//                           const SizedBox(height: 5),
//                           Text(edu["year"]!,
//                               style: const TextStyle(fontSize: 14, color: Colors.black54)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           )
//         ],
//       ),
//     );
//   }
//
//
//   Widget _projectsSection(bool isWeb) {
//     final projects = [
//       {"title": "E-commerce App", "desc": "Built with Flutter & Node.js"},
//       {"title": "Portfolio Website", "desc": "Responsive web portfolio"},
//       {"title": "Chat Application", "desc": "Realtime chat using Firebase"},
//       {"title": "School Dashboard", "desc": "Analytics with Flutter Web"},
//     ];
//
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: isWeb ? 80 : 20, vertical: isWeb ? 80 : 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Projects",
//             style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.indigo),
//           ),
//           const SizedBox(height: 24),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: projects.asMap().entries.map((entry) {
//                 int index = entry.key;
//                 var project = entry.value;
//                 return AnimatedCard(
//                   delay: Duration(milliseconds: index * 150),
//                   child: Container(
//                     width: isWeb ? 300 : 250,
//                     margin: const EdgeInsets.only(right: 20),
//                     child: Card(
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                       elevation: 5,
//                       shadowColor: Colors.indigo.withOpacity(0.3),
//                       child: Padding(
//                         padding: const EdgeInsets.all(20),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Icon(Icons.work, color: Colors.indigo, size: 40),
//                             const SizedBox(height: 16),
//                             Text(
//                               project["title"]!,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               project["desc"]!,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(fontSize: 14, color: Colors.black54),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           )
//
//         ],
//       ),
//     );
//   }
//
//
//   Widget _contactSection() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(30),
//       color: Colors.indigo,
//       child: Column(
//         children: const [
//           Text("Get in Touch",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold)),
//           SizedBox(height: 16),
//           Text("Email: pamendrasinghdhurwe@gmail.com",
//               style: TextStyle(color: Colors.white70, fontSize: 16)),
//           Text("LinkedIn: linkedin.com/in/Pamendra",
//               style: TextStyle(color: Colors.white70, fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }
//
// class AnimatedCard extends StatefulWidget {
//   final Widget child;
//   final Duration delay;
//
//   const AnimatedCard({super.key, required this.child, this.delay = Duration.zero});
//
//   @override
//   State<AnimatedCard> createState() => _AnimatedCardState();
// }
//
// class _AnimatedCardState extends State<AnimatedCard> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacity;
//   late Animation<double> _yOffset;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//
//     _opacity = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//
//     _yOffset = Tween<double>(begin: 30, end: 0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//
//     // Start animation after delay
//     Future.delayed(widget.delay, () {
//       if (mounted) _controller.forward();
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Opacity(
//           opacity: _opacity.value,
//           child: Transform.translate(
//             offset: Offset(0, _yOffset.value),
//             child: widget.child,
//           ),
//         );
//       },
//     );
//   }
// }

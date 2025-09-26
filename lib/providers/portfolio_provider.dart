import 'package:flutter/material.dart';
import '../models/education.dart';
import '../models/experience.dart';
import '../models/project.dart';
import '../models/skill.dart';

class PortfolioProvider extends ChangeNotifier {
  // Floating Animation Value (for profile image)
  double floatValue = 0.0;

  // Data
  final List<Skill> skills = [
    Skill(name: "Flutter"),
    Skill(name: "Dart"),
    Skill(name: "Node.js"),
    Skill(name: "Nest.js"),
    Skill(name: "MongoDB"),
    Skill(name: "PostgreSQL"),
    Skill(name: "Firebase"),
    Skill(name: "REST API"),
  ];

  final List<Education> education = [
    Education(degree: "Master Of Computer Applications", year: "2021 - 2023", institution: "Shri Shankaracharya Technical Campus Bhilai"),
    Education(degree: "Bachelor Of Computer Applications", year: "2017 - 2021", institution: "BCS PG College Dhamtari"),
  ];

  final List<Experience> experiences = [
    Experience(
      role: "Project Assistant",
      company: "IIT Bhilai Innovation And Technology Foundation | Bhilai CG",
      period: "April 2024 - Present",
      description:
      "Experienced in developing and maintaining advanced mobile applications using Flutter and Dart with dynamic UIs, API integrations, and real-time data handling. "
          "Skilled in building robust server-side logic and RESTful APIs with Node.js, ensuring seamless client–server synchronization and scalability.",
    ),
    Experience(
      role: "Software Developer",
      company: "Divyal Technologies Pvt Ltd | Bhilai CG",
      period: "Oct 2023 - March 2024",
      description:
      "Contributed to and developed mobile applications using Flutter and Dart, implementing responsive UIs and complex business logic. "
          "Integrated RESTful APIs for real-time data to enhance functionality and user experience.",
    ),
    Experience(
      role: "Flutter Developer",
      company: "Singhania IT Solutions Pvt Ltd | Raipur CG",
      period: "July 2023 - Sep 2023",
      description:
      "Developed and maintained user-focused mobile applications using Flutter and Dart, implementing responsive UIs and business logic. "
          "Integrated RESTful APIs and web services to enable seamless real-time data operations.",
    ),
  ];


  final List<Project> projects = [
    Project(
      title: "Vidhya Samiksha Kendra Chhattisgarh",
      desc: "AI-powered mobile app for Chhattisgarh, providing real-time school monitoring, data visualization, and voice-enabled student assessments. "
          "Implemented live location tracking, hierarchical data access, and custom reporting to enhance decision-making and learning outcomes.",
    ),
    Project(
      title: "TEXT BOOK CORPORATION CG",
      desc: "Mobile app under Samagra Shiksha, Chhattisgarh, enabling real-time tracking of textbook deliveries using barcode/ISBN scanning. "
          "Features include offline data sync, role-based access, and dashboard reporting to ensure transparency and accountability.",
    ),
    Project(
      title: "EV Charging Connectivity / Battery Swapping",
      desc: "Mobile app enabling users to locate nearby stations, request charging services, and make seamless payments. "
          "Integrated real-time GPS tracking, request confirmation, live charging status updates, and multiple payment options.",
    ),
    Project(
      title: "Samagra Shiksha CG Monitoring",
      desc: "A mobile app for real-time student count entry and monitoring across schools in Chhattisgarh. Enables school-level data submission, cluster-level approvals, and state-level tracking through dashboards and role-based access—enhancing transparency, accuracy, and decision-making in enrollment management.",
    ),
    Project(
      title: "BharatAgri Marts",
      desc: "An all-in-one platform for farmers to buy/sell tractors, implements, and farm products. Features include tractor comparisons, loan & insurance info, agriculture news, expert advice, and tools like EMI calculators—built with a user-friendly interface for seamless access to all farming needs.",
    ),
    Project(
      title: "Live Video Calling App",
      desc: "A real-time video calling app built with WebRTC, Flutter frontend, and Node.js for signaling. Supports peer-to-peer communication, low-latency streaming, and seamless connection setup for one-on-one video chats.",
    ),
    Project(
      title: "Money Plant – Political Poster App",
      desc: "A customizable poster creation app for political campaigns. Allows users to design posters with templates, add images/text, and instantly share across platforms.",
    ),
    Project(
      title: "MotoPlatform",
      desc: "A marketplace app for buying and selling new and used vehicles. Features include vehicle listings, search filters, chat between buyers and sellers, and user-friendly navigation.",
    ),
  ];



  // Update float animation
  void setFloatValue(double value) {
    floatValue = value;
    notifyListeners();
  }
}

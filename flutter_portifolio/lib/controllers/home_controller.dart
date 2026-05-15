import 'package:flutter/material.dart';
import 'package:flutter_portifolio/controllers/data/portifolio_data.dart';
import 'package:flutter_portifolio/models/skill_model.dart';
import 'package:flutter_portifolio/models/experience_model.dart';
import 'package:flutter_portifolio/models/project_model.dart';
import 'package:flutter_portifolio/models/education_model.dart';

class HomeController extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  final GlobalKey headerKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  int _activeMenu = 0;
  int get activeMenu => _activeMenu;

  void setActiveMenu(int index) {
    _activeMenu = index;
    notifyListeners();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  // =============================
  // DADOS TIPADOS ✅
  // =============================

  String get name => PortfolioData.name;
  String get role => PortfolioData.role;
  String get location => PortfolioData.location;
  String get email => PortfolioData.email;
  String get github => PortfolioData.github;
  String get linkedin => PortfolioData.linkedin;
  String get summary => PortfolioData.summary;

  List<String> get languages => PortfolioData.languages;
  List<Skill> get skills => PortfolioData.skills;
  List<Experience> get experiences => PortfolioData.experiences;
  List<Project> get projects => PortfolioData.projects;
  List<Education> get education => PortfolioData.education;
  List<String> get softSkills => PortfolioData.softSkills;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

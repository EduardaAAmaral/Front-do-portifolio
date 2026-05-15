import 'package:flutter/material.dart';
import 'package:flutter_portifolio/controllers/data/portifolio_data.dart';

class HomeController extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  // Keys das seções
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
  // DADOS VINDO DO PORTFOLIO DATA
  // =============================

  String get name => PortfolioData.name;
  String get role => PortfolioData.role;
  String get location => PortfolioData.location;
  String get email => PortfolioData.email;
  String get github => PortfolioData.github;
  String get linkedin => PortfolioData.linkedin;
  String get summary => PortfolioData.summary;

  get skills => PortfolioData.skills;
  get experiences => PortfolioData.experiences;
  get projects => PortfolioData.projects;
  get education => PortfolioData.education;
  get softSkills => PortfolioData.softSkills;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

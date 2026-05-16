import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';
import 'widgets/header_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/education_section.dart';
import 'widgets/contact_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Row(
        children: [
          _SideMenu(controller: controller),
          Expanded(
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  HeaderSection(key: controller.headerKey),
                  SkillsSection(key: controller.skillsKey),
                  ExperienceSection(key: controller.experienceKey),
                  ProjectsSection(key: controller.projectsKey),
                  EducationSection(key: controller.educationKey),
                  ContactSection(key: controller.contactKey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SideMenu extends StatelessWidget {
  final HomeController controller;

  const _SideMenu({required this.controller});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {"icon": Icons.home_rounded, "label": "Início"},
      {"icon": Icons.code_rounded, "label": "Skills"},
      {"icon": Icons.work_rounded, "label": "Experiência"},
      {"icon": Icons.folder_rounded, "label": "Projetos"},
      {"icon": Icons.school_rounded, "label": "Formação"},
      {"icon": Icons.mail_rounded, "label": "Contato"},
    ];

    final sectionKeys = [
      controller.headerKey,
      controller.skillsKey,
      controller.experienceKey,
      controller.projectsKey,
      controller.educationKey,
      controller.contactKey,
    ];

    return Container(
      width: 76,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF111111),
        border: Border(
          right: BorderSide(
            color: Color(0xFF1A1A2E),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              const Icon(
                Icons.auto_awesome_rounded,
                color: Color(0xFFE91E8C),
                size: 26,
              ),
              const Spacer(),
              Column(
                children: List.generate(menuItems.length, (index) {
                  final isActive = controller.activeMenu == index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Tooltip(
                      message: menuItems[index]["label"] as String,
                      preferBelow: false,
                      child: GestureDetector(
                        onTap: () {
                          controller.setActiveMenu(index);
                          controller.scrollToSection(sectionKeys[index]);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: isActive
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF9B59B6),
                                      Color(0xFFE91E8C),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                          ),
                          child: Icon(
                            menuItems[index]["icon"] as IconData,
                            color: isActive
                                ? Colors.white
                                : const Color(0xFF8892A4),
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
              const SizedBox(height: 26),
            ],
          ),
        ),
      ),
    );
  }
}
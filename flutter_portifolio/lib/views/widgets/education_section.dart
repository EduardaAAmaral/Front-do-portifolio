import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import '../../controllers/home_controller.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final width = MediaQuery.of(context).size.width;

    final isMobile = width < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            child: const Text(
              "Formação Acadêmica",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Column(
            children: controller.education.map((edu) {
              return FadeInUp(
                duration: const Duration(milliseconds: 700),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF151528),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.22),
                        blurRadius: 18,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE91E8C).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.school_rounded,
                          color: Color(0xFFE91E8C),
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 22),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              edu.degree,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              edu.institution,
                              style: const TextStyle(
                                fontSize: 15,
                                height: 1.5,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE91E8C).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0xFFE91E8C).withOpacity(0.35),
                          ),
                        ),
                        child: Text(
                          edu.year,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFFFF8BCB),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 70),
          const Text(
            "Soft Skills",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: controller.softSkills.map((skill) {
              return FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF151528),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color(0xFFE91E8C).withOpacity(0.25),
                    ),
                  ),
                  child: Text(
                    skill,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

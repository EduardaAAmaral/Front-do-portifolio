import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import '../../controllers/home_controller.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return Container(
      key: key,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFF9B59B6),
                  Color(0xFFE91E8C),
                ],
              ).createShader(bounds),
              child: const Text(
                "Experiência Profissional",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 80),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.experiences.length,
            itemBuilder: (context, index) {
              final experience = controller.experiences[index];

              return FadeInUp(
                duration: Duration(milliseconds: 600 + (index * 150)),
                child: _TimelineItem(
                  isLast: index == controller.experiences.length - 1,
                  company: experience.company,
                  role: experience.role,
                  period: experience.period,
                  description: experience.description,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final bool isLast;
  final String company;
  final String role;
  final String period;
  final String description;

  const _TimelineItem({
    required this.isLast,
    required this.company,
    required this.role,
    required this.period,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF9B59B6),
                    Color(0xFFE91E8C),
                  ],
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 140,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF9B59B6),
                      Color(0xFFE91E8C),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(width: 30),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 60),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF9B59B6).withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 6),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFFE91E8C),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 6),
                Text(
                  period,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
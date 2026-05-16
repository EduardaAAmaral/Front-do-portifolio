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
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            child: const Text(
              "Experiência Profissional",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Minha trajetória em desenvolvimento mobile, front-end, UI/UX e tecnologia aplicada.",
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 800;

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.experiences.length,
                itemBuilder: (context, index) {
                  final experience = controller.experiences[index];

                  return FadeInUp(
                    duration: Duration(milliseconds: 500 + (index * 100)),
                    child: _ExperienceCard(
                      index: index + 1,
                      company: experience.company,
                      role: experience.role,
                      period: experience.period,
                      description: experience.description,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final int index;
  final String company;
  final String role;
  final String period;
  final String description;

  const _ExperienceCard({
    required this.index,
    required this.company,
    required this.role,
    required this.period,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final number = index.toString().padLeft(2, "0");

    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF151528),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              color: Colors.white.withOpacity(0.12),
            ),
          ),
          const SizedBox(width: 26),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFFE91E8C),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14.5,
                    height: 1.6,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE91E8C).withOpacity(0.12),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              period,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFFFF8BCB),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

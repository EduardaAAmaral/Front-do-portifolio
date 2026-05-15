import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import '../../controllers/home_controller.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 4;
    if (width < 1200) crossAxisCount = 3;
    if (width < 800) crossAxisCount = 2;
    if (width < 500) crossAxisCount = 1;

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
                "Habilidades Técnicas",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.skills.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              final skill = controller.skills[index];

              return FadeInUp(
                duration: Duration(milliseconds: 500 + (index * 100)),
                child: _SkillCard(
                  name: skill.name,
                  level: skill.level,
                  icon: skill.icon,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}



class _SkillCard extends StatelessWidget {
  final String name;
  final double level;
  final String icon;

  const _SkillCard({
    required this.name,
    required this.level,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
            icon,
            style: const TextStyle(fontSize: 28),
          ),

          const SizedBox(height: 15),

          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const Spacer(),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: level),
            duration: const Duration(milliseconds: 1000),
            builder: (context, value, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(
                    value: value,
                    minHeight: 8,
                    backgroundColor: Colors.white10,
                    valueColor: const AlwaysStoppedAnimation(
                      Color(0xFFE91E8C),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${(value * 100).toInt()}%",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
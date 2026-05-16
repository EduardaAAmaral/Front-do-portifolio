import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/home_controller.dart';
import 'package:flutter/gestures.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  final ScrollController _scrollController = ScrollController();
  bool _isUserInteracting = false;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() async {
    await Future.delayed(const Duration(seconds: 1));

    while (mounted) {
      if (_scrollController.hasClients && !_isUserInteracting) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final current = _scrollController.offset;

        if (current >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
            current + 260,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
          );
        }
      }

      await Future.delayed(const Duration(seconds: 3));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: width < 700 ? 24 : 80,
        vertical: 90,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Stack Técnica",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            "Tecnologias e ferramentas que uso para construir aplicações mobile modernas, escaláveis e bem estruturadas.",
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 46),
          MouseRegion(
            onEnter: (_) => _isUserInteracting = true,
            onExit: (_) => _isUserInteracting = false,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is UserScrollNotification) {
                  _isUserInteracting = true;

                  Future.delayed(const Duration(seconds: 2), () {
                    if (mounted) {
                      _isUserInteracting = false;
                    }
                  });
                }

                return false;
              },
              child: SizedBox(
                height: 130,
                child: ScrollConfiguration(
                  behavior: const AppScrollBehavior(),
                  child: ListView.separated(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.skills.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 18),
                    itemBuilder: (context, index) {
                      final skill = controller.skills[index];

                      return SizedBox(
                        width: 240,
                        child: _SkillCard(
                          name: skill.name,
                          level: skill.level,
                          icon: skill.icon,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
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

  String get levelText {
    if (level >= 0.85) return "Avançado";
    if (level >= 0.70) return "Intermediário";
    return "Conhecimento";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF151528),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.24),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFE91E8C).withOpacity(0.12),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              icon,
              style: const TextStyle(fontSize: 26),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  levelText,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

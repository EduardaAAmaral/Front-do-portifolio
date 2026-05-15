import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import '../../controllers/home_controller.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 3;
    if (width < 1200) crossAxisCount = 2;
    if (width < 700) crossAxisCount = 1;

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
                "Projetos",
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
            itemCount: controller.projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              final project = controller.projects[index];

              return FadeInUp(
                duration: Duration(milliseconds: 600 + (index * 150)),
                child: _ProjectCard(
                  title: project.title,
                  description: project.description,
                  tech: project.tech,
                  link: project.link,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tech;
  final String link;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tech,
    required this.link,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2E),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? const Color(0xFFE91E8C).withOpacity(0.4)
                  : const Color(0xFF9B59B6).withOpacity(0.2),
              blurRadius: isHovered ? 35 : 20,
              spreadRadius: 3,
            )
          ],
        ),
        transform: isHovered
            ? (Matrix4.identity()..scale(1.03))
            : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.folder_open_rounded,
              color: Color(0xFFE91E8C),
              size: 30,
            ),

            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),
            Expanded(
              child: Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Colors.white70,
                ),
              ),
            ),

            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.tech.map((tech) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF9B59B6),
                    ),
                  ),
                  child: Text(
                    tech,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),
            InkWell(
              onTap: () => _launch(widget.link),
              child: const Row(
                children: [
                  Icon(
                    Icons.open_in_new,
                    size: 16,
                    color: Color(0xFFE91E8C),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Ver Projeto",
                    style: TextStyle(
                      color: Color(0xFFE91E8C),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
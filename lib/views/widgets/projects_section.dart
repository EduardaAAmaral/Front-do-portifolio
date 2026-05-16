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
    if (width < 1250) crossAxisCount = 2;
    if (width < 780) crossAxisCount = 1;

    final double horizontalPadding = width < 700 ? 24 : 80;

    final double cardHeight = width < 780
        ? 500
        : width < 1250
            ? 455
            : 430;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: width < 700 ? 70 : 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projetos",
            style: TextStyle(
              fontSize: width < 700 ? 32 : 38,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            "Alguns projetos desenvolvidos com foco em mobile, front-end, experiência do usuário e integração com APIs.",
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 50),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 26,
              mainAxisSpacing: 26,
              mainAxisExtent: cardHeight,
            ),
            itemBuilder: (context, index) {
              final project = controller.projects[index];

              return FadeInUp(
                duration: Duration(milliseconds: 500 + (index * 120)),
                child: _ProjectCard(
                  title: project.title,
                  description: project.description,
                  tech: project.tech,
                  link: project.link,
                  imagePath: project.image,
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
  final String imagePath;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tech,
    required this.link,
    required this.imagePath,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform:
            isHovered ? (Matrix4.identity()..scale(1.01)) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: const Color(0xFF151528),
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
            color: isHovered
                ? const Color(0xFFE91E8C).withOpacity(0.45)
                : Colors.white.withOpacity(0.08),
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? const Color(0xFFE91E8C).withOpacity(0.22)
                  : Colors.black.withOpacity(0.22),
              blurRadius: isHovered ? 28 : 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProjectImage(
                imagePath: widget.imagePath,
                title: widget.title,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(width < 700 ? 18 : 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: width < 700 ? 18 : 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.description,
                        maxLines: width < 700 ? 4 : 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.45,
                          color: Colors.white70,
                        ),
                      ),
                      const Spacer(),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.tech.map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE91E8C).withOpacity(0.10),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color:
                                    const Color(0xFFE91E8C).withOpacity(0.35),
                              ),
                            ),
                            child: Text(
                              tech,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () => _launch(widget.link),
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE91E8C),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.open_in_new_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Ver projeto",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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

class _ProjectImage extends StatelessWidget {
  final String imagePath;
  final String title;

  const _ProjectImage({
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final imageHeight = width < 780
        ? 175.0
        : width < 1250
            ? 170.0
            : 185.0;

    return Container(
      height: imageHeight,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: const Color(0xFF0F1020),
      child: imagePath.isEmpty
          ? _Placeholder(title: title)
          : Image.asset(
              imagePath,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
              errorBuilder: (_, __, ___) {
                return _Placeholder(title: title);
              },
            ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final String title;

  const _Placeholder({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF241432),
            Color(0xFF151528),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Icon(
          _getIcon(title),
          size: 54,
          color: Color(0xFFE91E8C),
        ),
      ),
    );
  }

  static IconData _getIcon(String title) {
    if (title.contains("Saúde")) return Icons.health_and_safety_rounded;
    if (title.contains("Cardápio")) return Icons.restaurant_menu_rounded;
    if (title.contains("Chat")) return Icons.chat_bubble_rounded;
    if (title.contains("Pedidos")) return Icons.shopping_bag_rounded;
    if (title.contains("Validação")) return Icons.verified_rounded;

    return Icons.folder_open_rounded;
  }
}

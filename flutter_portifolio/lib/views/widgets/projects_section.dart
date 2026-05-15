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
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: width < 700 ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Projetos",
            style: TextStyle(
              fontSize: 38,
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
              childAspectRatio: width < 700 ? 0.9 : 0.82,
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
                  imagePath: _getProjectImage(project.title),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  static String _getProjectImage(String title) {
    return "assets/images/imagem.png";
  }

  /*
  static String _getProjectImage(String title) {
    if (title.contains("Validação")) {
      return "assets/projects/validacao_vendas.png";
    }

    if (title.contains("Saúde")) {
      return "assets/projects/saude_feminina.png";
    }

    if (title.contains("Cardápio")) {
      return "assets/projects/cardapio_digital.png";
    }

    if (title.contains("Chat")) {
      return "assets/projects/chat_interativo.png";
    }

    if (title.contains("Pedidos")) {
      return "assets/projects/app_pedidos.png";
    }

    return "";
  }*/
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
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform:
            isHovered ? (Matrix4.identity()..scale(1.025)) : Matrix4.identity(),
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
                  ? const Color(0xFFE91E8C).withOpacity(0.28)
                  : Colors.black.withOpacity(0.25),
              blurRadius: isHovered ? 35 : 22,
              offset: const Offset(0, 14),
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
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Text(
                          widget.description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.6,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
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
                      const SizedBox(height: 20),
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
    return SizedBox(
      height: 185,
      width: double.infinity,
      child: imagePath.isEmpty
          ? _Placeholder(title: title)
          : Image.asset(
              imagePath,
              fit: BoxFit.cover,
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import '../../controllers/home_controller.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                "Vamos Trabalhar Juntos?",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: const Text(
              "Estou disponível para oportunidades como Flutter Developer, "
              "Mobile Developer ou projetos freelance. "
              "Entre em contato comigo!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.white70,
              ),
            ),
          ),

          const SizedBox(height: 60),

          // ===== BOTÕES =====
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _ContactButton(
                icon: Icons.mail,
                text: "Email",
                onTap: () => _launch("https://mail.google.com/mail/?view=cm&fs=1&to=${controller.email}"),
              ),
              _ContactButton(
                icon: Icons.code,
                text: "GitHub",
                onTap: () => _launch(controller.github),
              ),
              _ContactButton(
                icon: Icons.work,
                text: "LinkedIn",
                onTap: () => _launch(controller.linkedin),
              ),
              _ContactButton(
                icon: Icons.download,
                text: "Baixar CV",
                onTap: () => _launch(
                    "assets/images/CV-Eduarda-Alves-Desenvolvedora-Flutter.pdf"),
              ),
            ],
          ),

          const SizedBox(height: 80),

          // ===== FOOTER =====
          const Divider(color: Colors.white10),

          const SizedBox(height: 20),

          const Text(
            "© 2026 Eduarda Alves Amaral • Desenvolvido com Flutter 💜",
            style: TextStyle(
              fontSize: 13,
              color: Colors.white38,
            ),
          ),
        ],
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

// ============================================================
// BOTÃO CONTATO
// ============================================================
class _ContactButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _ContactButton({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: isHovered
                  ? const LinearGradient(
                      colors: [
                        Color(0xFF9B59B6),
                        Color(0xFFE91E8C),
                      ],
                    )
                  : null,
              border: Border.all(
                color: const Color(0xFF9B59B6),
              ),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: const Color(0xFFE91E8C)
                            .withOpacity(0.4),
                        blurRadius: 25,
                        spreadRadius: 3,
                      )
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon,
                    size: 18,
                    color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  widget.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
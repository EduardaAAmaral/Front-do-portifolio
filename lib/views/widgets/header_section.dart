import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import '../../controllers/home_controller.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final width = MediaQuery.of(context).size.width;

    final isMobile = width < 700;
    final isTablet = width >= 700 && width <= 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 120,
      ),
      child: width > 1100
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _buildTextContent(context, controller)),
                const SizedBox(width: 40),
                const Expanded(child: _ProfileDecoration()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextContent(context, controller),
                SizedBox(height: isMobile ? 32 : 40),
                Center(
                  child: _ProfileDecoration(
                    width: isMobile ? 300 : 420,
                    height: isMobile ? 380 : 520,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildTextContent(BuildContext context, HomeController controller) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return FadeInLeft(
      duration: const Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color(0xFF9B59B6),
                Color(0xFFE91E8C),
              ],
            ).createShader(bounds),
            child: Text(
              controller.name,
              style: TextStyle(
                fontSize: isMobile ? 34 : 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            controller.role,
            style: TextStyle(
              fontSize: isMobile ? 18 : 22,
              color: const Color(0xFF8892A4),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            controller.summary,
            style: TextStyle(
              fontSize: isMobile ? 15 : 16,
              height: 1.6,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 40),

          // BOTÕES RESPONSIVOS
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _GradientButton(
                  text: "GitHub",
                  icon: Icons.code,
                  onTap: () => _launch(controller.github),
                ),
                const SizedBox(height: 14),
                _GradientButton(
                  text: "LinkedIn",
                  icon: Icons.work,
                  onTap: () => _launch(controller.linkedin),
                ),
                const SizedBox(height: 14),
                _OutlineButton(
                  text: "Email",
                  icon: Icons.mail,
                  onTap: () => _launch(
                    "https://mail.google.com/mail/?view=cm&fs=1&to=${controller.email}",
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                _GradientButton(
                  text: "GitHub",
                  icon: Icons.code,
                  onTap: () => _launch(controller.github),
                ),
                const SizedBox(width: 20),
                _GradientButton(
                  text: "LinkedIn",
                  icon: Icons.work,
                  onTap: () => _launch(controller.linkedin),
                ),
                const SizedBox(width: 20),
                _OutlineButton(
                  text: "Email",
                  icon: Icons.mail,
                  onTap: () => _launch(
                    "https://mail.google.com/mail/?view=cm&fs=1&to=${controller.email}",
                  ),
                ),
              ],
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

class _ProfileDecoration extends StatelessWidget {
  final double width;
  final double height;

  const _ProfileDecoration({
    this.width = 520,
    this.height = 620,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1000),
      child: Center(
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF9B59B6),
                Color(0xFFE91E8C),
              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(80),
              bottomRight: Radius.circular(80),
              topRight: Radius.circular(28),
              bottomLeft: Radius.circular(28),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE91E8C).withOpacity(0.20),
                blurRadius: 45,
                spreadRadius: 4,
              ),
            ],
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(74),
                bottomRight: Radius.circular(74),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(74),
                bottomRight: Radius.circular(74),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.asset(
                "images/profile.jpg",
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                isAntiAlias: true,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _GradientButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: const BoxConstraints(minWidth: 120),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF9B59B6),
              Color(0xFFE91E8C),
            ],
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _OutlineButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: const BoxConstraints(minWidth: 120),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF9B59B6),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

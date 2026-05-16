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

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 120),
      child: width > 900
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _buildTextContent(controller)),
                const SizedBox(width: 40),
                const Expanded(child: _ProfileDecoration()),
              ],
            )
          : Column(
              children: [
                _buildTextContent(controller),
                const SizedBox(height: 40),
                const _ProfileDecoration(),
              ],
            ),
    );
  }

  Widget _buildTextContent(HomeController controller) {
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
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            controller.role,
            style: const TextStyle(
              fontSize: 22,
              color: Color(0xFF8892A4),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            controller.summary,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 40),
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
                    "https://mail.google.com/mail/?view=cm&fs=1&to=${controller.email}"),
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
  const _ProfileDecoration();

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1000),
      child: Center(
        child: Container(
          width: 520,
          height: 620,
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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF9B59B6),
          ),
        ),
        child: Row(
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

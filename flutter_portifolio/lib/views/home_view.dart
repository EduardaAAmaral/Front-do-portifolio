import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return Scaffold(
      body: ListView.builder(
        itemCount: controller.projects.length,
        itemBuilder: (context, index) {
          final project = controller.projects[index];
          return ListTile(
            title: Text(project.title),
            subtitle: Text(project.description),
          );
        },
      ),
    );
  }
}
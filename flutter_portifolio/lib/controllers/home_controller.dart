import 'package:flutter/material.dart';
import '../models/project_model.dart';

class HomeController extends ChangeNotifier {
  final List<Project> _projects = [
    Project(
      title: "Portfolio",
      description: "Meu site pessoal",
      link: "https://meusite.com",
    ),
  ];

  List<Project> get projects => _projects;

  void addProject(Project project) {
    _projects.add(project);
    notifyListeners();
  }
}
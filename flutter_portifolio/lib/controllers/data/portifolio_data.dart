

import 'package:flutter_portifolio/models/education_model.dart';
import 'package:flutter_portifolio/models/experience_model.dart';
import 'package:flutter_portifolio/models/project_model.dart';
import 'package:flutter_portifolio/models/skill_model.dart';

class PortfolioData {
  static const String name = "Eduarda Alves Amaral";
  static const String role = "Flutter Developer | Mobile Developer";
  static const String location = "Rio Grande - RS";
  static const String email = "eduardaalvesamaral@gmail.com";
  static const String github = "https://github.com/SEU_GITHUB";
  static const String linkedin = "https://linkedin.com/in/SEU_LINKEDIN";
  static const String phone = "(53) 99956-0061";

  static const String summary =
      "Desenvolvedora Mobile com foco em Flutter (Dart), "
      "especializada na construção de aplicações cross-platform "
      "com interfaces modernas e responsivas. Experiência em UI/UX, "
      "integração com APIs REST e Clean Architecture.";

  
  static final List<Skill> skills = [
    Skill(name: "Flutter", level: 0.9, icon: "📱"),
    Skill(name: "Dart", level: 0.9, icon: "🎯"),
    Skill(name: "Firebase", level: 0.8, icon: "🔥"),
    Skill(name: "REST APIs", level: 0.85, icon: "🔗"),
    Skill(name: "Riverpod", level: 0.8, icon: "⚡"),
    Skill(name: "Bloc", level: 0.75, icon: "🧩"),
    Skill(name: "Provider", level: 0.8, icon: "📦"),
    Skill(name: "Clean Architecture", level: 0.8, icon: "🏗️"),
    Skill(name: "Git", level: 0.85, icon: "📚"),
    Skill(name: "Figma", level: 0.7, icon: "🎨"),
    Skill(name: "React Native", level: 0.65, icon: "⚛️"),
    Skill(name: "JavaScript", level: 0.7, icon: "💛"),
  ];

  
  static final List<Experience> experiences = [
    Experience(
      company: "Deep Pixel",
      role: "Estagiária Front-End",
      period: "Mai 2024 — Mar 2026",
      description:
          "Desenvolvimento de interfaces responsivas com foco em UX. "
          "Criação de protótipos no Figma, integração com APIs REST, "
          "testes automatizados (QA) e documentação técnica.",
    ),
    Experience(
      company: "BRISA",
      role: "Desenvolvedora Front-End Mobile",
      period: "Set 2025 — Fev 2026",
      description:
          "Desenvolvimento mobile com Flutter (Dart), Clean Architecture, "
          "integração com Firebase e APIs REST. Colaboração em equipe ágil com Scrum.",
    ),
    Experience(
      company: "ITEC",
      role: "Bolsa de Desenvolvimento",
      period: "Mai 2024 — Jun 2025",
      description:
          "App mobile e sistema web para saúde feminina usando Flutter e Dart. "
          "Foco em acessibilidade, usabilidade e experiência do usuário.",
    ),
    Experience(
      company: "Siapesq",
      role: "Estagiária Voluntária",
      period: "Abr 2024 — Ago 2024",
      description:
          "Manutenção de aplicação web com React.js, integração com APIs externas e dados geoespaciais.",
    ),
    Experience(
      company: "PET C3",
      role: "Bolsista",
      period: "Fev 2024 — Mai 2024",
      description:
          "Projeto de inclusão de calouros em lógica de programação e desenvolvimento de materiais educativos.",
    ),
  ];

 
  static final List<Project> projects = [
    Project(
      title: "Plataforma de Validação de Vendas",
      description:
          "App mobile com Flutter (Dart), navegação estruturada, "
          "gerenciamento de estado, Firebase e APIs REST.",
      link: "https://github.com/SEU_GITHUB",
      tech: ["Flutter", "Firebase", "REST API"],
    ),
    Project(
      title: "Cardápio Digital",
      description:
          "Aplicação web interativa com JavaScript e renderização dinâmica.",
      link: "https://github.com/SEU_GITHUB",
      tech: ["JavaScript", "HTML", "CSS"],
    ),
    Project(
      title: "Chat Interativo",
      description:
          "Chat em tempo real com comunicação assíncrona.",
      link: "https://github.com/SEU_GITHUB",
      tech: ["JavaScript", "WebSocket"],
    ),
    Project(
      title: "Aplicativo de Pedidos",
      description:
          "Aplicativo mobile com React Native e navegação entre telas.",
      link: "https://github.com/SEU_GITHUB",
      tech: ["React Native", "JavaScript"],
    ),
  ];

  
  static final List<Education> education = [
    Education(
      degree: "Mestrado em Engenharia de Computação",
      institution: "FURG — Universidade Federal do Rio Grande",
      year: "2026",
    ),
    Education(
      degree: "Graduação em Sistemas de Informação",
      institution: "FURG — Universidade Federal do Rio Grande",
      year: "2022 - 2025",
    ),
  ];

  
  static const List<String> softSkills = [
    "Trabalho em equipe",
    "Comunicação",
    "Organização",
    "Proatividade",
    "Resolução de problemas",
  ];
}
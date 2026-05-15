import 'package:flutter_portifolio/models/education_model.dart';
import 'package:flutter_portifolio/models/experience_model.dart';
import 'package:flutter_portifolio/models/project_model.dart';
import 'package:flutter_portifolio/models/skill_model.dart';

class PortfolioData {
  static const String name = "Eduarda Alves Amaral";
  static const String role = "Flutter Developer | Mobile Developer";
  static const String location = "Rio Grande - RS";
  static const String email = "eduardaalvesamaral@gmail.com";
  static const String github = "https://github.com/EduardaAAmaral";
  static const String linkedin = "https://www.linkedin.com/in/eduardaaamaral";
  static const String phone = "(53) 99956-0061";

  static const String summary =
      "Desenvolvedora Mobile Flutter com +3 anos de experiência em desenvolvimento "
      "mobile e front-end. Atuação com Flutter, Dart, Clean Architecture, Firebase, "
      "APIs REST, UI/UX e testes. Mais de 10 projetos entregues entre aplicações "
      "mobile e sistemas web, com foco em performance, usabilidade e interfaces "
      "responsivas.";

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
    Skill(name: "TDD", level: 0.7, icon: "🧪"),
    Skill(name: "Scrum", level: 0.8, icon: "🔄"),
    Skill(name: "Flutter DevTools", level: 0.75, icon: "🛠️"),
    Skill(name: "Java", level: 0.65, icon: "☕"),
    Skill(name: "Markdown", level: 0.75, icon: "📝"),
    Skill(name: "UI/UX", level: 0.8, icon: "🎨"),
  ];

  static const List<String> languages = [
    "Português — Nativo",
    "Inglês — Intermediário",
    "Espanhol — Básico",
  ];

  static final List<Experience> experiences = [
    Experience(
      company: "Deep Pixel",
      role: "Estagiária Front-End",
      period: "Mai 2024 — Mar 2026",
      description: "Desenvolvimento de interfaces responsivas com foco em UX. "
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
    Experience(
      company: "Ebserh",
      role: "Bolsista",
      period: "Fev 2023 — Fev 2024",
      description:
          "Atuação em pesquisa clínica e tecnologia aplicada à saúde, com levantamento "
          "de requisitos, testes de usabilidade, validação de dados e apoio à evolução "
          "de aplicativo voltado à avaliação de feridas.",
    ),
    Experience(
      company: "Universidade Federal do Rio Grande - FURG",
      role: "Bolsista Combi-lab C3",
      period: "Mar 2024 — Mai 2024",
      description:
          "Execução de simulações computacionais, organização de bases científicas, "
          "processamento de dados e documentação técnica em projetos de bioinformática.",
    ),
  ];

  static final List<Project> projects = [
    Project(
      title: "Plataforma de Validação de Vendas",
      description: "App mobile com Flutter (Dart), navegação estruturada, "
          "gerenciamento de estado, Firebase e APIs REST.",
      link: "https://github.com/SEU_GITHUB",
      tech: ["Flutter", "Firebase", "REST API"],
      image: "assets/images/imagem.jpg",
    ),
    Project(
      title: "Aplicativo de Saúde Feminina",
      description:
          "Aplicação mobile e dashboard web desenvolvidos com Flutter e Dart, "
          "com foco em acessibilidade, usabilidade, persistência local e integração com APIs.",
      link: "https://github.com/EduardaAAmaral",
      tech: ["Flutter", "Dart", "REST API", "UI/UX"],
      image: "assets/images/imagem.jpg",
    ),
    Project(
      title: "Cardápio Digital",
      description:
          "Aplicação web interativa com JavaScript e renderização dinâmica.",
      link: "https://github.com/SEU_GITHUB",
      tech: ["JavaScript", "HTML", "CSS"],
      image: "assets/images/imagem.jpg",
    ),
    Project(
      title: "Chat Interativo",
      description: "Chat em tempo real com comunicação assíncrona.",
      link: "https://github.com/SEU_GITHUB",
      tech: ["JavaScript", "WebSocket"],
      image: "assets/images/imagem.jpg",
    ),
    Project(
      title: "Aplicativo de Pedidos",
      description:
          "Aplicativo mobile com React Native e navegação entre telas.",
      link: "https://github.com/SEU_GITHUB",
      tech: ["React Native", "JavaScript"],
      image: "assets/images/imagem.jpg",
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

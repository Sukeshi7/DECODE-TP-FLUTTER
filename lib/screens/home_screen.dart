import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/session_notifier.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      key: const ValueKey('home_screen'),
      appBar: AppBar(
        title: const Text('Liste des produits'),
      ),
      backgroundColor: colorScheme.surface,
      body: const Placeholder(), // TODO: A implémenter
    );
  }
}

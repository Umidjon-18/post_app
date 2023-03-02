import 'package:flutter/material.dart';

class SavedFactsPage extends StatefulWidget {
  const SavedFactsPage({super.key});

  @override
  State<SavedFactsPage> createState() => _SavedFactsPageState();
}

class _SavedFactsPageState extends State<SavedFactsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Saved Facts Page"),
      ),
    );
  }
}

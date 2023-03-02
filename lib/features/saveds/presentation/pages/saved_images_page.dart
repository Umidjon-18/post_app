import 'package:flutter/material.dart';

class SavedImagesPage extends StatefulWidget {
  const SavedImagesPage({super.key});

  @override
  State<SavedImagesPage> createState() => _SavedImagesPageState();
}

class _SavedImagesPageState extends State<SavedImagesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Saved Images Page"),
      ),
    );
  }
}

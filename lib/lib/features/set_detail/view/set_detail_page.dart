import 'package:flutter/material.dart';

class SetDetailPage extends StatelessWidget {
  final String slug;
  const SetDetailPage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(slug)),
      body: const Center(
        child: Text('Audio player & details coming soon'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Set (Owner Only)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title'),
            const TextField(),
            const SizedBox(height: 12),
            const Text('Description'),
            const TextField(maxLines: 3),
            const SizedBox(height: 12),
            const Text('Tags (comma-separated)'),
            const TextField(),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Pick Cover')),
                const SizedBox(width: 12),
                ElevatedButton(onPressed: () {}, child: const Text('Pick Audio')),
              ],
            ),
            const Spacer(),
            FilledButton(onPressed: () {}, child: const Text('Upload Draft')),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sets = List.generate(8, (i) => {'title': 'Set #$i', 'slug': 'set-$i'});
    return Scaffold(
      appBar: AppBar(title: const Text('All Sets')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: sets.length,
        itemBuilder: (context, i) {
          final set = sets[i];
          return InkWell(
            onTap: () => context.go('/set/${set['slug']}'),
            child: Card(
              child: Center(child: Text(set['title'] as String)),
            ),
          );
        },
      ),
    );
  }
}

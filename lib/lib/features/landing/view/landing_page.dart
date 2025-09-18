import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, c) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('BACKDRP.FM', style: TextStyle(fontSize: 42, letterSpacing: 2)),
                  const SizedBox(height: 12),
                  const Text('Curated DJ sets. One owner. All vibes.', textAlign: TextAlign.center),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 12,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.go('/catalog'),
                        child: const Text('Browse Catalog'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // TODO: show subscribe dialog
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Subscribe coming soon')));
                        },
                        child: const Text('Subscribe'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Instagram')),
                      TextButton(onPressed: () {}, child: const Text('SoundCloud')),
                      TextButton(onPressed: () {}, child: const Text('Spotify')),
                      TextButton(onPressed: () {}, child: const Text('Apple Music')),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

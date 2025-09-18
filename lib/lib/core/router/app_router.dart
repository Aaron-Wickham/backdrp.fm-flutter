import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';
import '../../features/landing/view/landing_page.dart';
import '../../features/catalog/view/catalog_page.dart';
import '../../features/set_detail/view/set_detail_page.dart';
import '../../features/admin/upload/view/upload_page.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'landing',
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: '/catalog',
        name: 'catalog',
        builder: (context, state) => const CatalogPage(),
      ),
      GoRoute(
        path: '/set/:slug',
        name: 'set_detail',
        builder: (context, state) => SetDetailPage(slug: state.pathParameters['slug']!),
      ),
      GoRoute(
        path: '/admin/upload',
        name: 'admin_upload',
        builder: (context, state) => const UploadPage(),
      ),
    ],
  );
}

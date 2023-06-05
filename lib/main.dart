import 'package:finder/providers/bachelor_provider.dart';
import 'package:finder/screens/bachelor_likes.dart';
import 'package:finder/screens/bachelor_details.dart';
import 'package:flutter/material.dart';
import 'package:finder/screens/bachelor_main.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    ChangeNotifierProvider<BachelorProvider>(
      create: (context) => BachelorProvider(),
      child: const FinderApp(),
    ),
  );
}
// TODO : MultiProvider

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      name: 'main',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const BachelorMain();
      },
      routes: [
        GoRoute(
          name: 'details',
          path: 'details/:id',
          builder: (BuildContext context, GoRouterState state) {
            return BachelorDetails(id: int.parse(state.pathParameters['id']!));
          },
        ),
        GoRoute(
            name: 'likes',
            path: 'likes',
            builder: (BuildContext context, GoRouterState state) {
              return const BachelorLikes();
            })
      ],
    ),
  ],
);

class FinderApp extends StatelessWidget {
  const FinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Finder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

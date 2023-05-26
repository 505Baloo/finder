import 'package:finder/providers/bachelor_provider.dart';
import 'package:finder/screens/bachelor_details.dart';
import 'package:flutter/material.dart';
import 'package:finder/screens/bachelor_main.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BachelorProvider(), child: const FinderApp()));
}

// final GoRouter _router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const BachelorMain();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: 'details',
//           builder: (BuildContext context, GoRouterState state) {
//             return const BachelorDetails();
//           },
//         ),
//       ],
//     ),
//   ],
// );

class FinderApp extends StatelessWidget {
  const FinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BachelorMain(),
      title: 'Finder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

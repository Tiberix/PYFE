import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pyfe/theme_constants.dart';
import 'package:pyfe/view/createGame/create_game_screen.dart';
import 'package:pyfe/view/joinGame/join_screen.dart';
import 'package:pyfe/view/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pyfe/view/scribbel/scibble_main_vc.dart';
import 'firebase_options.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'PYFE',
      theme: ThemeData(
          textTheme: defaultText,
          useMaterial3: true,
          colorSchemeSeed: Colors.yellowAccent,
          brightness: Brightness.light),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return LoginPage();
        },
      ),
      GoRoute(
        path: '/createGame',
        builder: (BuildContext context, GoRouterState state) {
          return CreateGamePage();
        },
      ),
      GoRoute(
        path: '/joinGame',
        builder: (BuildContext context, GoRouterState state) {
          return JoinPage();
        },
      ),
      GoRoute(
        path: '/mainScribble',
        builder: (BuildContext context, GoRouterState state) {
          return const ScribbelMainPage();
        },
      ),
    ],
  );
}

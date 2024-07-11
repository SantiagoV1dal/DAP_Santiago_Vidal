import 'package:flutter_application_1/Pantallas/pantalla_principal.dart';
import 'package:flutter_application_1/Pantallas/pantalla_logueo.dart';
import 'package:flutter_application_1/Pantallas/card_screen.dart';
import 'package:flutter_application_1/entities/post.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
  GoRoute(
    path: '/login',
    builder: ((context, state) => const LoginScreen())
  ),
  GoRoute(
    path: '/home/:usuario',
    builder: (context, state) {
        final usuario = state.pathParameters['usuario'] as String; 
        return HomeScreen(usuario: usuario); 
      }
  ),
  GoRoute(
      path: '/card',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final list = extra['list'] as List<Post>;
        final pressed = extra['pressed'] as int;
        return CardScreen(list: list, pressed: pressed);
      },
    ),
  ],
);
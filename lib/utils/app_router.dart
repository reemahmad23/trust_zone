import 'package:go_router/go_router.dart';
import 'package:trust_zone/features/chat/presentation/views/chat_bot_view.dart';
import 'package:trust_zone/features/chat/presentation/views/chat_with_user.dart';
import 'package:trust_zone/features/chat/presentation/views/chats_view.dart';
import 'package:trust_zone/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static final  router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const ChatBotView(),

    ),
  ]
  );
}
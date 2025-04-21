import 'package:flutter/material.dart';
import 'package:trust_zone/features/chat/presentation/views/widgets/chat_view_body.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: ChatViewBody(),
    );
  }
}

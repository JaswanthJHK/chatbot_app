import 'package:ai_chatbot/presentation/widgets/chat_widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String title;
  final String? apiKey;
  const ChatScreen({super.key, required this.apiKey, required this.title});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ChatWidget(apiKey: widget.apiKey),
    );
  }
}
